# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
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
# 2 "game.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct { u16 tileData[16]; } TILE;
typedef TILE charblock[512];



typedef struct {
 u16 tilemap[1024];
} screenblock;
# 3 "game.c" 2
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
# 4 "game.c" 2
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
# 5 "game.c" 2
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
# 6 "game.c" 2
# 1 "player.h" 1
SPRITE player;
typedef enum {DOWN, UP, LEFT, RIGHT, NULL} DIRECTION;
OBJ_ATTR shadowOAM[128];




const unsigned short currentCollisionMap;
# 7 "game.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 8 "game.c" 2
# 1 "game.h" 1
int hOff;
int vOff;
# 9 "game.c" 2
# 1 "testLevel.h" 1







extern const unsigned short testLevelMap[1024];
# 10 "game.c" 2
# 1 "level1TileMap.h" 1







extern const unsigned short level1TileMapMap[1024];
# 11 "game.c" 2
# 1 "level2TileMap.h" 1







extern const unsigned short level2TileMapMap[1024];
# 12 "game.c" 2
# 1 "level1CheatTileMap.h" 1







extern const unsigned short level1CheatTileMapMap[1024];
# 13 "game.c" 2
# 1 "level2CheatTileMap.h" 1







extern const unsigned short level2CheatTileMapMap[1024];
# 14 "game.c" 2
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
# 15 "game.c" 2
# 1 "overlayTile.h" 1







extern const unsigned short overlayTileMap[1024];
# 16 "game.c" 2
# 1 "rollingSong.h" 1


extern const unsigned int rollingSong_sampleRate;
extern const unsigned int rollingSong_length;
extern const signed char rollingSong_data[];
# 17 "game.c" 2
# 1 "stateDing.h" 1


extern const unsigned int stateDing_sampleRate;
extern const unsigned int stateDing_length;
extern const signed char stateDing_data[];
# 18 "game.c" 2

int score;
int timer;

int goalX;
int goalY;

void initializeGame() {
    if (currentLevel == 1) {
        DMANow(3, level1TileMapMap, &((screenblock *)0x6000000)[30], (2048)/2);
    } else if (currentLevel == 2) {
        DMANow(3, level2TileMapMap, &((screenblock *)0x6000000)[30], (2048)/2);
    }

    DMANow(3, overlayTileMap, &((screenblock *)0x6000000)[29], (2048)/2);

    initializePlayer();
    initGems();
    initTimerBar();

    hOff = 0;
    vOff = 0;

    score = 0;
    timer = 1800;

    mgba_printf("player initialized");
}

void updateGame() {
    updatePlayer();




    updateGems();
    updateTimerBar();
    updateGoal();

    timer--;
    if (timer <= 0) {
        goToLose();
    }

    if (score >= 5) {
        if (currentLevel == 1) {
            level1GoalTiles();
        } else if (currentLevel == 2) {
            level2GoalTiles();
        }
    }

    if ((!(~(oldButtons) & ((1<<0))) && (~(buttons) & ((1<<0)))) && (!(~(oldButtons) & ((1<<1))) && (~(buttons) & ((1<<1))))) {
        if (currentLevel == 1) {
            DMANow(3, level1CheatTileMapMap, &((screenblock *)0x6000000)[30], (2048)/2);
        } else if (currentLevel == 2) {
            DMANow(3, level2CheatTileMapMap, &((screenblock *)0x6000000)[30], (2048)/2);
        }
    }
}

level1GoalTiles() {
    goalX = 224;
    goalY = 208;

    ((screenblock *)0x6000000)[30].tilemap[((26) * (32) + (28))] = ((11 & 0x3FF));
    ((screenblock *)0x6000000)[30].tilemap[((26) * (32) + (29))] = ((12 & 0x3FF));
    ((screenblock *)0x6000000)[30].tilemap[((27) * (32) + (28))] = ((19 & 0x3FF));
    ((screenblock *)0x6000000)[30].tilemap[((27) * (32) + (29))] = ((20 & 0x3FF));
}

