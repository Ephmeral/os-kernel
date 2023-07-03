.PHONY: clean build user
all: build_kernel

LOG ?= error

K = os

TOOLPREFIX = riscv64-unknown-elf-
CC = $(TOOLPREFIX)gcc
AS = $(TOOLPREFIX)gcc
LD = $(TOOLPREFIX)ld
OBJCOPY = $(TOOLPREFIX)objcopy
OBJDUMP = $(TOOLPREFIX)objdump
PY = python3
GDB = $(TOOLPREFIX)gdb
CP = cp
MKDIR_P = mkdir -p

BUILDDIR = build
C_SRCS = $(wildcard $K/*.c)
AS_SRCS = $(wildcard $K/*.S)
C_OBJS = $(addprefix $(BUILDDIR)/, $(addsuffix .o, $(basename $(C_SRCS))))
AS_OBJS = $(addprefix $(BUILDDIR)/, $(addsuffix .o, $(basename $(AS_SRCS))))
OBJS = $(C_OBJS) $(AS_OBJS)

HEADER_DEP = $(addsuffix .d, $(basename $(C_OBJS)))

-include $(HEADER_DEP)

CFLAGS = -Wall -Werror -O -fno-omit-frame-pointer -ggdb
CFLAGS += -MD
CFLAGS += -mcmodel=medany
CFLAGS += -ffreestanding -fno-common -nostdlib -mno-relax
CFLAGS += -I$K
CFLAGS += $(shell $(CC) -fno-stack-protector -E -x c /dev/null >/dev/null 2>&1 && echo -fno-stack-protector)

ifeq ($(LOG), error)
CFLAGS += -D LOG_LEVEL_ERROR
else ifeq ($(LOG), warn)
CFLAGS += -D LOG_LEVEL_WARN
else ifeq ($(LOG), info)
CFLAGS += -D LOG_LEVEL_INFO
else ifeq ($(LOG), debug)
CFLAGS += -D LOG_LEVEL_DEBUG
else ifeq ($(LOG), trace)
CFLAGS += -D LOG_LEVEL_TRACE
endif

# Disable PIE when possible (for Ubuntu 16.10 toolchain)
ifneq ($(shell $(CC) -dumpspecs 2>/dev/null | grep -e '[^f]no-pie'),)
CFLAGS += -fno-pie -no-pie
endif
ifneq ($(shell $(CC) -dumpspecs 2>/dev/null | grep -e '[^f]nopie'),)
CFLAGS += -fno-pie -nopie
endif

LDFLAGS = -z max-page-size=4096

$(AS_OBJS): $(BUILDDIR)/$K/%.o : $K/%.S
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -c $< -o $@

$(C_OBJS): $(BUILDDIR)/$K/%.o : $K/%.c  $(BUILDDIR)/$K/%.d
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -c $< -o $@

$(HEADER_DEP): $(BUILDDIR)/$K/%.d : $K/%.c
	@mkdir -p $(@D)
	@set -e; rm -f $@; $(CC) -MM $< $(INCLUDEFLAGS) > $@.$$$$; \
        sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
        rm -f $@.$$$$

os/link_app.o: $K/link_app.S
os/link_app.S: scripts/pack.py
	@$(PY) scripts/pack.py
os/kernel_app.ld: scripts/kernelld.py
	@$(PY) scripts/kernelld.py

build: build/kernel

build/kernel: $(OBJS) os/kernel_app.ld
	$(LD) $(LDFLAGS) -T os/kernel_app.ld -o $(BUILDDIR)/kernel $(OBJS)
	$(OBJDUMP) -S $(BUILDDIR)/kernel > $(BUILDDIR)/kernel.asm
	$(OBJDUMP) -t $(BUILDDIR)/kernel | sed '1,/SYMBOL TABLE/d; s/ .* / /; /^$$/d' > $(BUILDDIR)/kernel.sym
	@echo 'Build kernel done'

clean:
	rm -rf $(BUILDDIR)

# BOARD
BOARD		?= qemu
SBI			?= opensbi
BOOTLOADER	:= ./bootloader/opensbi.bin

# try to generate a unique GDB port
GDBPORT = $(shell expr `id -u` % 5000 + 25000)
# QEMU's gdb stub command line changed in 0.11
QEMUGDB = $(shell if $(QEMU) -help | grep -q '^-gdb'; \
	then echo "-gdb tcp::$(GDBPORT)"; \
	else echo "-s -p $(GDBPORT)"; fi)
ifndef CPUS
CPUS := 3
endif
ifeq ($(LAB),fs)
CPUS := 1
endif

QEMU = qemu-system-riscv64
QEMUOPTS = \
	-nographic \
	-machine virt \
	-bios $(BOOTLOADER) \
	-kernel build/kernel -m 128M -smp $(CPUS)\

run: build/kernel
	$(QEMU) $(QEMUOPTS)

.gdbinit: .gdbinit
	sed "s/:1234/:$(GDBPORT)/" < $^ > $@

qemu-gdb: build/kernel .gdbinit 
	@echo "*** Now run 'gdb-multiarch' in another window." 1>&2
	$(QEMU) $(QEMUOPTS) -S $(QEMUGDB)


user:
	make -C $(U) CHAPTER=$(CHAPTER) BASE=$(BASE)

test: user run