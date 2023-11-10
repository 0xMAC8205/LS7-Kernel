; !!! This module only works with the Full
; Pixel Graphics mode.
; i.e. LS7 Computer Rev. 2 !!!

graphics_draw_rectangle:
            ; Graphics Draw Rectangle
            ; Draws a Rectangle Outline on the Screen

            ; Input:
            ; A  => BorderColor
            ; X  => X Start Position
            ; Y  => Y Start Position
            ; K1 => Rectangle Width
            ; K2 => Rectangle Height

            ; Output: (none)


            rts

graphics_draw_line:
            ; Graphics Draw Line
            ; Draws a line on the Screen

            ; Input:
            ; A  => FillColor
            ; X  => X Start Position
            ; Y  => Y Start Position
            ; K1 => X End Position
            ; K2 => Y End Position

            ; Output: (none)


            rts

graphics_draw_triangle:
            ; Graphics Draw Triangle
            ; Draws a Triangle Outline on the Screen

            ; Input: 
            ; A  => BorderColor
            ; X  => A X Position
            ; Y  => A Y Position
            ; K1 => B X Position
            ; K2 => B Y Position
            ; K3 => C X Position
            ; K4 => C X Position

            ; Output: (none)


            rts

graphics_draw_polygon:
            ; Graphics Draw Polygon
            ; Draws a Polygon Outline on the Screen,
            ; from a Coordinate List

            ; Input:
            ; A  => BorderColor
            ; X  => LOW List Pointer
            ; Y  => HIGH List Pointer
            
            ; Output: (none)


            rts

graphics_draw_text:
            ; Graphics Draw Text
            ; Draws Text on the Screen,
            ; with custom color and fond

            ; Input:
            ; A  => FillColor
            ; X  => X Position
            ; Y  => Y Position
            ; K1 => LOW String Pointer
            ; K2 => HIGH String Pointer
            ; K3 => LOW Font Pointer
            ; K4 => HIGH Font Pointer

            ; Output: (none)


            rts

graphics_fill_rectangle:
            ; Graphics Fill Rectangle
            ; Draws a Filled Rectangle on the Screen

            ; Input:
            ; A  => FillColor
            ; X  => X Start Position
            ; Y  => Y Start Position
            ; K1 => Rectangle Width
            ; K2 => Rectangle Height

            ; Output: (none)


            rts

graphics_fill_triangle:
            ; Graphics Draw Triangle
            ; Draws a Filled Triangle on the Screen

            ; Input: 
            ; A  => FillColor
            ; X  => A X Position
            ; Y  => A Y Position
            ; K1 => B X Position
            ; K2 => B Y Position
            ; K3 => C X Position
            ; K4 => C X Position

            ; Output: (none)


            rts

graphics_fill_polygon:
            ; Graphics Draw Polygon
            ; Draws a Filled Polygon on the Screen,
            ; from a Coordinate List

            ; Input:
            ; A  => FillColor
            ; X  => LOW List Pointer
            ; Y  => HIGH List Pointer

            ; Output: (none)


            rts

graphics_set_pixel:
            ; Graphics Set Pixel
            ; Sets the Pixel to a Color

            ; Input:
            ; A => FillColor
            ; X => X Position
            ; Y => Y Position

            ; Output: (none)


            rts
