            .include "lib/variables.s"      
            
            
            .org $c000                          ; $c000 for 16k ROM
            .include "lib/kernel.s"


            .org $f700
charset     .incbin "assets/UTF-8.bin"

            .org $ff00
reset       sei
            cld

            lda #<irq
            sta irq_vector
            lda #>irq
            sta irq_vector+1

            lda #$E0
            sta vidm

            lda #$60
            sta cursor_delay
            lda #$06
            sta cursor_delay_interval
            lda #$20
            sta color
            lda #$80
            sta cursor_speed
            lda #$ff
            sta cursor_x_previous
            sta cursor_y_previous

            stz cursor_x
            stz cursor_y
            stz cursor_value
            stz cursor_speed_count
            stz cursor_delay_count
            stz cursor_delay_switch
            stz typelength
            stz keyboard_current
            stz keyboard_previous
            stz system_register
            stz soft_system_register


            jsr kernel_init


loop        jmp loop

irq_jump    jmp (irq_vector)


            .org $fffa
            .addr $0f00
            .addr reset
            .addr irq_jump

; hardware registers

vidx                    = $be00
vidy                    = $be01
vidm                    = $be02
vidd                    = $be03

porta                   = $bf80
portb                   = $bf81
ddrb                    = $bf82
ddra                    = $bf83
t1cl                    = $bf84
t1ch                    = $bf85
acr                     = $bf8b
ifr                     = $bf8d
ier                     = $bf8e

keyboard_port           = $bd00
system_register         = $bc00

            .end