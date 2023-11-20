
vram_write:
            ; VRAM Write
            ; Writes A to the given Coordinate
            
            ; Input:
            ; A => Data
            ; X => X Coordinate
            ; Y => Y Coordinate

            ; Output:  (none)

                        ; Load Data into Registers
            stx vidx    ; Sets Read Mode, load X Coord
            sty vidy    ; load Y Coord
            sta vidd    ; Set Write Mode, load Data
            nop         ; Wait a bit...
            nop
            nop
            nop
            stx vidx    ; Sets Read Mode

            rts
            

vram_write_color:
            ; VRAM Write Color
            ; Writes A to the given Coordinate, but adds 0x40 to X

            ; Input:
            ; A => Data
            ; X => X Coordinate
            ; Y => Y Coordinate
            
            ; Output:  (none)

            ; I'm deliberately NOT using the Kernel Stack here,
            ; for more speed and efficiency and because it's just two Bytes ;)
            
            phx         ; Push X to Stack
            pha         ; Push A to Stack
            txa         ; Transfer X to A for Math
            clc
            adc #$40    ; Add #$40 (Color Range)
            plx         ; Pop Stack to X

                        ; Load Data into Registers
            sta vidx    ; Sets Read Mode, load X Coord
            sty vidy    ; load Y Coord
            stx vidd    ; Set Write Mode, load Data
            nop         ; Wait a bit...
            nop
            nop
            nop
            sta vidx    ; Sets Read Mode
            txa
            plx

            rts

vram_read:
            ; VRAM Read
            ; Reads Data from the given Coordinate

            ; Input:
            ; X => X Coordinate
            ; Y => Y Coordinate

            ; Output:
            ; A <= Data

                        ; Load Data into Registers
            stx vidx    ; Set to Read Mode, load X Coord
            sty vidy    ; load Y Coords
            nop         ; Wait a bit...
            nop
            nop
            nop
            lda vidd    ; Load Data

            rts

vram_dump:
            ; VRAM Dump
            ; Dumps all bytes from VRAM in the given Range
            ; to a specified Memory Adress

            ; Input:
            ; X  => Start X Coordinate
            ; Y  => Start Y Coordnate
            ; K1 => End X Coordinate
            ; K2 => End Y Coordinate
            ; K3 => LOW Memory Pointer
            ; K4 => HIGH Memory Pointer

            ; Output: (none) 


            rts

beep:
            ; Beep
            ; Beeps the main speaker

            ; Input:
            ; A => Beep Duration

            ; Output: (none)

            sta beep_counter

            rts

set_activity_led:
            ; Set Activity LED
            ; Sets the Activity LED Constant

            ; Input:
            ; A => State

            ; Output: (none)

            rts

set_user_led:
            ; Set User LED
            ; Sets the User LED Constant

            ; Input:
            ; A => State

            ; Output: (none)

            rts

set_activity_led_duration:
            ; Set Activity LED Duration
            ; Sets the Time (in Ticks),
            ; where the Activity LED is HIGH

            ; Input:
            ; A => Duration

            ; Output: (none)

            rts

set_user_led_duration:
            ; Set User LED Duration
            ; Sets the Time (in Ticks),
            ; where the User LED is HIGH

            ; Input:
            ; A => Duration

            ; Output: (none)

            rts

expansion_get:
            ; Expansion Get
            ; Gets Data from the Selected Expansion port,
            ; at the given Port-Address

            ; Input:
            ; X => Port Number
            ; Y => Port Address

            ; Output:
            ; A <= Read Data

            rts

expansion_set:
            ; Expansion Set
            ; Sets Data from the Selected Expansion port,
            ; at the given Port-Address

            ; Input:
            ; A => Data
            ; X => Port Number
            ; Y => Port Address

            ; Output: (none)

            rts