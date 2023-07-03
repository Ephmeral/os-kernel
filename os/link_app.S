    .align 4
    .section .data
    .global _app_num
_app_num:
    .quad 35
    .quad app_0_start
    .quad app_1_start
    .quad app_2_start
    .quad app_3_start
    .quad app_4_start
    .quad app_5_start
    .quad app_6_start
    .quad app_7_start
    .quad app_8_start
    .quad app_9_start
    .quad app_10_start
    .quad app_11_start
    .quad app_12_start
    .quad app_13_start
    .quad app_14_start
    .quad app_15_start
    .quad app_16_start
    .quad app_17_start
    .quad app_18_start
    .quad app_19_start
    .quad app_20_start
    .quad app_21_start
    .quad app_22_start
    .quad app_23_start
    .quad app_24_start
    .quad app_25_start
    .quad app_26_start
    .quad app_27_start
    .quad app_28_start
    .quad app_29_start
    .quad app_30_start
    .quad app_31_start
    .quad app_32_start
    .quad app_33_start
    .quad app_34_start
    .quad app_34_end

    .global _app_names
_app_names:
   .string "ch2b_exit"
   .string "ch2b_hello_world"
   .string "ch2b_power"
   .string "ch3b_sleep"
   .string "ch3b_sleep1"
   .string "ch3b_yield0"
   .string "ch3b_yield1"
   .string "ch3b_yield2"
   .string "ch5b_exec_simple"
   .string "ch5b_exit"
   .string "ch5b_forktest0"
   .string "ch5b_forktest1"
   .string "ch5b_forktest2"
   .string "ch5b_getpid"
   .string "ch5b_usertest"
   .string "ch6b_args"
   .string "ch6b_assert"
   .string "ch6b_cat"
   .string "ch6b_exec"
   .string "ch6b_filetest"
   .string "ch6b_filetest_simple"
   .string "ch6b_panic"
   .string "ch6b_usertest"
   .string "ch7b_pipetest"
   .string "ch7b_usertest"
   .string "ch8b_mpsc_sem"
   .string "ch8b_mut_phi_din"
   .string "ch8b_mut_race"
   .string "ch8b_spin_mut_race"
   .string "ch8b_sync_sem"
   .string "ch8b_test_condvar"
   .string "ch8b_threads"
   .string "ch8b_threads_arg"
   .string "ch8b_usertest"
   .string "usershell"

    .section .data.app0
    .global app_0_start
app_0_start:
    .incbin "./user/target/bin/ch2b_exit"

    .section .data.app1
    .global app_1_start
app_1_start:
    .incbin "./user/target/bin/ch2b_hello_world"

    .section .data.app2
    .global app_2_start
app_2_start:
    .incbin "./user/target/bin/ch2b_power"

    .section .data.app3
    .global app_3_start
app_3_start:
    .incbin "./user/target/bin/ch3b_sleep"

    .section .data.app4
    .global app_4_start
app_4_start:
    .incbin "./user/target/bin/ch3b_sleep1"

    .section .data.app5
    .global app_5_start
app_5_start:
    .incbin "./user/target/bin/ch3b_yield0"

    .section .data.app6
    .global app_6_start
app_6_start:
    .incbin "./user/target/bin/ch3b_yield1"

    .section .data.app7
    .global app_7_start
app_7_start:
    .incbin "./user/target/bin/ch3b_yield2"

    .section .data.app8
    .global app_8_start
app_8_start:
    .incbin "./user/target/bin/ch5b_exec_simple"

    .section .data.app9
    .global app_9_start
app_9_start:
    .incbin "./user/target/bin/ch5b_exit"

    .section .data.app10
    .global app_10_start
app_10_start:
    .incbin "./user/target/bin/ch5b_forktest0"

    .section .data.app11
    .global app_11_start
app_11_start:
    .incbin "./user/target/bin/ch5b_forktest1"

    .section .data.app12
    .global app_12_start
app_12_start:
    .incbin "./user/target/bin/ch5b_forktest2"

    .section .data.app13
    .global app_13_start
app_13_start:
    .incbin "./user/target/bin/ch5b_getpid"

    .section .data.app14
    .global app_14_start
app_14_start:
    .incbin "./user/target/bin/ch5b_usertest"

    .section .data.app15
    .global app_15_start
app_15_start:
    .incbin "./user/target/bin/ch6b_args"

    .section .data.app16
    .global app_16_start
app_16_start:
    .incbin "./user/target/bin/ch6b_assert"

    .section .data.app17
    .global app_17_start
app_17_start:
    .incbin "./user/target/bin/ch6b_cat"

    .section .data.app18
    .global app_18_start
app_18_start:
    .incbin "./user/target/bin/ch6b_exec"

    .section .data.app19
    .global app_19_start
app_19_start:
    .incbin "./user/target/bin/ch6b_filetest"

    .section .data.app20
    .global app_20_start
app_20_start:
    .incbin "./user/target/bin/ch6b_filetest_simple"

    .section .data.app21
    .global app_21_start
app_21_start:
    .incbin "./user/target/bin/ch6b_panic"

    .section .data.app22
    .global app_22_start
app_22_start:
    .incbin "./user/target/bin/ch6b_usertest"

    .section .data.app23
    .global app_23_start
app_23_start:
    .incbin "./user/target/bin/ch7b_pipetest"

    .section .data.app24
    .global app_24_start
app_24_start:
    .incbin "./user/target/bin/ch7b_usertest"

    .section .data.app25
    .global app_25_start
app_25_start:
    .incbin "./user/target/bin/ch8b_mpsc_sem"

    .section .data.app26
    .global app_26_start
app_26_start:
    .incbin "./user/target/bin/ch8b_mut_phi_din"

    .section .data.app27
    .global app_27_start
app_27_start:
    .incbin "./user/target/bin/ch8b_mut_race"

    .section .data.app28
    .global app_28_start
app_28_start:
    .incbin "./user/target/bin/ch8b_spin_mut_race"

    .section .data.app29
    .global app_29_start
app_29_start:
    .incbin "./user/target/bin/ch8b_sync_sem"

    .section .data.app30
    .global app_30_start
app_30_start:
    .incbin "./user/target/bin/ch8b_test_condvar"

    .section .data.app31
    .global app_31_start
app_31_start:
    .incbin "./user/target/bin/ch8b_threads"

    .section .data.app32
    .global app_32_start
app_32_start:
    .incbin "./user/target/bin/ch8b_threads_arg"

    .section .data.app33
    .global app_33_start
app_33_start:
    .incbin "./user/target/bin/ch8b_usertest"

    .section .data.app34
    .global app_34_start
app_34_start:
    .incbin "./user/target/bin/usershell"
app_34_end:

