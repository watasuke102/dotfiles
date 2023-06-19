set auto-load safe-path /
set disassembly-flavor intel
set print pretty on
set confirm off

source ~/.gdb-dashboard
dashboard -layout breakpoints expressions history memory source assembly registers stack variables
dashboard variables -style compact False
dashboard registers -style list \
'rax rbx rcx rdx rsi rdi rbp rsp r8 r9 r10 r11 r12 r13 r14 r15 rip sp eflags cs ss cr0 cr2 cr3 cr4 cr8'
