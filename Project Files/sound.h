#include "gba.h"

#ifndef ANALOG_SOUND_H
#define ANALOG_SOUND_H

// register definitions
#define REG_SOUNDCNT_L        *(volatile u16*)0x04000080
#define REG_SOUNDCNT_H        *(volatile u16*)0x04000082
#define REG_SOUNDCNT_X        *(volatile u16*)0x04000084
#define REG_SOUNDBIAS         *(volatile u16*)0x04000086


// flags
#define SND_ENABLED           (1<<7)
#define SND_OUTPUT_RATIO_25   0
#define SND_OUTPUT_RATIO_50   (1<<0)
#define SND_OUTPUT_RATIO_100  (1<<1)

#define REG_SND1SWEEP     *(volatile u16*)0x04000060
#define REG_SND1CNT       *(volatile u16*)0x04000062
#define REG_SND1FREQ      *(volatile u16*)0x04000064

#define REG_SND2CNT       *(volatile u16*)0x04000068
#define REG_SND2FREQ      *(volatile u16*)0x0400006C

#define REG_SND3SEL       *(volatile u16*)0x04000070
#define REG_SND3CNT       *(volatile u16*)0x04000072
#define REG_SND3FREQ      *(volatile u16*)0x04000074

#define REG_SND4CNT       *(volatile u16*)0x04000078
#define REG_SND4FREQ      *(volatile u16*)0x0400007C

// Channel 3 Wave Pattern RAM (2 banks!!)
#define REG_SND3_WAV      *(volatile u16*)0x04000090

#define DMG_SND1_LEFT         (1 << 8)
#define DMG_SND2_LEFT         (1 << 9)
#define DMG_SND3_LEFT         (1 << 10)
#define DMG_SND4_LEFT         (1 << 11)

#define DMG_SND1_RIGHT        (1 << 12)
#define DMG_SND2_RIGHT        (1 << 13)
#define DMG_SND3_RIGHT        (1 << 14)
#define DMG_SND4_RIGHT        (1 << 15)

// n: [0-7]
#define DMG_VOL_LEFT(n)       (((n) & 7) << 0)
#define DMG_VOL_RIGHT(n)      (((n) & 7) << 4)

// n: [0-15]
#define DMG_ENV_VOL(n)        (((n) & 15) << 12)

// n: [0-7]
#define DMG_STEP_TIME(n)      (((n) & 7) << 8)

#define DMG_DIRECTION_DECR    (0 << 11)
#define DMG_DIRECTION_INCR    (1 << 11) 

#define DMG_DUTY_12           (0 << 6)
#define DMG_DUTY_25           (1 << 6)
#define DMG_DUTY_50           (2 << 6)
#define DMG_DUTY_75           (3 << 6)

// n: [0-2]
#define DMG_MASTER_VOL(n)     ((n) % 3)

#define SND_RESET             (1<<15)

#define DMG_FREQ_TIMED        (1<<14)
#define DMG_SWEEP_NUM(n)      ((n) & 7)
#define DMG_SWEEP_UP          (0 << 3)
#define DMG_SWEEP_DOWN        (1 << 3)
#define DMG_SWEEP_STEPTIME(n) (((n) & 7) << 4)

