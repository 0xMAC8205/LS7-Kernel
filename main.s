


    .org $c000

    ; libraries

    .include "lib/kernel.s"

reset

    

    .org $fffa
    .addr $0f00
    .addr reset
    .addr irq_jump

; hardware registers
vidx = $be00
vidy = $be01
vidm = $be02
vidd = $be03

porta = $bf80
portb = $bf81
ddrb = $bf82
ddra = $bf83
t1cl = $bf84
t1ch = $bf85
acr = $bf8b
ifr = $bf8d
ier = $bf8e

keyboard_port = $bd00
system_register = $bc00
    .end