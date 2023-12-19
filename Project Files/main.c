/*
Working: Everything
Nice-To-Haves: Better music and sound effects.
Controls: Up, Down, Left, and Right to move player. START to pause. A and B simultaneously for cheat.
*/

#include "gba.h"
#include "mode0.h"
#include "print.h"
#include "sprites.h"
#include "sound.h"
#include "player.h"
#include "main.h" // function prototypes
#include "game.h"
#include "tileset.h"
#include "startScreen.h"
#include "instructScreen.h"
#include "winScreen.h"
#include "loseScreen.h"
#include "spritesheet.h"
#include "startBitmap.h"
#include "instruction.h"
#include "levelCompleteBG.h"
#include "gameOver.h"
#include "winBG.h"
#include "rollingSong.h"
#include "stateDing.h"

void interruptHandler();

// states
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

    // start debugging
    mgba_open();
    mgba_printf("Debugging Initialized");

    while (1) {
        oldButtons = buttons;
        buttons = REG_BUTTONS;

        // state machine
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
        REG_BG0HOFF = hOff;
        REG_BG0VOFF = vOff;
        REG_BG1HOFF = hOff/2;
        REG_BG1VOFF = vOff/2;
        DMANow(3, shadowOAM, OAM, 128*4);
    }
}


void initialize() {
    REG_SOUNDCNT_X = SND_ENABLED;
    REG_SOUNDCNT_L = DMG_VOL_LEFT(7) |
                   DMG_VOL_RIGHT(7) |
                   DMG_SND1_LEFT |
                   DMG_SND1_RIGHT |
                   DMG_SND2_LEFT |
                   DMG_SND2_RIGHT |
                   DMG_SND3_LEFT |
                   DMG_SND3_RIGHT |
                   DMG_SND4_LEFT |
                   DMG_SND4_RIGHT;
    REG_SOUNDCNT_H = DMG_MASTER_VOL(2);

    goToStart();
    currentLevel = 1;

    setupSounds();
    setupInterrupts();
}

// start
void goToStart() {
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);

    REG_DISPCTL = MODE(3) | BG_ENABLE(2);
    DMANow(3, startBitmapBitmap, videoBuffer, 240 * 160);


    state = START;
    currentLevel = 1;
    // playSoundA(rollingSong_data, rollingSong_length, 1);
}

void start() {
    if(BUTTON_PRESSED(BUTTON_START)) {
        goToInstructions();
    }
}

// instructions
void goToInstructions() {
    state = INSTRUCTIONS;
    DMANow(3, instructionBitmap, videoBuffer, 240 * 160);
    playSoundB(stateDing_data, stateDing_length, 0);
}

void instructions() {
    if(BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
}

// game
void goToGame() {
    state = GAME;

    playSoundB(stateDing_data, stateDing_length, 0);

    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | BG_ENABLE(1) | SPRITE_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(30) | BG_SIZE_LARGE | BG_4BPP; 
    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(29) | BG_SIZE_SMALL | BG_4BPP; 

    DMANow(3, tilesetTiles, &CHARBLOCK[0], sizeof(tilesetTiles)/2);
    DMANow(3, tilesetPal, PALETTE, sizeof(tilesetPal)/2);

    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen/2);
    DMANow(3, spritesheetPal, SPRITEPALETTE, 256);

    initializeGame();
}

void game() {
    updateGame();
    if(BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
}

// level complete
void goToLevelComplete() {
    state = LEVELCOMPLETE;
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);
    REG_DISPCTL = MODE(3) | BG_ENABLE(2);
    DMANow(3, levelCompleteBGBitmap, videoBuffer, 240 * 160);
}

void levelComplete() {
    if(BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
}

// pause
void goToPause() {
    state = PAUSE;
    shadowOAM[2].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(8);
    shadowOAM[2].attr1 = ATTR1_SMALL | ATTR1_X(216);
    shadowOAM[2].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(22, 0);
    playSoundB(stateDing_data, stateDing_length, 0);
}

void pause() {
    if(BUTTON_PRESSED(BUTTON_START)) {
        state = GAME;
        shadowOAM[2].attr0 = ATTR0_HIDE;
        playSoundB(stateDing_data, stateDing_length, 0);
    }
    if(BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
        playSoundB(stateDing_data, stateDing_length, 0);
    }
}

// win
void goToWin() {
    state = WIN;
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128*4);

    hOff = 0;
    vOff = 0;
    
    REG_DISPCTL = MODE(3) | BG_ENABLE(2);
    DMANow(3, winBGBitmap, videoBuffer, 240 * 160);
    // playSoundA(rollingSong_data, rollingSong_length, 1);
}

void win() {
    if(BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

// lose
void goToLose() {
    state = LOSE;
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128*4);
    
    hOff = 0;
    vOff = 0;

    REG_DISPCTL = MODE(3) | BG_ENABLE(2);
    DMANow(3, gameOverBitmap, videoBuffer, 240 * 160);
    playSoundB(stateDing_data, stateDing_length, 0);
}

void lose() {
    if(BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void setupInterrupts() {
	REG_IME = 0;
    REG_IE = IRQ_VBLANK | IRQ_TIMER(2) | IRQ_TIMER(3);
    REG_DISPSTAT = DISPSTAT_VBLANK_IRQ;
    REG_INTERRUPT = &interruptHandler;
	REG_IME = 1;
}

void interruptHandler() {
	REG_IME = 0;
	if (REG_IF & IRQ_VBLANK) {
        if (soundA.isPlaying) {
            soundA.vBlankCount++;
            if (soundA.vBlankCount >= soundA.durationInVBlanks) {
                if(soundA.looping) {
                    soundA.vBlankCount = 0;
                    playSoundA(soundA.data, soundA.dataLength, 1);
                } else {
                    !soundA.isPlaying;
                    REG_TM0CNT = TIMER_OFF;
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
                    REG_TM1CNT = TIMER_OFF;
                    dma[2].cnt = 0;
                }
            }
        }
	}
    REG_IF = REG_IF;
    REG_IME = 1;
}