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