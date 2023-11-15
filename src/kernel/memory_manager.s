kernel_push_a:
            ; Kernel Push A
            ; Pushes the A Register to Kernel Stack

            ; Input:
            ; A => Data to Push

            ; Output: (none)

            sty kernel_stack_offload_1
            ldy kernel_stack_counter
            sta (kernel_stack_pointer), y
            inc kernel_stack_counter
            ldy kernel_stack_offload_1

            rts


kernel_push_x:
            ; Kernel Push X
            ; Pushes the X Register to Kernel Stack

            ; Input:
            ; X => Data to Push

            ; Output: (none)

            sty kernel_stack_offload_1
            sta kernel_stack_offload_2
            txa
            ldy kernel_stack_counter
            sta (kernel_stack_pointer), y
            tax
            inc kernel_stack_counter
            ldy kernel_stack_offload_1
            lda kernel_stack_offload_2

            rts


kernel_push_y:
            ; Kernel Push Y
            ; Pushes the Y Register to Kernel Stack

            ; Input:
            ; Y => Data to Push

            ; Output: (none)

            stx kernel_stack_offload_1
            sta kernel_stack_offload_2
            tya
            ldy kernel_stack_counter
            sta (kernel_stack_pointer), y
            tay
            inc kernel_stack_counter
            ldx kernel_stack_offload_1
            lda kernel_stack_offload_2

            rts


kernel_pull_a:
            ; Kernel Pull A
            ; Pulls the Current Index Data
            ; of the Kernel Stack to A

            ; Input:  (none)

            ; Output:
            ; A <= Pulled Data

            sty kernel_stack_offload_1
            ldy kernel_stack_counter
            lda (kernel_stack_pointer), y
            dec kernel_stack_pointer
            ldy kernel_stack_offload_1

            rts


kernel_pull_x:
            ; Kernel Pull X
            ; Pulls the Current Index Data
            ; of the Kernel Stack to X

            ; Input:  (none)

            ; Output:
            ; X <= Pulled Data

            sty kernel_stack_offload_1
            sta kernel_stack_offload_2
            ldy kernel_stack_counter
            lda (kernel_stack_pointer), y
            tax
            dec kernel_stack_pointer
            ldy kernel_stack_offload_1
            lda kernel_stack_offload_2
            rts


kernel_pull_y:
            ; Kernel Pull Y
            ; Pulls the Current Index Data
            ; of the Kernel Stack to Y

            ; Input:  (none)

            ; Output:
            ; Y <= Pulled Data

            sta kernel_stack_offload_1
            ldy kernel_stack_counter
            lda (kernel_stack_pointer), y
            tay
            dec kernel_stack_pointer
            lda kernel_stack_offload_1

            rts