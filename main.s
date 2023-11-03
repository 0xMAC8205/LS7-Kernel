            .include "src/variables.s"      
            
            
            .org $c000                          ; $c000 for 16k ROM
            .include "src/kernel.s"


            .org $f700
charset:    .incbin "assets/UTF-8.bin"

            .org $ff00
reset:      sei
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

            ;jsr video_writeline_static
            ;.string "Hello World"

            jsr video_clear

            ldx #<charset
            ldy #>charset
            jsr video_load_font

            lda #$f0
            jsr irq_init

            stz k0
            lda #$00
            tax
            tay

lp:
            lda k0
            jsr vram_write

            inc k0
            inx
            cpx #$10
            bne lp
            ldx #$00
            iny
            cpy #$10
            bne lp

loop:       
            jmp loop

irq_jump:   jmp (irq_vector)


            .org $fffa
            .addr $0f00
            .addr reset
            .addr irq_jump

            .end