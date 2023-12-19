#include "gba.h"
#include "game.h"
#include "mode0.h"
#include "print.h"
#include "sprites.h"
#include "player.h"
#include "spritesheet.h"
#include "main.h"
#include "level1CollisionMap.h"
#include "level2CollisionMap.h"
#include "testLevelCollisionMap.h"

inline unsigned char colorAt(int x, int y) {
    if (currentLevel == 1) {
        return ((unsigned char*)level1CollisionMapBitmap)[OFFSET(x, y, MAPWIDTH)];
    } else if (currentLevel == 2) {
        return ((unsigned char*)level2CollisionMapBitmap)[OFFSET(x, y, MAPWIDTH)];
    }
}

int justMoved;
int nextDirection;

void initializePlayer() {
    // Initializing player sprite
    player.width = 16;
    player.height = 16;
    // player.x = MAPWIDTH/2 - player.width/2;
    // player.y = MAPHEIGHT/2 - player.height/2;
    player.x = 16;
    player.y = 16;
    player.numOfFrames = 4;
    // player.direction = UP;
    player.timeUntilNextFrame = 20;
    player.dx = 8;
    player.dy = 8;
    player.isMoving = 0;
}

void updatePlayer() {
    // Pre-calculated locations on the sprite
    int leftX = player.x;
    int rightX = player.x + player.width - 1;
    int topY = player.y;
    int bottomY = player.y + player.height - 1;

    // player moves in direction until it hits a wall
    if (player.isMoving == 1) {
        switch (player.direction) {
            case UP:
                if (player.y > 0 && colorAt(leftX, topY - player.dy) && colorAt(rightX, topY - player.dy))
                    player.y -= player.dy;
                else
                    player.isMoving = 0;
                break;
            case DOWN:
                if ((player.y + player.height < MAPHEIGHT) && colorAt(leftX, bottomY + player.dy) && colorAt(rightX, bottomY + player.dy))
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
                if ((player.x + player.width < MAPWIDTH) && colorAt(rightX + player.dx, topY) && colorAt(rightX + player.dx, bottomY))
                    player.x += player.dx;
                else
                    player.isMoving = 0;
                break;
        }

        if (BUTTON_PRESSED(BUTTON_DOWN)) {
            nextDirection = 0;
        } else if (BUTTON_PRESSED(BUTTON_UP)) {
            nextDirection = 1;
        } else if (BUTTON_PRESSED(BUTTON_LEFT)) {
            nextDirection = 2;
        } else if (BUTTON_PRESSED(BUTTON_RIGHT)) {
            nextDirection = 3;
        }
        
    } else {
        if (nextDirection != NULL) {
            player.isMoving = 1;
            player.direction = nextDirection;
            justMoved = 2;
            nextDirection = 4;
        } else if (BUTTON_PRESSED(BUTTON_UP)) {
            player.isMoving = 1;
            player.direction = UP;
            justMoved = 2;
        } else if (BUTTON_PRESSED(BUTTON_DOWN)) {
            player.isMoving = 1;
            player.direction = DOWN;
            justMoved = 2;
        } else if (BUTTON_PRESSED(BUTTON_LEFT)) {
            player.isMoving = 1;
            player.direction = LEFT;
            justMoved = 2;
        } else if (BUTTON_PRESSED(BUTTON_RIGHT)) {
            player.isMoving = 1;
            player.direction = RIGHT;
            justMoved = 2;
        }
    }

    // TODO 2.1: Center screen on player as much as possible without wrapping
    if (hOff + SCREENWIDTH < MAPWIDTH && player.x - hOff >= SCREENWIDTH / 2)
        hOff+=1;

    if (hOff > 0 && player.x - hOff <= SCREENWIDTH / 2)
        hOff-=1;

    if (vOff + SCREENHEIGHT < MAPHEIGHT && player.y - vOff >= SCREENHEIGHT / 2)
        vOff+=1;

    if (vOff > 0 && player.y - vOff <= SCREENHEIGHT / 2)
        vOff-=1;

    player.timeUntilNextFrame--;
    if (player.timeUntilNextFrame == 0) {
        player.timeUntilNextFrame = 20;
        player.frame = (player.frame + 1) % player.numOfFrames;
    }

    // TODO 1.3: Update shadowOAM
    if (player.isMoving) {
        if (justMoved != 0) {
            shadowOAM[0].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(player.y - vOff);
            shadowOAM[0].attr1 = ATTR1_SMALL | ATTR1_X(player.x - hOff);
            shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, player.frame * 2);
            justMoved--;
        } else {
            if (player.direction == UP) {
                shadowOAM[0].attr0 = ATTR0_4BPP | ATTR0_TALL | ATTR0_Y(player.y - vOff);
                shadowOAM[0].attr1 = ATTR1_MEDIUM | ATTR1_X(player.x - hOff);
                shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8, 0);
            } else if (player.direction == DOWN) {
                shadowOAM[0].attr0 = ATTR0_4BPP | ATTR0_TALL | ATTR0_Y(player.y - vOff - 16);
                shadowOAM[0].attr1 = ATTR1_MEDIUM | ATTR1_X(player.x - hOff);
                shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(6, 0);
            } else if (player.direction == LEFT) {
                shadowOAM[0].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_Y(player.y - vOff);
                shadowOAM[0].attr1 = ATTR1_MEDIUM | ATTR1_X(player.x - hOff);
                shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(2, 2);
            } else if (player.direction == RIGHT) {
                shadowOAM[0].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_Y(player.y - vOff);
                shadowOAM[0].attr1 = ATTR1_MEDIUM | ATTR1_X(player.x - hOff - 16);
                shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(2, 0);
            }
        }
    } else {
        shadowOAM[0].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(player.y - vOff);
        shadowOAM[0].attr1 = ATTR1_SMALL | ATTR1_X(player.x - hOff);
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, player.frame * 2);
    }
}