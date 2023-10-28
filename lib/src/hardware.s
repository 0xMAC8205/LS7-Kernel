
vram_write
            ; VRAM Write
            ; Writes A to the given Coordinate
            
            ; Input:
            ; A => Data
            ; X => X Coordinate
            ; Y => Y Coordinate

            ; Output:  (none)
            

;vram_write_color
            ; VRAM Write Color
            ; Writes A to the given Coordinate, but adds 0x40 to X

            ; Input:
            ; A => Data
            ; X => X Coordinate
            ; Y => Y Coordinate
            
            ; Output:  (none)


vram_read
            ; VRAM Read
            ; Reads Data from the given Coordinate

            ; Input:
            ; X => X Coordinate
            ; Y => Y Coordinate

            ; Output:
            ; A <= Data


vram_dump
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