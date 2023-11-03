
video_write:
            ; Video Write (string)
            ; String will be written from a Pointer, 
            ; without a new line at the end

            ; Input:
            ; X => LOW Memory Pointer
            ; Y => HIGH Memory Pointer

            ; Output: (none)

            stx z0
            sty z1

            ; y  => counter
            ; x  => X Coords
            ; K0 => Y Coords

video_write_loop:
            lda (z0), y
            iny
            cmp #$00
            beq video_write_return
            cpy #$00
            beq video_write_return

            phy

            lda #$30
            cmp cursor_x
            bcc video_write_skip_overflow
            stz cursor_x
            inc cursor_y

            lda #$20
            cmp cursor_y
            bcc video_write_skip_overflow

            lda #$00
            jsr video_scroll
            lda #$1f
            sta cursor_y

video_write_skip_overflow:
            ldx cursor_x
            ldy cursor_y
            jsr vram_write

            ; cursor checking bla bla

            inc cursor_x
            ply
            jmp video_write_loop

video_write_return:
            ; calc new address and put into xy
            lda z0
            ldx z1
            jsr int16_add_byte

            

            rts

video_write_static:
            ; Video Write Static (string)
            ; String will be written wich follows after
            ; the JSR call without a new line at the end

            ; Input:  (none)
            ; Output: (none)

            plx
            ply
            jsr video_write

            ; if return right
            phy
            phx

            rts

video_writeline:
            ; Video Writeline (string)
            ; Same as "video_write", except at
            ; the end, a new line begins

            ; Input:
            ; X => LOW Memory Pointer
            ; Y => HIGH Memory Pointer

            ; Output: (none)

            jsr video_write
            jsr video_return ; or new video_newline

            rts

video_writeline_static:
            ; Video Writeline Static (string)
            ; Same as "video_write_static", except at
            ; the end, a new line begins

            ; Input:  (none)
            ; Output: (none)


            rts

video_set_color:
            ; Video Set Color
            ; Sets the color, of the content
            ; that will be written, following

            ; Input:
            ; A => Color

            ; Output: (none)


            rts

video_set_foreground:
            ; Video Set Foreground
            ; Sets the Foreground color

            ; Input:
            ; A => Color

            ; Output: (none)


            rts

video_set_background:
            ; Video Set Background
            ; Sets the Background color
            
            ; Input:
            ; A => Color

            ; Output: (none)


            rts

video_read_line:
            ; Video Read Line
            ; Loops, till the Return key is pressed
            ; Output is stored in $300 => "Typebuffer"

            ; Input:  (none)
            ; Output: (none)


            rts

video_read_char:
            ; Video Read Char
            ; Loops, till a Key is pressed
            
            ; Input:  (none)

            ; Output:
            ; A <= Pressed Key as Char


            rts

video_set_cursor:
            ; Video Set Cursor
            ; Sets the Cursor Location

            ; Input:
            ; X => X Coordinate
            ; Y => Y Coordinate

            ; Output: (none)


            rts

video_get_cursor:
            ; Video Get Cursor
            ; Gets the Cursor Location

            ; Input:  (none)
            
            ; Output:
            ; X <= X Coordinate
            ; Y <= Y Coordinate


            rts

video_return:
            ; Video Return
            ; Sets the Cursor to it's line starting Position
            ; and if nessesary, scrolls it up and prints the Start Text

            ; Input:  (none)
            ; Output: (none)


            rts

video_scroll:
            ; Video Scroll
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
            ;                +----  0 = Scroll Text Video Buffer   (Y 0 - 31)  (4k)
            ;                       1 = Scroll Entire Video Buffer (Y 0 - 255) (32k)

            ; I.E => 0x03 (0b00001011) => Scrolls Entire Videobuffer Right & Up and 
            ;           Disposes "scrolled away" content. Fills gaps with empty cells


            rts

video_clear:
            ; Video Clear
            ; Clears the Screen blank, with the normal Color and #$20 Chars

            ; Input:  (none)
            ; Output: (none)

            ldx #$00
            ldy #$00

video_clear_loop:
            lda #$20
            jsr vram_write
            lda color
            jsr vram_write_color

            inx
            cpx #$30
            bne video_clear_loop
            ldx #$00
            iny
            cpy #$00
            bne video_clear_loop

            rts

video_reset_color:
            ; Video Reset Color
            ; Resets the Color to it's initial state

            ; Input:  (none)
            ; Output: (none)


            rts

video_reset:
            ; Video Reset
            ; Resets the Video Display
            ; to it's initial state, i.e
            ; clears the screen, resets the Cursor etc...

            ; Input:  (none)
            ; Output: (none)


            rts

video_load_font:
            ; Video Load Font
            ; Loads a 2k BitMap font from a Pointer to VRAM

            ; Input:
            ; X => LOW Memory Pointer
            ; Y => HIGH Memory Pointer

            ; Output: (none)

            stx z0
            sty z1

            ldx #$78
            ldy #$00

video_load_font_loop:
            lda (z0)
            jsr vram_write
            inx
            inc z0
            bne video_load_font_check
            inc z1

video_load_font_check:
            cpx #$80
            bne video_load_font_loop
            ldx #$78
            iny
            cpy #$00
            bne video_load_font_loop
            
            rts