video_clear:
            ; Video Clear
            ; Clears the Screen, black

            ; Input:  (none)
            ; Output: (none)


            rts

video_copy_memory:
            ; Video Copy Memory
            ; Sets the Pixel to a Color

            ; Input:
            ; A  => Horizontal Wrap
            ; X  => X Start Position
            ; Y  => Y Start Position
            ; K1 => X End Position
            ; K2 => Y End Position
            ; K3 => LOW Memory Pointer
            ; K4 => HIGH Memory Pointer

            ; Output:
            ; X <= LOW Memory Pointer (end)
            ; Y <= HIGH Memory Pointer (end)


            rts

video_set_mode:
            ; Video Set Mode
            ; Sets the Video Mode to
            ; 0 => Text; 1 => Graphics

            ; Input:
            ; A => Mode

            ; Output: (none)


            rts

video_get_mode:
            ; Video Get Mode
            ; Gets the Video mode
            ; 0 => Text; 1 => Graphics

            ; Input: (none)
            ; Output:
            ; A <= Mode


            rts

video_set_accent:
            ; Video Set Accent
            ; Sets the Video Card's Accent

            ; Input:
            ; A => Accent

            ; Output: (none)


            rts

video_get_accent:
            ; Video Get Accent
            ; Gets the Video Card's Accent

            ; Input: (none)
            ; Output:
            ; A <= Accent


            rts
