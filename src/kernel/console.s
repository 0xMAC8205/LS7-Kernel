
console_write:
            ; Console Write (string)
            ; String will be written from a Pointer, 
            ; without a new line at the end

            ; Input:
            ; X => LOW Memory Pointer
            ; Y => HIGH Memory Pointer

            ; Output: (none)


            ; ToDo:
            ; Support for ASCII (0-32) Chars, Line feed etc.
            ; Support for Color codes => Maybe #$ff Indicator
            ; Return propper work addresses in X & Y
            ;

            stx z0
            sty z1

            ; y  => counter
            ; x  => X Coords
            ; K0 => Y Coords

console_write_loop:
            lda (z0), y
            iny
            cmp #$00
            beq console_write_return
            cpy #$00
            beq console_write_return

            phy

            lda #$30
            cmp cursor_x
            bcc console_write_skip_overflow
            stz cursor_x
            inc cursor_y

            lda #$20
            cmp cursor_y
            bcc console_write_skip_overflow

            lda #$00
            jsr console_scroll
            lda #$1f
            sta cursor_y

console_write_skip_overflow:
            ldx cursor_x
            ldy cursor_y
            jsr vram_write

            ; cursor checking bla bla

            inc cursor_x
            ply
            jmp console_write_loop

console_write_return:
            ; calc new address and put into xy
            lda z0
            ldx z1
            jsr int16_add_byte

            

            rts

console_write_static:
            ; Console Write Static (string)
            ; String will be written wich follows after
            ; the JSR call without a new line at the end

            ; Input:  (none)
            ; Output: (none)

            plx
            ply
            jsr console_write

            ; if return right
            phy
            phx

            rts

console_writeline:
            ; Console Writeline (string)
            ; Same as "console_write", except at
            ; the end, a new line begins

            ; Input:
            ; X => LOW Memory Pointer
            ; Y => HIGH Memory Pointer

            ; Output: (none)

            jsr console_write
            jsr console_return ; or new console_newline

            rts

console_writeline_static:
            ; Console Writeline Static (string)
            ; Same as "console_write_static", except at
            ; the end, a new line begins

            ; Input:  (none)
            ; Output: (none)


            rts

console_set_color:
            ; Console Set Color
            ; Sets the color, of the content
            ; that will be written, following

            ; Input:
            ; A => Color

            ; Output: (none)


            rts

console_set_foreground:
            ; Console Set Foreground
            ; Sets the Foreground color

            ; Input:
            ; A => Color

            ; Output: (none)


            rts

console_set_background:
            ; Console Set Background
            ; Sets the Background color
            
            ; Input:
            ; A => Color

            ; Output: (none)


            rts

console_read_line:
            ; Console Read Line
            ; Loops, till the Return key is pressed
            ; Output is stored in $300 => "Typebuffer"

            ; Input:  (none)
            ; Output: (none)


            rts

console_read_char:
            ; Console Read Char
            ; Loops, till a Key is pressed
            
            ; Input:  (none)

            ; Output:
            ; A <= Pressed Key as Char


            rts

console_set_cursor:
            ; Console Set Cursor
            ; Sets the Cursor Location

            ; Input:
            ; X => X Coordinate
            ; Y => Y Coordinate

            ; Output: (none)


            rts

console_get_cursor:
            ; Console Get Cursor
            ; Gets the Cursor Location

            ; Input:  (none)
            
            ; Output:
            ; X <= X Coordinate
            ; Y <= Y Coordinate


            rts

console_return:
            ; Console Return
            ; Sets the Cursor to it's line starting Position
            ; and if nessesary, scrolls it up and prints the Start Text

            ; Input:  (none)
            ; Output: (none)


            rts

console_scroll:
            ; Console Scroll
            ; Scrolls the screen in the given direction

            ; Input:
            ; A => Scroll Mode
            
            ; Output: (none)

            ; Syntax:
            ; (MSB)    0bxxxx0000   (LSB)
            ;                ||||
            ;                |||+-  0 = Scroll LEFT  1 = Scroll RIGHT      
            ;                |||
            ;                ||+--  0 = Scroll UP    1 = Scroll DOWN     
            ;                ||
            ;                |+---  0 = Dispose content & replace gap with Empty cells
            ;                |      1 = Wrap around
            ;                |
            ;                +----  0 = Scroll Text console Buffer   (Y 0 - 31)  (4k)
            ;                       1 = Scroll Entire console Buffer (Y 0 - 255) (32k)

            ; I.E => 0x03 (0b00001011) => Scrolls Entire consolebuffer Right & Up and 
            ;           Disposes "scrolled away" content. Fills gaps with empty cells


            rts

console_clear:
            ; Console Clear
            ; Clears the Screen blank, with the normal Color and #$20 Chars

            ; Input:  (none)
            ; Output: (none)

            ldx #$00
            ldy #$00

console_clear_loop:
            lda #$20
            jsr vram_write
            lda color
            jsr vram_write_color

            inx
            cpx #$30
            bne console_clear_loop
            ldx #$00
            iny
            cpy #$00
            bne console_clear_loop

            rts

console_reset_color:
            ; Console Reset Color
            ; Resets the Color to it's initial state

            ; Input:  (none)
            ; Output: (none)


            rts

console_reset:
            ; Console Reset
            ; Resets the console Display
            ; to it's initial state, i.e
            ; clears the screen, resets the Cursor etc...

            ; Input:  (none)
            ; Output: (none)


            rts

console_load_font:
            ; Console Load Font
            ; Loads a 2k BitMap font from a Pointer to VRAM

            ; Input:
            ; X => LOW Memory Pointer
            ; Y => HIGH Memory Pointer

            ; Output: (none)

            stx z0
            sty z1

            ldx #$78
            ldy #$00

console_load_font_loop:
            lda (z0)
            jsr vram_write
            inx
            inc z0
            bne console_load_font_check
            inc z1

console_load_font_check:
            cpx #$80
            bne console_load_font_loop
            ldx #$78
            iny
            cpy #$00
            bne console_load_font_loop
            
            rts