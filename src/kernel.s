            .include "src/kernel/irq.s"
            .include "src/kernel/keyboard.s"
            .include "src/kernel/video.s"
            .include "src/kernel/string.s"
            .include "src/kernel/int.s"
            .include "src/kernel/event_handler.s"
            .include "src/kernel/memory_manager.s"
            .include "src/kernel/hardware.s"

kernel_init:
            rts 
            
            