irq_init:
            ; IRQ Init
            ; Initialises the VIA to be resetted into a normal state and
            ; to generate a constand IRQ Tick (Timer 1)

            ; Input:
            ; A => Timer 1 Tick Rate (MSB)

            ; Output: (none)

            ldx #$40
            stx acr
            stz t1cl
            sta t1ch
            ldx #$c0
            stx ier
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


            jsr keyboard_scan
            phx
            phy

            ldx #$11
            ldy #$11
            jsr vram_write

            pla
            inx
            jsr vram_write

            pla
            inx
            jsr vram_write

            bit t1cl    ; "Ping" VIA Timer, to trigger Restart
            lda irq_a   ; Restore A, X, Y and Processor Status
            ldx irq_x
            ldy irq_y
            plp
            rti