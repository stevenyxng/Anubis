# 1 "player.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "player.c"
# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;
typedef void (*ihp)(void);






extern volatile unsigned short *videoBuffer;
# 40 "gba.h"
void waitForVBlank();
# 57 "gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);
# 73 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;
extern DMA *dma;
# 105 "gba.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 2 "player.c" 2
# 1 "game.h" 1
int hOff;
int vOff;
# 3 "player.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct { u16 tileData[16]; } TILE;
typedef TILE charblock[512];



typedef struct {
 u16 tilemap[1024];
} screenblock;
# 4 "player.c" 2
# 1 "print.h" 1
# 25 "print.h"
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3 4







# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3 4
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3 4
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 2 3 4
# 9 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 2 3 4
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4

# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 2 3 4
# 26 "print.h" 2
# 35 "print.h"

# 35 "print.h"
uint8_t mgba_open(void);
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
void mgba_close(void);
# 5 "player.c" 2
# 1 "sprites.h" 1
# 10 "sprites.h"
typedef struct {
  u16 attr0;
  u16 attr1;
  u16 attr2;
  u16 fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[128];
# 63 "sprites.h"
void hideSprites();


typedef struct {
    int x;
    int y;
    int dx;
    int dy;
    int width;
    int height;
    int direction;
    int isMoving;
    int timeUntilNextFrame;
    int frame;
    int numOfFrames;
    int active;
    int hide;
} SPRITE;
# 6 "player.c" 2
# 1 "player.h" 1
SPRITE player;
typedef enum {DOWN, UP, LEFT, RIGHT, NULL} DIRECTION;
OBJ_ATTR shadowOAM[128];




const unsigned short currentCollisionMap;
# 7 "player.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 8 "player.c" 2
# 1 "main.h" 1
void initialize();

void goToStart();
void start();

void goToInstructions();
void instructions();

void goToGame();
void game();

void goToLevelComplete();
void levelComplete();

void goToPause();
void pause();

void goToWin();
void win();

void goToLose();
void lose();

int currentLevel;
# 9 "player.c" 2
# 1 "level1CollisionMap.h" 1
# 21 "level1CollisionMap.h"
extern const unsigned short level1CollisionMapBitmap[32768];


extern const unsigned short level1CollisionMapPal[256];
# 10 "player.c" 2
# 1 "level2CollisionMap.h" 1
# 21 "level2CollisionMap.h"
extern const unsigned short level2CollisionMapBitmap[32768];


extern const unsigned short level2CollisionMapPal[256];
# 11 "player.c" 2
# 1 "testLevelCollisionMap.h" 1
# 21 "testLevelCollisionMap.h"
extern const unsigned short testLevelCollisionMapBitmap[32768];


extern const unsigned short testLevelCollisionMapPal[256];
# 12 "player.c" 2

inline unsigned char colorAt(int x, int y) {
    if (currentLevel == 1) {
        return ((unsigned char*)level1CollisionMapBitmap)[((y) * (256) + (x))];
    } else if (currentLevel == 2) {
        return ((unsigned char*)level2CollisionMapBitmap)[((y) * (256) + (x))];
    }
}

int justMoved;
int nextDirection;

void initializePlayer() {

    player.width = 16;
    player.height = 16;


    player.x = 16;
    player.y = 16;
    player.numOfFrames = 4;

    player.timeUntilNextFrame = 20;
    player.dx = 8;
    player.dy = 8;
    player.isMoving = 0;
}

void updatePlayer() {

    int leftX = player.x;
    int rightX = player.x + player.width - 1;
    int topY = player.y;
    int bottomY = player.y + player.height - 1;


    if (player.isMoving == 1) {
        switch (player.direction) {
            case UP:
                if (player.y > 0 && colorAt(leftX, topY - player.dy) && colorAt(rightX, topY - player.dy))
                    player.y -= player.dy;
                else
                    player.isMoving = 0;
                break;
            case DOWN:
                if ((player.y + player.height < 256) && colorAt(leftX, bottomY + player.dy) && colorAt(rightX, bottomY + player.dy))
                    player.y += player.dy;
                else
                    player.isMoving = 0;
                break;
            case LEFT:
                if (player.x > 0 && colorAt(leftX - player.dx, topY) && colorAt(leftX - player.dx, bottomY))
                    player.x -= player.dx;
                else
                    player.isMoving = 0;
                break;
            case RIGHT:
                if ((player.x + player.width < 256) && colorAt(rightX + player.dx, topY) && colorAt(rightX + player.dx, bottomY))
                    player.x += player.dx;
                else
                    player.isMoving = 0;
                break;
        }

        if ((!(~(oldButtons) & ((1<<7))) && (~(buttons) & ((1<<7))))) {
            nextDirection = 0;
        } else if ((!(~(oldButtons) & ((1<<6))) && (~(buttons) & ((1<<6))))) {
            nextDirection = 1;
        } else if ((!(~(oldButtons) & ((1<<5))) && (~(buttons) & ((1<<5))))) {
            nextDirection = 2;
        } else if ((!(~(oldButtons) & ((1<<4))) && (~(buttons) & ((1<<4))))) {
            nextDirection = 3;
        }

    } else {
        if (nextDirection != NULL) {
            player.isMoving = 1;
            player.direction = nextDirection;
            justMoved = 2;
            nextDirection = 4;
        } else if ((!(~(oldButtons) & ((1<<6))) && (~(buttons) & ((1<<6))))) {
            player.isMoving = 1;
            player.direction = UP;
            justMoved = 2;
        } else if ((!(~(oldButtons) & ((1<<7))) && (~(buttons) & ((1<<7))))) {
            player.isMoving = 1;
            player.direction = DOWN;
            justMoved = 2;
        } else if ((!(~(oldButtons) & ((1<<5))) && (~(buttons) & ((1<<5))))) {
            player.isMoving = 1;
            player.direction = LEFT;
            justMoved = 2;
        } else if ((!(~(oldButtons) & ((1<<4))) && (~(buttons) & ((1<<4))))) {
            player.isMoving = 1;
            player.direction = RIGHT;
            justMoved = 2;
        }
    }


    if (hOff + 240 < 256 && player.x - hOff >= 240 / 2)
        hOff+=1;

    if (hOff > 0 && player.x - hOff <= 240 / 2)
        hOff-=1;

    if (vOff + 160 < 256 && player.y - vOff >= 160 / 2)
        vOff+=1;

    if (vOff > 0 && player.y - vOff <= 160 / 2)
        vOff-=1;

    player.timeUntilNextFrame--;
    if (player.timeUntilNextFrame == 0) {
        player.timeUntilNextFrame = 20;
        player.frame = (player.frame + 1) % player.numOfFrames;
    }


    if (player.isMoving) {
        if (justMoved != 0) {
            shadowOAM[0].attr0 = (0<<13) | (0<<14) | ((player.y - vOff) & 0xFF);
            shadowOAM[0].attr1 = (1<<14) | ((player.x - hOff) & 0x1FF);
            shadowOAM[0].attr2 = (((0) & 0xF) << 12) | (((player.frame * 2) * 32 + (0)) & 0x3FF);
            justMoved--;
        } else {
            if (player.direction == UP) {
                shadowOAM[0].attr0 = (0<<13) | (2<<14) | ((player.y - vOff) & 0xFF);
                shadowOAM[0].attr1 = (2<<14) | ((player.x - hOff) & 0x1FF);
                shadowOAM[0].attr2 = (((0) & 0xF) << 12) | (((0) * 32 + (8)) & 0x3FF);
            } else if (player.direction == DOWN) {
                shadowOAM[0].attr0 = (0<<13) | (2<<14) | ((player.y - vOff - 16) & 0xFF);
                shadowOAM[0].attr1 = (2<<14) | ((player.x - hOff) & 0x1FF);
                shadowOAM[0].attr2 = (((0) & 0xF) << 12) | (((0) * 32 + (6)) & 0x3FF);
            } else if (player.direction == LEFT) {
                shadowOAM[0].attr0 = (0<<13) | (1<<14) | ((player.y - vOff) & 0xFF);
                shadowOAM[0].attr1 = (2<<14) | ((player.x - hOff) & 0x1FF);
                shadowOAM[0].attr2 = (((0) & 0xF) << 12) | (((2) * 32 + (2)) & 0x3FF);
            } else if (player.direction == RIGHT) {
                shadowOAM[0].attr0 = (0<<13) | (1<<14) | ((player.y - vOff) & 0xFF);
                shadowOAM[0].attr1 = (2<<14) | ((player.x - hOff - 16) & 0x1FF);
                shadowOAM[0].attr2 = (((0) & 0xF) << 12) | (((0) * 32 + (2)) & 0x3FF);
            }
        }
    } else {
        shadowOAM[0].attr0 = (0<<13) | (0<<14) | ((player.y - vOff) & 0xFF);
        shadowOAM[0].attr1 = (1<<14) | ((player.x - hOff) & 0x1FF);
        shadowOAM[0].attr2 = (((0) & 0xF) << 12) | (((player.frame * 2) * 32 + (0)) & 0x3FF);
    }
}
