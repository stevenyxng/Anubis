#ifndef GBA_H 
#define GBA_H

// Typedefs
typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;
typedef void (*ihp)(void);

// Display constants
#define SCREENHEIGHT 160 // Height of the GBA display
#define SCREENWIDTH  240 // Width of the GBA display

// Pointer to the start of video memory
extern volatile unsigned short *videoBuffer;

// Finds 1D position from 2D coordinates
#define OFFSET(x, y, width) ((y) * (width) + (x))

// Display control register
#define REG_DISPCTL (*(volatile unsigned short *)0x4000000)

// Bits for display control register
#define MODE(x) ((x) & 7) // Sets GBA video mode (REG_DISPCTL)
#define DISP_BACKBUFFER (1 << 4) // Displays backbuffer for page flipping (REG_DISPCTL)
#define SPRITE_ENABLE (1 << 12) // Enables rendering of sprites (REG_DISPCTL)
#define SPRITE_MODE_2D (0 << 6) // Sets 2D sprite tile mapping mode (REG_DISPCTL)
#define SPRITE_MODE_1D (1 << 6) // Sets 1D sprite tile mapping mode (REG_DISPCTL)
#define BG_ENABLE(x) (1 << (8 + (x % 4))) // Enables specified background (REG_DISPCTL)

// Read-only, holds which scanline is being drawn
#define REG_VCOUNT (*(volatile unsigned short *)0x4000006)

// Waits until scanline has just become 160
void waitForVBlank();

// Color
#define PALETTE ((unsigned short *)0x5000000)
#define COLOR(r, g, b) (((r) & 31) | ((g) & 31) << 5 | ((b) & 31) << 10)
#define RGB(r, g, b) (((r) & 31) | ((g) & 31) << 5 | ((b) & 31) << 10)
#define BLACK   COLOR(0,0,0)
#define WHITE   COLOR(31,31,31)
#define GRAY    COLOR(15,15,15)
#define RED     COLOR(31,0,0)
#define GREEN   COLOR(0,31,0)
#define BLUE    COLOR(0,0,31)
#define CYAN    COLOR(0,31,31)
#define MAGENTA COLOR(31,0,31)
#define YELLOW  COLOR(31,31,0)

// Checks for collision between two rectangles
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);

// Buttons
#define REG_BUTTONS (*(volatile unsigned short *)0x04000130) // Buttons down register
#define BUTTON_A         (1<<0) // Mask for button A (REG_BUTTONS or REG_KEYCNT)
#define BUTTON_B         (1<<1) // Mask for button B (REG_BUTTONS or REG_KEYCNT)
#define BUTTON_SELECT    (1<<2) // Mask for button SELECT (REG_BUTTONS or REG_KEYCNT)
#define BUTTON_START     (1<<3) // Mask for button START (REG_BUTTONS or REG_KEYCNT)
#define BUTTON_RIGHT     (1<<4) // Mask for RIGHT button (REG_BUTTONS or REG_KEYCNT)
#define BUTTON_LEFT      (1<<5) // Mask for LEFT button (REG_BUTTONS or REG_KEYCNT)
#define BUTTON_UP        (1<<6) // Mask for UP button (REG_BUTTONS or REG_KEYCNT)
#define BUTTON_DOWN      (1<<7) // Mask for DOWN button (REG_BUTTONS or REG_KEYCNT)
#define BUTTON_RSHOULDER (1<<8) // Mask for RIGHT SHOULDER button (REG_BUTTONS or REG_KEYCNT)
#define BUTTON_LSHOULDER (1<<9) // Mask for LEFT SHOULDER button (REG_BUTTONS or REG_KEYCNT)

// Button checks
extern unsigned short oldButtons; // Keeps track of buttons pressed in previous frame
extern unsigned short buttons; // Keeps track of buttons pressed in current frame
#define BUTTON_HELD(key)    (~(buttons) & (key)) // Checks if a button is currently pressed
#define BUTTON_PRESSED(key) (!(~(oldButtons) & (key)) && (~(buttons) & (key))) // Checks if a button is currently pressed and wasn't in the previous frame

// DMA
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;
extern DMA *dma; // Address to first DMA register

