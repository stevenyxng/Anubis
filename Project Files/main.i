# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"






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
# 8 "main.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct { u16 tileData[16]; } TILE;
typedef TILE charblock[512];



typedef struct {
 u16 tilemap[1024];
} screenblock;
# 9 "main.c" 2
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
# 10 "main.c" 2
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
# 11 "main.c" 2
# 1 "sound.h" 1
# 75 "sound.h"
enum {
  REST = 0,
  NOTE_C2 =44,
  NOTE_CS2 =157,
  NOTE_D2 =263,
  NOTE_DS2 =363,
  NOTE_E2 =457,
  NOTE_F2 =547,
  NOTE_FS2 =631,
  NOTE_G2 =711,
  NOTE_GS2 =786,
  NOTE_A2 =856,
  NOTE_AS2 =923,
  NOTE_B2 =986,
  NOTE_C3 =1046,
  NOTE_CS3 =1102,
  NOTE_D3 =1155,
  NOTE_DS3 =1205,
  NOTE_E3 =1253,
  NOTE_F3 =1297,
  NOTE_FS3 =1339,
  NOTE_G3 =1379,
  NOTE_GS3 =1417,
  NOTE_A3 =1452,
  NOTE_AS3 =1486,
  NOTE_B3 =1517,
  NOTE_C4 =1547,
  NOTE_CS4 =1575,
  NOTE_D4 =1602,
  NOTE_DS4 =1627,
  NOTE_E4 =1650,
  NOTE_F4 =1673,
  NOTE_FS4 =1694,
  NOTE_G4 =1714,
  NOTE_GS4 =1732,
  NOTE_A4 =1750,
  NOTE_AS4 =1767,
  NOTE_B4 =1783,
  NOTE_C5 =1798,
  NOTE_CS5 =1812,
  NOTE_D5 =1825,
  NOTE_DS5 =1837,
  NOTE_E5 =1849,
  NOTE_F5 =1860,
  NOTE_FS5 =1871,
  NOTE_G5 =1881,
  NOTE_GS5 =1890,
  NOTE_A5 =1899,
  NOTE_AS5 =1907,
  NOTE_B5 =1915,
  NOTE_C6 =1923,
  NOTE_CS6 =1930,
  NOTE_D6 =1936,
  NOTE_DS6 =1943,
  NOTE_E6 =1949,
  NOTE_F6 =1954,
  NOTE_FS6 =1959,
  NOTE_G6 =1964,
  NOTE_GS6 =1969,
  NOTE_A6 =1974,
  NOTE_AS6 =1978,
  NOTE_B6 =1982,
  NOTE_C7 =1985,
  NOTE_CS7 =1989,
  NOTE_D7 =1992,
  NOTE_DS7 =1995,
  NOTE_E7 =1998,
  NOTE_F7 =2001,
  NOTE_FS7 =2004,
  NOTE_G7 =2006,
  NOTE_GS7 =2009,
  NOTE_A7 =2011,
  NOTE_AS7 =2013,
  NOTE_B7 =2015,
  NOTE_C8 =2017
} NOTES;

void setupSounds();
void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void pauseSounds();
void unpauseSounds();
void stopSounds();
# 197 "sound.h"
typedef struct{
    const signed char* data;
    int dataLength;
    int isPlaying;
    int looping;
    int durationInVBlanks;
    int vBlankCount;
} SOUND;

SOUND soundA;
SOUND soundB;
# 12 "main.c" 2
# 1 "player.h" 1
SPRITE player;
typedef enum {DOWN, UP, LEFT, RIGHT, NULL} DIRECTION;
OBJ_ATTR shadowOAM[128];




const unsigned short currentCollisionMap;
# 13 "main.c" 2
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
# 14 "main.c" 2
# 1 "game.h" 1
int hOff;
int vOff;
# 15 "main.c" 2
# 1 "tileset.h" 1
# 21 "tileset.h"
extern const unsigned short tilesetTiles[1024];


extern const unsigned short tilesetPal[256];
# 16 "main.c" 2
# 1 "startScreen.h" 1







extern const unsigned short startScreenMap[1024];
# 17 "main.c" 2
# 1 "instructScreen.h" 1







