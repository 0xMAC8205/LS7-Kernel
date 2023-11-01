irq_init:
            ; IRQ Init
            ; Initialises the VIA to be resetted into a normal state and
            ; to generate a constand IRQ Tick (Timer 1)

            ; Input:
            ; A => Timer 1 Tick Rate (MSB)

            ; Output: (none)

            sta t1ch
            
            lda #$40
            sta acr
            stz t1cl
            lda #$00
            sta ier
            cli

            rts

irq:
            ; IRQ
            ; This is the Standart IRQ Routine
            ; It scans the Keyboard, invokes the Tick Event Handler
            ; and does some other, housekeeping stuff

            ; Input:  (none)
            ; Output: (none)


            php         ; Save Processor Status, A, X and Y
            sta irq_a
            stx irq_x
            sty irq_y



            bit t1cl    ; "Ping" VIA Timer, to trigger Restart
            lda irq_a   ; Restore A, X, Y and Processor Status
            ldx irq_x
            ldy irq_y
            plp

            rti