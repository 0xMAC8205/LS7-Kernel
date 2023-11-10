event_invoke:
            ; Event Invoke
            ; Invokes the Event, as a list of Sub-Routines,
            ; Starting at the pointer

            ; Input:
            ; K0 => LOW Event-List Pointer
            ; K1 => HIGH Event-List Pointer
            ; A  => A Event Carry
            ; X  => X Event Carry
            ; Y  => Y Evet Carry
            
            ; Output: (none)


            rts

event_append:
            ; Event Append
            ; Appens the given Adress to the given Event-List

            ; Input:
            ; K0 => LOW Event-List Pointer
            ; K1 => HIGH Event-List Pointer
            ; X  => LOW Event Adress Pointer
            ; Y  => HIGH Event Adress Pointer

            ; Output:
            ; A <= 0 if added successfully, 1 if not


            rts

event_remove:
            ; Event Remove
            ; Removes the given Adress from the Event-List

            ; Input:
            ; K0 => LOW Event-List Pointer
            ; K1 => HIGH Event-List Pointer
            ; X  => LOW Event Adress Pointer
            ; Y  => HIGH Event Adress Pointer

            ; Output: (none)


            rts

event_count:
            ; Event Count
            ; Counts how many Events are in a Event-List

            ; Input:
            ; X => LOW Event-List Pointer
            ; Y => HIGH Event-List Pointer

            ; Output:
            ; A <= Count


            rts
            