level2GoalTiles() {
    goalX = 224;
    goalY = 80;
    ((screenblock *)0x6000000)[30].tilemap[((10) * (32) + (28))] = ((11 & 0x3FF));
    ((screenblock *)0x6000000)[30].tilemap[((10) * (32) + (29))] = ((12 & 0x3FF));
    ((screenblock *)0x6000000)[30].tilemap[((11) * (32) + (28))] = ((19 & 0x3FF));
    ((screenblock *)0x6000000)[30].tilemap[((11) * (32) + (29))] = ((20 & 0x3FF));
}

SPRITE gem[5];

void initGems() {
    if (currentLevel == 1) {
        setUpLevel1Gems();
    } else if (currentLevel == 2) {
        setUpLevel2Gems();
    }

    for (int i = 0; i < 5; i++) {
        gem[i].width = 16;
        gem[i].height = 16;
        gem[i].active = 1;
        gem[i].numOfFrames = 4;
        gem[i].timeUntilNextFrame = 15;
    }
}

void setUpLevel1Gems() {
    gem[0].x = 80;
    gem[0].y = 32;

    gem[1].x = 16;
    gem[1].y = 114;

    gem[2].x = 192;
    gem[2].y = 32;

    gem[3].x = 80;
    gem[3].y = 176;

    gem[4].x = 192;
    gem[4].y = 208;
}

void setUpLevel2Gems() {
    gem[0].x = 48;
    gem[0].y = 48;

    gem[1].x = 48;
    gem[1].y = 224;

    gem[2].x = 136;
    gem[2].y = 192;

    gem[3].x = 144;
    gem[3].y = 64;

    gem[4].x = 208;
    gem[4].y = 48;
}

void updateGems() {
    for (int i = 0; i < 5; i++) {
        if (gem[i].active && collision(player.x, player.y, player.width, player.height, gem[i].x, gem[i].y, gem[i].width, gem[i].height)) {
            score++;
            gem[i].active = 0;

            playSoundB(stateDing_data, stateDing_length, 0);
        }

        gem[i].timeUntilNextFrame--;
        if (gem[i].timeUntilNextFrame == 0) {
            gem[i].timeUntilNextFrame = 15;
            gem[i].frame = (gem[i].frame + 1) % gem[i].numOfFrames;
        }

        if(gem[i].active == 1
        && (gem[i].x + 16 - hOff) > 0
        && (gem[i].x - hOff) < 240
        && (gem[i].y + 16 - vOff) > 0
        && (gem[i].y - vOff) < 160) {
            shadowOAM[i + 10].attr0 = (0<<13) | (0<<14) | ((gem[i].y - vOff) & 0xFF);
            shadowOAM[i + 10].attr1 = (1<<14) | ((gem[i].x - hOff) & 0x1FF);
            shadowOAM[i + 10].attr2 = (((0) & 0xF) << 12) | (((4) * 32 + (2 + 2 * gem[i].frame)) & 0x3FF);
        } else {
            shadowOAM[i + 10].attr0 = (2<<8);
        }
    }
}

SPRITE timerBar[60];
int nextBarToErase;

void initTimerBar() {
    nextBarToErase = 60;
    for (int i = 0; i < 60; i++) {
        timerBar[i].y = 0;
        timerBar[i].x = i * 4;
        timerBar[i].active = 1;
    }
}

void updateTimerBar() {
    if (timer <= 450) {
        ((u16 *)0x5000200)[4] = (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10);
    }

    if (timer % 30 == 0) {
        timerBar[nextBarToErase].active = 0;
        nextBarToErase--;
    }

    for (int i = 0; i < 60; i++) {
        if (timerBar[i].active) {
            shadowOAM[i + 50].attr0 = (0<<13) | (0<<14) | ((timerBar[i].y) & 0xFF);
            shadowOAM[i + 50].attr1 = (0<<14) | ((timerBar[i].x) & 0x1FF);
            shadowOAM[i + 50].attr2 = (((0) & 0xF) << 12) | (((0) * 32 + (24)) & 0x3FF);
        } else {
            shadowOAM[i + 50].attr0 = (2<<8);
        }
    }
}

void levelDone() {
    if (currentLevel < 2) {
        currentLevel++;
        goToLevelComplete();
    } else {
        goToWin();
    }
}

void ding() {


}

void updateGoal() {
    if (score >= 5 && player.x == goalX && player.y == goalY) {
        levelDone();
    }
}
