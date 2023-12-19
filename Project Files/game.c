#include "gba.h"
#include "mode0.h"
#include "print.h"
#include "sprites.h"
#include "sound.h"
#include "player.h"
#include "spritesheet.h"
#include "game.h"
#include "testLevel.h"
#include "level1TileMap.h"
#include "level2TileMap.h"
#include "level1CheatTileMap.h"
#include "level2CheatTileMap.h"
#include "main.h"
#include "overlayTile.h"
#include "rollingSong.h"
#include "stateDing.h"

int score;
int timer;

int goalX;
int goalY;

void initializeGame() {    
    if (currentLevel == 1) {
        DMANow(3, level1TileMapMap, &SCREENBLOCK[30], level1TileMapMapLen/2);
    } else if (currentLevel == 2) {
        DMANow(3, level2TileMapMap, &SCREENBLOCK[30], level2TileMapMapLen/2);
    }

    DMANow(3, overlayTileMap, &SCREENBLOCK[29], overlayTileMapLen/2);
    
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
    // mgba_printf("score: %d", score);
    // mgba_printf("player updated");
    // mgba_printf("x : %d, y : %d", player.x, player.y);
    // mgba_printf("ismoving : %d, direction : %d", player.isMoving, player.direction);
    updateGems();
    updateTimerBar();
    updateGoal();

    timer--;
    if (timer <= 0) {
        goToLose();
    }

    if (score >= numGems) {
        if (currentLevel == 1) {
            level1GoalTiles();
        } else if (currentLevel == 2) {
            level2GoalTiles();
        }
    }

    if (BUTTON_PRESSED(BUTTON_A) && BUTTON_PRESSED(BUTTON_B)) {
        if (currentLevel == 1) {
            DMANow(3, level1CheatTileMapMap, &SCREENBLOCK[30], level1CheatTileMapMapLen/2);
        } else if (currentLevel == 2) {
            DMANow(3, level2CheatTileMapMap, &SCREENBLOCK[30], level2CheatTileMapMapLen/2);
        }
    }
}

level1GoalTiles() {
    goalX = 224;
    goalY = 208;

    SCREENBLOCK[30].tilemap[OFFSET(28, 26, 32)] = TMAP_ENTRY_TILEID(11); // Top Left
    SCREENBLOCK[30].tilemap[OFFSET(29, 26, 32)] = TMAP_ENTRY_TILEID(12); // Top Right
    SCREENBLOCK[30].tilemap[OFFSET(28, 27, 32)] = TMAP_ENTRY_TILEID(19); // Bottom Left
    SCREENBLOCK[30].tilemap[OFFSET(29, 27, 32)] = TMAP_ENTRY_TILEID(20); // Bottom Right
}

level2GoalTiles() {
    goalX = 224;
    goalY = 80;
    SCREENBLOCK[30].tilemap[OFFSET(28, 10, 32)] = TMAP_ENTRY_TILEID(11); // Top Left
    SCREENBLOCK[30].tilemap[OFFSET(29, 10, 32)] = TMAP_ENTRY_TILEID(12); // Top Right
    SCREENBLOCK[30].tilemap[OFFSET(28, 11, 32)] = TMAP_ENTRY_TILEID(19); // Bottom Left
    SCREENBLOCK[30].tilemap[OFFSET(29, 11, 32)] = TMAP_ENTRY_TILEID(20); // Bottom Right
}

SPRITE gem[numGems];

void initGems() {
    if (currentLevel == 1) {
        setUpLevel1Gems();
    } else if (currentLevel == 2) {
        setUpLevel2Gems();
    }

    for (int i = 0; i < numGems; i++) {
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
    for (int i = 0; i < numGems; i++) {
        if (gem[i].active && collision(player.x, player.y, player.width, player.height, gem[i].x, gem[i].y, gem[i].width, gem[i].height)) {
            score++;
            gem[i].active = 0;
            // ding();
            playSoundB(stateDing_data, stateDing_length, 0);
        }

        gem[i].timeUntilNextFrame--;
        if (gem[i].timeUntilNextFrame == 0) {
            gem[i].timeUntilNextFrame = 15;
            gem[i].frame = (gem[i].frame + 1) % gem[i].numOfFrames;
        }

        if(gem[i].active == 1 
        && (gem[i].x + 16 - hOff) > 0 
        && (gem[i].x - hOff) < SCREENWIDTH 
        && (gem[i].y + 16 - vOff) > 0 
        && (gem[i].y - vOff) < SCREENHEIGHT) {
            shadowOAM[i + 10].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(gem[i].y - vOff);
            shadowOAM[i + 10].attr1 = ATTR1_SMALL | ATTR1_X(gem[i].x - hOff);
            shadowOAM[i + 10].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(2 + 2 * gem[i].frame, 4);
        } else {
            shadowOAM[i + 10].attr0 = ATTR0_HIDE;
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
        SPRITEPALETTE[4] = RED;
    }

    if (timer % 30 == 0) {
        timerBar[nextBarToErase].active = 0;
        nextBarToErase--;
    }

    for (int i = 0; i < 60; i++) {
        if (timerBar[i].active) {
            shadowOAM[i + 50].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(timerBar[i].y);
            shadowOAM[i + 50].attr1 = ATTR1_TINY | ATTR1_X(timerBar[i].x);
            shadowOAM[i + 50].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(24,0);
        } else {
            shadowOAM[i + 50].attr0 = ATTR0_HIDE;
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
    // REG_SND2CNT = DMG_ENV_VOL(14) | DMG_STEP_TIME(1);
    // REG_SND2FREQ = NOTE_D7 | SND_RESET;
}

void updateGoal() {
    if (score >= numGems && player.x == goalX && player.y == goalY) {
        levelDone();
    }
}