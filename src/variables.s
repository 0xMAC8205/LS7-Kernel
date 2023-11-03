; 


; Static System Variables

; Name                  Address     Size        Status      Comment

z0                      = $0        ; 8 bit                 All Purpose 16 bit Zero Page Variable
z1                      = $1        ; 8 bit

irq_a                   = $200      ; 8 bit     (internal)  IRQ Variable Save
irq_x                   = $201      ; 8 bit     (internal)
irq_y                   = $202      ; 8 bit     (internal)
irq_vector              = $203      ; 16 bit    (internal)  IRQ 16 bit Jump Vector 

k0                      = $205      ; 8 bit                 General Purpose Kernel Registers,
k1                      = $206      ; 8 bit                 usually used as Carry for Sub-Routines
k2                      = $207      ; 8 bit
k3                      = $208      ; 8 bit
k4                      = $209      ; 8 bit
k5                      = $20a      ; 8 bit
k6                      = $20b      ; 8 bit
k7                      = $20c      ; 8 bit

keyboard_current        = $20d      ; 8 bit                 Held Keyboard Key, without Formatting (shift, etc.) "Scan Key"
keyboard_previous       = $20e      ; 8 bit                 Previous held "Scan Key"
keyboard_ascii          = $20f      ; 8 bit                 Formatted Char, from keyboard_current as ASCII
keyboard_arrow          = $210      ; 8 bit                 Held Arrow Keys
keyboard_modifier       = $211      ; 8 bit                 Held Modifier Keys, such as "shift, alt, control"

cursor_x                = $212      ; 8 bit                 Current Cursor X Position
cursor_y                = $213      ; 8 bit                 Current Cursor Y Position
cursor_x_previous       = $214      ; 8 bit     (internal)  Previous Cursor X Position
cursor_y_previous       = $215      ; 8 bit     (internal)  Previous Cursor Y Position
cursor_value            = $216      ; 8 bit                 
cursor_speed            = $217      ; 8 bit                 Cursor Blink Speed (in IRQ Ticks)
cursor_speed_count      = $218      ; 8 bit     (internal)  Cursor Blink Speed Counter
cursor_delay_interval   = $219      ; 8 bit                 
cursor_delay            = $21a      ; 8 bit
cursor_delay_count      = $21b      ; 8 bit     (internal)
cursor_delay_switch     = $21c      ; 8 bit     (internal)

soft_system_register    = $21d      ; 8 bit     (internal)
color                   = $21e      ; 8 bit                 Fore & Background Color
typelength              = $21f      ; 8 bit                 Length of typebuffer

kernel_stack            = $300      ; 256 bytes             256 byte, Kernel Stack, used for offloading Registers

typebuffer              = $400      ; 256 bytes             256 byte, All Purpose Char Buffer

; END => $500


; Hardware Registers

vidx                    = $be00     ; 8 bit                 Video X Register
vidy                    = $be01     ; 8 bit                 Video Y Register
vidm                    = $be02     ; 8 bit                 Video Modifier Register
vidd                    = $be03     ; 8 bit                 Video Data Register

porta                   = $bf80     ; 8 bit                 VIA Registers
portb                   = $bf81     ; 8 bit                 ...
ddrb                    = $bf82     ; 8 bit
ddra                    = $bf83     ; 8 bit
t1cl                    = $bf84     ; 8 bit
t1ch                    = $bf85     ; 8 bit
acr                     = $bf8b     ; 8 bit
ifr                     = $bf8d     ; 8 bit
ier                     = $bf8e     ; 8 bit

keyboard_port           = $bd00     ; 8 bit                 Keyboard Scan-Row Input
system_register         = $bc00     ; 8 bit                 System Register






;-----------------------------------------------------------------------------------------------
;                                        Memory Map
;-----------------------------------------------------------------------------------------------
; $00-$ff:              Mostly free Zero page, except for $00 and $01
;-----------------------------------------------------------------------------------------------
; $100-$1ff:            Stack
;-----------------------------------------------------------------------------------------------
; $200-$27f:            Kernel Variables
;-----------------------------------------------------------------------------------------------
; $300-$3ff:            Kernel Stack
;-----------------------------------------------------------------------------------------------
; $400-$4ff:            Typebuffer
;-----------------------------------------------------------------------------------------------
;
;-----------------------------------------------------------------------------------------------
;
;-----------------------------------------------------------------------------------------------