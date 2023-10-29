; Static System Variables

; Name                  Address     Size        Status      Comment

z0                      = $0        ; 8 bit                 All Purpose 16 bit Zero Page Variable
z1                      = $1        ; 8 bit

irq_a                   = $200      ; 8 bit     (internal)  IRQ Variable Save
irq_x                   = $201      ; 8 bit     (internal)
irq_y                   = $202      ; 8 bit     (internal)
irq_vector              = $203      ; 16 bit                IRQ 16 bit Jump Vector 

k0                      = $205      ; 8 bit                 General Purpose Registers      
k1                      = $206      ; 8 bit                 ...
k2                      = $207      ; 8 bit
k3                      = $208      ; 8 bit
k4                      = $209      ; 8 bit
k5                      = $20a      ; 8 bit
k6                      = $20b      ; 8 bit
k7                      = $20c      ; 8 bit

keyboard_current        = $20d      ; 8 bit                 Held Keyboard Key, without Formatting (shift, etc.) "Scan Key"
keyboard_previous       = $20e      ; 8 bit                 Previous held "Scan Key"
keyboard_format         = $20f      ; 8 bit                 Formatted Char, from keyboard_current
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

color                   = $2fe      ; 8 bit                 Fore & Background Color

typelength              = $2ff      ; 8 bit                 Length of typebuffer
typebuffer              = $300      ; 256 byte              256 bit, All Purpose Char Buffer