// DMA bits
#define DMA_DESTINATION_INCREMENT (0 << 21) // Increment destination (move "forwards" in memory)
#define DMA_DESTINATION_DECREMENT (1 << 21) // Decrement destination (move "backwards" in memory)
#define DMA_DESTINATION_FIXED     (2 << 21) // Keep destination fixed
#define DMA_DESTINATION_RESET     (3 << 21) // Reset destination to beginning when repeating
#define DMA_SOURCE_INCREMENT      (0 << 23) // Increment source (move "forwards" in memory)
#define DMA_SOURCE_DECREMENT      (1 << 23) // Decrement source (move "backwards" in memory)
#define DMA_SOURCE_FIXED          (2 << 23) // Keep source fixed
#define DMA_REPEAT (1 << 25) // Repeats every time 
#define DMA_16     (0 << 26) // Copy 2 bytes at a time
#define DMA_32     (1 << 26) // Copy 4 bytes at a time
#define DMA_AT_NOW     (0 << 28) // Start DMA immediately
#define DMA_AT_VBLANK  (1 << 28) // Start DMA at VBlank
#define DMA_AT_HBLANK  (2 << 28) // Start DMA at HBlank
#define DMA_AT_REFRESH (3 << 28) // DMA1 and DMA2, refill FIFO once empty. DMA3, transfer starts at scaline==2 and repeats until scanline==162
#define DMA_IRQ (1 << 30) // Request an interrupt once DMA is finished
#define DMA_ON  (1 << 31) // Enable DMA!!!

// Immediately begins a DMA transfer using parameters
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);

// Timer registers
#define REG_TM0CNT *(volatile unsigned short*)0x4000102 // Timer 0 control register
#define REG_TM1CNT *(volatile unsigned short*)0x4000106 // Timer 1 control register
#define REG_TM2CNT *(volatile unsigned short*)0x400010A // Timer 2 control register
#define REG_TM3CNT *(volatile unsigned short*)0x400010E // Timer 3 control register
#define REG_TM0D   *(volatile unsigned short*)0x4000100 // Initial value for timer 0
#define REG_TM1D   *(volatile unsigned short*)0x4000104 // Initial value for timer 1
#define REG_TM2D   *(volatile unsigned short*)0x4000108 // Initial value for timer 2
#define REG_TM3D   *(volatile unsigned short*)0x400010C // Initial value for timer 3

// Timer bits
#define TIMER_ON     (1<<7) // Enable this timer
#define TIMER_OFF    (0<<7) // Disable this timer
#define TM_IRQ       (1<<6) // Trigger an interrupt when this timer overflows
#define TM_CASCADE   (1<<2) // Cascade preceding timer into this timer (doesn't work for TM0)
#define TM_FREQ_1    (0) // Each GPU clock cycle
#define TM_FREQ_64   (1) // Each 64 GPU clock cycles
#define TM_FREQ_256  (2) // Each 256 GPU clock cycles
#define TM_FREQ_1024 (3) // Each 1024 GPU clock clycles

// Interrupt registers
#define REG_IME       *(unsigned short*)0x4000208 // Interrupt (master) control register
#define REG_IE        *(unsigned short*)0x4000200 // Interrupt enable register
#define REG_IF        *(volatile unsigned short*)0x4000202 // Interrupt flag register
#define REG_INTERRUPT *((ihp*)0x03007FFC) // Interrupt handler

// Interrupt requests
#define IRQ_VBLANK   (1 << 0) // Enables VBlank interrupts, requires bit 3 in REG_DISPCNT
#define IRQ_HBLANK   (1 << 1) // Enables HBlank interrupts, requires bit 4 in REG_DISPCNT
#define IRQ_VCOUNT   (2 << 2) // Enables scanline/VCount interrupts, requires bit 5 in REG_DISPCNT
#define IRQ_TIMER(x) (1 << ((x % 4) + 3)) // Enables timer x interrupts, requires bit 6 in REG_TMxCNT
#define IRQ_DMA(x)   (1 << ((x % 4)) + 8) // Enables DMA x interrupts, requires that DMA channel's register
#define IRQ_BUTTON   (1 << 12) // Enables button interrupts, requires bit E (and button specifications) in REG_KEYCNT

// Registers used for specific interrupts
#define REG_DISPSTAT *(unsigned short*)0x4000004 // Display interrupt register
#define REG_KEYCNT   *(unsigned short*)0x4000132 // Button interrupt register

// Display interrupt requests
#define DISPSTAT_VBLANK_IRQ   (1 << 3) // Enables VBlank interrupts in REG_DISPSTAT
#define DISPSTAT_HBLANK_IRQ   (1 << 4) // Enables HBlank interrupts in REG_DISPSTAT
#define DISPSTAT_VCOUNT_IRQ   (1 << 5) // Enables scanline/VCount interrupts in REG_DISPSTAT
#define DISPSTAT_SETVCOUNT(x) ((x % 255) << 8) // Set scanline to trigger interrupt in REG_DISPSTAT, requires bit 5 in REG_DISPSTAT

// Button interrupt requests
// Note: to set which buttons trigger the int., use button masks
#define KEYCNT_IRQ (1 << 14) // Enables button interrupts
#define KEYCNT_OR  (0 << 15) // Trigger interrupt if ANY of specified buttons are pressed
#define KEYCNT_AND (1 << 15) // Trigger interrupt only if ALL of specified buttons are pressed

#endif