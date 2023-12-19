#include "gba.h"
#include "sound.h"

void setupSounds() {

    REG_SOUNDCNT_X = SND_ENABLED;

	REG_SOUNDCNT_H = SND_OUTPUT_RATIO_100 |
                     DSA_OUTPUT_RATIO_100 |
                     DSA_OUTPUT_TO_BOTH |
                     DSA_TIMER0 |
                     DSA_FIFO_RESET |
                     DSB_OUTPUT_RATIO_100 |
                     DSB_OUTPUT_TO_BOTH |
                     DSB_TIMER1 |
                     DSB_FIFO_RESET;

	REG_SOUNDCNT_L = 0;

}

// TODO 1.0: Complete this function
void playSoundA(const signed char* data, int dataLength, int looping) {
    
    // Set DMA channel to 1
    DMANow(1, data, REG_FIFO_A, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

    // Set up timer 0
    REG_TM0CNT = TIMER_OFF;
    int cyclesPerSample = PROCESSOR_CYCLES_PER_SECOND / SOUND_FREQ;
    REG_TM0D = 65536 - cyclesPerSample;
    REG_TM0CNT = TIMER_ON;

    // Initialize struct members of soundA
    soundA.data = data;
    soundA.dataLength = dataLength;
    soundA.isPlaying = 1;
    soundA.looping = looping;
    soundA.durationInVBlanks = (VBLANK_FREQ * dataLength) / SOUND_FREQ;
    soundA.vBlankCount = 0;
}

// TODO 1.1: Complete this function
void playSoundB(const signed char* data, int dataLength, int looping) {

    // Set DMA channel to 2
    DMANow(2, data, REG_FIFO_B, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

    // Set up timer 1
    REG_TM1CNT = TIMER_OFF;
    int cyclesPerSample = PROCESSOR_CYCLES_PER_SECOND / SOUND_FREQ;
    REG_TM1D = 65536 - cyclesPerSample;
    REG_TM1CNT = TIMER_ON;

    // Initialize struct members of soundB
    soundB.data = data;
    soundB.dataLength = dataLength;
    soundB.isPlaying = 1;
    soundB.looping = looping;
    soundB.durationInVBlanks = (VBLANK_FREQ * dataLength) / SOUND_FREQ;
    soundB.vBlankCount = 0;
}

// TODO 5.0: Complete this function
void pauseSounds() {
    soundA.isPlaying = 0;
    REG_TM0CNT = TIMER_OFF;
    soundB.isPlaying = 0;
    REG_TM1CNT = TIMER_OFF;
}

// TODO 5.1: Complete this function
void unpauseSounds() {
    soundA.isPlaying = 1;
    REG_TM0CNT = TIMER_ON;
    soundB.isPlaying = 1;
    REG_TM1CNT = TIMER_ON;
}

// TODO 5.2: Complete this function
void stopSounds() {
    soundA.isPlaying = 0;
    REG_TM0CNT = TIMER_OFF;
    dma[1].cnt = 0;
    soundB.isPlaying = 0;
    REG_TM1CNT = TIMER_OFF;
    dma[2].cnt = 0;
}