int16_add_byte:
            ; Int16 add Int8

            ; Input:
            ; A <= Least significant Byte
            ; X <= Most sifnificant Byte
            ; Y <= Byte to add

            ; Output:
            ; A <= Least significant Byte
            ; X <= Most significant Byte

            clc
            sty k0
            adc k0
            bvc int16_add_byte_return
            inx

int16_add_byte_return:
            rts

int16_increment_pointer:
            ; Int16 Increment from Pointer

            ; Input: 
            ; X => LOW Pointer Byte
            ; Y => HIGH Pointer Byte

            ; Output: (none)

            rts

int16_increment:
            ; Int16 Increment

            ; Input:
            ; X => LSB -byte
            ; Y => MSB -byte

            ; Output:
            ; X <= LSB -byte
            ; Y <= MSB -byte

            clc
            inx
            bcc int16_increment_return
            iny
            
int16_increment_return:
            rts