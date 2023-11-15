            .include "src/kernel/irq.s"
            .include "src/kernel/keyboard.s"
            .include "src/kernel/video.s"
            .include "src/kernel/console.s"
            .include "src/kernel/graphics.s"
            .include "src/kernel/string.s"
            .include "src/kernel/int.s"
            .include "src/kernel/event_handler.s"
            .include "src/kernel/memory_manager.s"
            .include "src/kernel/hardware.s"
            


kernel_init:
            ; Kernel Init
            ; Initialises some Kernel parameters

            ; Input  : (none)
            ; Output : (none)

            stz kernel_stack_counter
            lda #<kernel_stack
            sta kernel_stack_pointer
            lda #>kernel_stack
            sta kernel_stack_pointer + 1

            rts