extern const unsigned short instructScreenMap[1024];
# 18 "main.c" 2
# 1 "winScreen.h" 1







extern const unsigned short winScreenMap[1024];
# 19 "main.c" 2
# 1 "loseScreen.h" 1







extern const unsigned short loseScreenMap[1024];
# 20 "main.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 21 "main.c" 2
# 1 "startBitmap.h" 1
# 20 "startBitmap.h"
extern const unsigned short startBitmapBitmap[38400];
# 22 "main.c" 2
# 1 "instruction.h" 1
# 20 "instruction.h"
extern const unsigned short instructionBitmap[38400];
# 23 "main.c" 2
# 1 "levelCompleteBG.h" 1
# 20 "levelCompleteBG.h"
extern const unsigned short levelCompleteBGBitmap[38400];
# 24 "main.c" 2
# 1 "gameOver.h" 1
# 20 "gameOver.h"
extern const unsigned short gameOverBitmap[38400];
# 25 "main.c" 2
# 1 "winBG.h" 1
# 20 "winBG.h"
extern const unsigned short winBGBitmap[38400];
# 26 "main.c" 2
# 1 "rollingSong.h" 1


extern const unsigned int rollingSong_sampleRate;
extern const unsigned int rollingSong_length;
extern const signed char rollingSong_data[];
# 27 "main.c" 2
# 1 "stateDing.h" 1


extern const unsigned int stateDing_sampleRate;
extern const unsigned int stateDing_length;
extern const signed char stateDing_data[];
# 28 "main.c" 2

void interruptHandler();


enum {
    START,
    INSTRUCTIONS,
    GAME,
    LEVELCOMPLETE,
    PAUSE,
    WIN,
    LOSE
} state;

OBJ_ATTR shadowOAM[128];

unsigned short oldButtons;
unsigned short buttons;

int main() {
    initialize();


    mgba_open();
    mgba_printf("Debugging Initialized");

    while (1) {
        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);


        switch (state) {
            case START:
                start();
                break;
            case INSTRUCTIONS:
                instructions();
                break;
            case GAME:
                game();
                break;
            case LEVELCOMPLETE:
                levelComplete();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
        }

        waitForVBlank();
        (*(volatile unsigned short *)0x04000010) = hOff;
        (*(volatile unsigned short *)0x04000012) = vOff;
        (*(volatile unsigned short *)0x04000014) = hOff/2;
        (*(volatile unsigned short *)0x04000016) = vOff/2;
        DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128*4);
    }
}


void initialize() {
    *(volatile u16 *)0x04000084 = (1<<7);
    *(u16*)0x04000080 = (((7) & 7) << 0) |
                   (((7) & 7) << 4) |
                   (1 << 8) |
                   (1 << 12) |
                   (1 << 9) |
                   (1 << 13) |
                   (1 << 10) |
                   (1 << 14) |
                   (1 << 11) |
                   (1 << 15);
    *(volatile u16*)0x04000082 = ((2) % 3);

    goToStart();
    currentLevel = 1;

    setupSounds();
    setupInterrupts();
}


void goToStart() {
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    (*(volatile unsigned short *)0x4000000) = ((3) & 7) | (1 << (8 + (2 % 4)));
    DMANow(3, startBitmapBitmap, videoBuffer, 240 * 160);


    state = START;
    currentLevel = 1;

}

