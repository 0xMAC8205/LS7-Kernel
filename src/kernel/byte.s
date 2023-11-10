byte_flip:
            ; Byte Flip
            ; Flips the Byte around
            ; Position 0 gets swapped with 7
            ; Position 1 gets swapped with 6 and so on...

            ; Input:
            ; A => Data
            
            ; Output:
            ; A <= Data


            rts

byte_swap:
            ; Byte Swap
            ; Swaps the first 4 bits of the Byte
            ; 0x0f (0b0000ffff) => 0xf0 (0bffff0000)

            ;         +----------+
            ;         |          |
            ; 0xcb    | (0b1100 1011)
            ;         |     |
            ;         |     +----+
            ;         +----+     |
            ;              v     v
            ; 0xbc      (0b1011 1100)

            ; Input:
            ; A => Data
            
            ; Output:
            ; A <= Data


            rts

byte_drill:
            ; Byte Drill
            ; Converts two ASCII Characters, decoded in HEX to a byte
            ; Not Case sensitive

            ; Input:
            ; A => First ASCII 
            ; X => Last ASCII
            
            ; Output:
            ; A <= Converted Byte
            
            ; First Char => "FF" <= Last Char


            rts