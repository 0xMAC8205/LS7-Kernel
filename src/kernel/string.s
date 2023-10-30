string_to_lower:
            ; String To Lower
            ; Converts the given string to Lowercase

            ; Input:
            ; X => LOW Memory Pointer
            ; Y => HIGH Memory Pointer

            ; Output: (none)


            rts

string_to_upper:
            ; String To Upper
            ; Converts the given string to Uppercase

            ; Input:
            ; X => LOW Memory Pointer
            ; Y => HIGH Memory Pointer

            ; Output: (none)


            rts

string_count:
            ; String Count
            ; Counts the Characters in the given String

            ; Input:
            ; X => LOW Memory Pointer
            ; Y => HIGH Memory Pointer
            
            ; Output:
            ; A <= Count


            rts

string_flip:
            ; String Flip
            ; Reverses the given String

            ; Input:
            ; X => LOW Memory Pointer
            ; Y => HIGH Memory Pointer
            
            ; Output: (none)


            rts

string_contains:
            ; String Contains
            ; Checks if a String is contained in the given String

            ; Input:
            ; K0 => LOW Memory Pointer   Shorter String
            ; K1 => HIGH Memory Pointer  Shorter String
            ; X  => LOW Memory Pointer   Longer String
            ; Y  => HIGH Memory Pointer  Longer String

            ; Output:
            ; A <= 0 if False, 1 if True


            rts

string_equals:
            ; String Equals
            ; Checks if a String is equal to the given String

            ; Input:
            ; K0 => LOW Memory Pointer   String A
            ; K1 => HIGH Memory Pointer  String A
            ; X  => LOW Memory Pointer   String B 
            ; Y  => HIGH Memory Pointer  String B

            ; Output:
            ; A <= 0 if False, 1 if True


            rts

is_string:
            ; Is String
            ; Checks if the given String contains valid Chars

            ; Input:
            ; X => LOW Memory Pointer
            ; Y => HIGH Memory Pointer
            ; A => Max. String Length

            ; Output:
            ; A <= 0 if False, 1 if True


            rts
            