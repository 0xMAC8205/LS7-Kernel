keyboard_scan:
            ; Keyboard Scan
            ; Scans the Keyboard matrix, and returns a Scan Code,
            ; the held Modifier Keys and Arrow Keys

            ; Input: (none)

            ; Output:
            ; A <= Scan Code
            ; X <= Modifier Keys
            ; Y <= Arrow Keys









            rts




            lda soft_system_register
            and #$f8
            sta soft_system_register
            sta system_register

            ldy #$00    ; Result Index
            ldx #$00    ; Row Counter

keyboard_scan_load:
            lda #$fe    ; Bit shifter

keyboard_scan_loop:
            cmp keyboard_port
            beq keyboard_scan_return
            iny
            rol
            cmp #$fe
            bne keyboard_scan_loop
            inx
            cpx #$08                            ; Checking if Counted to 7
            beq keyboard_scan_return
            

            inc soft_system_register
            lda soft_system_register
            sta system_register

            jmp keyboard_scan_load

keyboard_scan_return:
            sty k0
            lda soft_system_register
            ora #$05
            sta system_register
            lda keyboard_port
            tax
            and #$0f
            tay         ; => Arrow Keys
            txa
            rol
            rol
            rol
            rol
            and #$07

            tax         ; => Modifier Keys
            lda k0      ; => Scancode
            rts

keyboard_translate:
            ; Keyboard Translate
            ; Converts the Scan Code into lowercase ASCII

            ; Input:
            ; A => Scan Code

            ; Output:
            ; A <= ASCII Char


            rts

keyboard_format:
            ; Keyboard Format
            ; Formats the given ASCII Character to 
            ; Uppercase / Special Characters, for final use

            ; Input:
            ; A => ASCII Char
            ; X => Modifier Keys

            ; Output:
            ; A <= ASCII Char


            rts


keyboard_ascii_lookup:
            .byte $80 ; bla bla bla