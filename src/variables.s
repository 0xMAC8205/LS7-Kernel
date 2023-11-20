; 


; Static System Variables

; Name                  Address     Size        Status      Comment

z0                      = $0        ; 8 bit                 All Purpose 16 bit Zero Page Variable
z1                      = $1        ; 8 bit
kernel_stack_pointer    = $fe       ; 16 bit                Pointer to the Kernel Stack

kernel_stack            = $200      ; 256 bytes             256 byte, Kernel Stack, used for offloading Registers

typebuffer              = $300      ; 256 bytes             256 byte, All Purpose Char Buffer

irq_a                   = $400      ; 8 bit     (internal)  IRQ Variable Save
irq_x                   = $401      ; 8 bit     (internal)
irq_y                   = $402      ; 8 bit     (internal)
irq_vector              = $403      ; 16 bit    (internal)  IRQ 16 bit Jump Vector 

k0                      = $405      ; 8 bit                 General Purpose Kernel Registers,
k1                      = $406      ; 8 bit                 usually used as Carry for Sub-Routines
k2                      = $407      ; 8 bit
k3                      = $408      ; 8 bit
k4                      = $409      ; 8 bit
k5                      = $40a      ; 8 bit
k6                      = $40b      ; 8 bit
k7                      = $40c      ; 8 bit

keyboard_current        = $40d      ; 8 bit                 Held Keyboard Key, without Formatting (shift, etc.) "Scan Key"
keyboard_previous       = $40e      ; 8 bit                 Previous held "Scan Key"
keyboard_ascii          = $40f      ; 8 bit                 Formatted Char, from keyboard_current as ASCII
keyboard_arrow          = $410      ; 8 bit                 Held Arrow Keys
keyboard_modifier       = $411      ; 8 bit                 Held Modifier Keys, such as "shift, alt, control"

cursor_x                = $412      ; 8 bit                 Current Cursor X Position
cursor_y                = $413      ; 8 bit                 Current Cursor Y Position
cursor_x_previous       = $414      ; 8 bit     (internal)  Previous Cursor X Position
cursor_y_previous       = $415      ; 8 bit     (internal)  Previous Cursor Y Position
cursor_value            = $416      ; 8 bit                 
cursor_speed            = $417      ; 8 bit                 Cursor Blink Speed (in IRQ Ticks)
cursor_speed_count      = $418      ; 8 bit     (internal)  Cursor Blink Speed Counter
cursor_delay_interval   = $419      ; 8 bit                 
cursor_delay            = $41a      ; 8 bit
cursor_delay_count      = $41b      ; 8 bit     (internal)
cursor_delay_switch     = $41c      ; 8 bit     (internal)

soft_system_register    = $41d      ; 8 bit     (internal)
color                   = $41e      ; 8 bit                 Fore & Background Color
typelength              = $41f      ; 8 bit                 Length of typebuffer

kernel_stack_counter    = $420      ; 8 bit     (internal)  Length of Kernel Stack
kernel_stack_offload_1  = $421      ; 8 bit     (internal)  General Kernel Stack Offload Variable
kernel_stack_offload_2  = $422      ; 8 bit     (internal)  ..

beep_counter            = $423      ; 8 bit     (public)    Beeper counter in IRQ Ticks
activity_led_counter    = $424      ; 8 bit     (public)    Activity LED Counter in IRQ Ticks 
user_led_counter        = $425      ; 8 bit     (public)    User LED Counter in IRQ Ticks





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