void start() {
    if((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        goToInstructions();
    }
}


void goToInstructions() {
    state = INSTRUCTIONS;
    DMANow(3, instructionBitmap, videoBuffer, 240 * 160);
    playSoundB(stateDing_data, stateDing_length, 0);
}

void instructions() {
    if((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        goToGame();
    }
}


void goToGame() {
    state = GAME;

    playSoundB(stateDing_data, stateDing_length, 0);

    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << (8 + (1 % 4))) | (1 << 12);
    (*(volatile unsigned short*)0x4000008) = ((0) << 2) | ((30) << 8) | (3 << 14) | (0 << 7);
    (*(volatile unsigned short*)0x400000A) = ((0) << 2) | ((29) << 8) | (0 << 14) | (0 << 7);

    DMANow(3, tilesetTiles, &((charblock *)0x06000000)[0], sizeof(tilesetTiles)/2);
    DMANow(3, tilesetPal, ((unsigned short *)0x5000000), sizeof(tilesetPal)/2);

    DMANow(3, spritesheetTiles, &((charblock *)0x06000000)[4], 32768/2);
    DMANow(3, spritesheetPal, ((u16 *)0x5000200), 256);

    initializeGame();
}

void game() {
    updateGame();
    if((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        goToPause();
    }
}


void goToLevelComplete() {
    state = LEVELCOMPLETE;
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
    (*(volatile unsigned short *)0x4000000) = ((3) & 7) | (1 << (8 + (2 % 4)));
    DMANow(3, levelCompleteBGBitmap, videoBuffer, 240 * 160);
}

void levelComplete() {
    if((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        goToGame();
    }
}


void goToPause() {
    state = PAUSE;
    shadowOAM[2].attr0 = (0<<13) | (0<<14) | ((8) & 0xFF);
    shadowOAM[2].attr1 = (1<<14) | ((216) & 0x1FF);
    shadowOAM[2].attr2 = (((0) & 0xF) << 12) | (((0) * 32 + (22)) & 0x3FF);
    playSoundB(stateDing_data, stateDing_length, 0);
}

void pause() {
    if((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        state = GAME;
        shadowOAM[2].attr0 = (2<<8);
        playSoundB(stateDing_data, stateDing_length, 0);
    }
    if((!(~(oldButtons) & ((1<<2))) && (~(buttons) & ((1<<2))))) {
        goToStart();
        playSoundB(stateDing_data, stateDing_length, 0);
    }
}


void goToWin() {
    state = WIN;
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128*4);

    hOff = 0;
    vOff = 0;

    (*(volatile unsigned short *)0x4000000) = ((3) & 7) | (1 << (8 + (2 % 4)));
    DMANow(3, winBGBitmap, videoBuffer, 240 * 160);

}

void win() {
    if((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        goToStart();
    }
}


void goToLose() {
    state = LOSE;
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128*4);

    hOff = 0;
    vOff = 0;

    (*(volatile unsigned short *)0x4000000) = ((3) & 7) | (1 << (8 + (2 % 4)));
    DMANow(3, gameOverBitmap, videoBuffer, 240 * 160);
    playSoundB(stateDing_data, stateDing_length, 0);
}

void lose() {
    if((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        goToStart();
    }
}

void setupInterrupts() {
 *(unsigned short*)0x4000208 = 0;
    *(unsigned short*)0x4000200 = (1 << 0) | (1 << ((2 % 4) + 3)) | (1 << ((3 % 4) + 3));
    *(unsigned short*)0x4000004 = (1 << 3);
    *((ihp*)0x03007FFC) = &interruptHandler;
 *(unsigned short*)0x4000208 = 1;
}

void interruptHandler() {
 *(unsigned short*)0x4000208 = 0;
 if (*(volatile unsigned short*)0x4000202 & (1 << 0)) {
        if (soundA.isPlaying) {
            soundA.vBlankCount++;
            if (soundA.vBlankCount >= soundA.durationInVBlanks) {
                if(soundA.looping) {
                    soundA.vBlankCount = 0;
                    playSoundA(soundA.data, soundA.dataLength, 1);
                } else {
                    !soundA.isPlaying;
                    *(volatile unsigned short*)0x4000102 = (0<<7);
                    dma[1].cnt = 0;
                }
            }
        }
        if (soundB.isPlaying) {
            soundB.vBlankCount++;
            if (soundB.vBlankCount >= soundB.durationInVBlanks) {
                if(soundB.looping) {
                    soundB.vBlankCount = 0;
                    playSoundB(soundB.data, soundB.dataLength, 1);
                } else {
                    !soundB.isPlaying;
                    *(volatile unsigned short*)0x4000106 = (0<<7);
                    dma[2].cnt = 0;
                }
            }
        }
 }
    *(volatile unsigned short*)0x4000202 = *(volatile unsigned short*)0x4000202;
    *(unsigned short*)0x4000208 = 1;
}
