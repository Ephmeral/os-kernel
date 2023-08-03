#include "console.h"
#include "defs.h"
#include "trap.h"
#include "loader.h"
#include "timer.h"

extern char s_text[];
extern char e_text[];
extern char s_rodata[];
extern char e_rodata[];
extern char s_data[];
extern char e_data[];
extern char s_bss[];
extern char e_bss[];

void clean_bss() {
    char *p;
    for (p = s_bss; p < e_bss; ++p) {
        *p = 0;
    }
}

void main() {
    // errorf("stext: %p", s_text);
    // warnf("etext: %p", e_text);
    // infof("sroda: %p", s_rodata);
    // debugf("eroda: %p", e_rodata);
    // debugf("sdata: %p", s_data);
    // infof("edata: %p", e_data);
    // warnf("sbss : %p", s_bss);
    // errorf("ebss : %p", e_bss);
	clean_bss();
	proc_init();
	loader_init();
	trap_init();
	timer_init();
	run_all_app();
	infof("start scheduler!");
	scheduler();
}
