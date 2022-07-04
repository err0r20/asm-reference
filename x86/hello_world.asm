.global _start
.intel_syntax           # Means we're writing this in intel syntax, of course
.section .text          # Tells the assembler that anything south of this line is readable and executable, not writeable

_start:

        mov %eax, 4             # Write syscall
        mov %ebx, 1             # Tells ebx we are writing to STDOUT, which is 1
        lea %ecx, [message]     # lea is "load effective address", we are pointig to message before we invoke the syscall
        mov %edx, 13            # The size of our string
        int 0x80

        mov %eax, 1     # Exit syscall
        mov %ebx, 64    # Exit status for our program
        int 0x80

.section .data          # Tells the assembler anything here is readable and writeable, not executable

        message:
        .ascii "Hello, World\n"