enum {
  REST      = 0,
  NOTE_C2   =44,
  NOTE_CS2  =157,
  NOTE_D2	=263,
  NOTE_DS2  =363,
  NOTE_E2   =457,
  NOTE_F2   =547,
  NOTE_FS2  =631,
  NOTE_G2   =711,
  NOTE_GS2  =786,
  NOTE_A2   =856,
  NOTE_AS2  =923,
  NOTE_B2   =986,
  NOTE_C3   =1046,
  NOTE_CS3  =1102,
  NOTE_D3   =1155,
  NOTE_DS3  =1205,
  NOTE_E3   =1253,
  NOTE_F3   =1297,
  NOTE_FS3  =1339,
  NOTE_G3   =1379,
  NOTE_GS3  =1417,
  NOTE_A3   =1452,
  NOTE_AS3  =1486,
  NOTE_B3   =1517,
  NOTE_C4   =1547,
  NOTE_CS4  =1575,
  NOTE_D4   =1602,
  NOTE_DS4  =1627,
  NOTE_E4   =1650,
  NOTE_F4   =1673,
  NOTE_FS4  =1694,
  NOTE_G4   =1714,
  NOTE_GS4  =1732,
  NOTE_A4   =1750,
  NOTE_AS4  =1767,
  NOTE_B4   =1783,
  NOTE_C5   =1798,
  NOTE_CS5  =1812,
  NOTE_D5   =1825,
  NOTE_DS5  =1837,
  NOTE_E5   =1849,
  NOTE_F5   =1860,
  NOTE_FS5  =1871,
  NOTE_G5   =1881,
  NOTE_GS5  =1890,
  NOTE_A5   =1899,
  NOTE_AS5  =1907,
  NOTE_B5   =1915,
  NOTE_C6   =1923,
  NOTE_CS6  =1930,
  NOTE_D6   =1936,
  NOTE_DS6  =1943,
  NOTE_E6   =1949,
  NOTE_F6   =1954,
  NOTE_FS6  =1959,
  NOTE_G6   =1964,
  NOTE_GS6  =1969,
  NOTE_A6   =1974,
  NOTE_AS6  =1978,
  NOTE_B6   =1982,
  NOTE_C7   =1985,
  NOTE_CS7  =1989,
  NOTE_D7   =1992,
  NOTE_DS7  =1995,
  NOTE_E7   =1998,
  NOTE_F7   =2001,
  NOTE_FS7  =2004,
  NOTE_G7   =2006,
  NOTE_GS7  =2009,
  NOTE_A7   =2011,
  NOTE_AS7  =2013,
  NOTE_B7   =2015,
  NOTE_C8   =2017
} NOTES;

void setupSounds();
void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void pauseSounds();
void unpauseSounds();
void stopSounds();

#define SOUND_FREQ 11025
#define REG_SOUNDCNT_X *(volatile u16 *)0x04000084

#define PROCESSOR_CYCLES_PER_SECOND (16777216)
#define VBLANK_FREQ (59.727)

// register definitions
#define REG_SOUNDCNT_L        *(u16*)0x04000080
#define REG_SOUNDCNT_H        *(volatile u16*)0x04000082

// flags
#define SND_ENABLED           (1<<7)
#define SND_OUTPUT_RATIO_25   0
#define SND_OUTPUT_RATIO_50   (1<<0)
#define SND_OUTPUT_RATIO_100  (1<<1)
#define DSA_OUTPUT_RATIO_50   (0<<2)
#define DSA_OUTPUT_RATIO_100  (1<<2)
#define DSA_OUTPUT_TO_RIGHT   (1<<8)
#define DSA_OUTPUT_TO_LEFT    (1<<9)
#define DSA_OUTPUT_TO_BOTH    (3<<8)
#define DSA_TIMER0            (0<<10)
#define DSA_TIMER1            (1<<10)
#define DSA_FIFO_RESET        (1<<11)
#define DSB_OUTPUT_RATIO_50   (0<<3)
#define DSB_OUTPUT_RATIO_100  (1<<3)
#define DSB_OUTPUT_TO_RIGHT   (1<<12)
#define DSB_OUTPUT_TO_LEFT    (1<<13)
#define DSB_OUTPUT_TO_BOTH    (3<<12)
#define DSB_TIMER0            (0<<14)
#define DSB_TIMER1            (1<<14)
#define DSB_FIFO_RESET        (1<<15)

// FIFO address defines
#define REG_FIFO_A          (u16*)0x040000A0
#define REG_FIFO_B          (u16*)0x040000A4


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

#endif