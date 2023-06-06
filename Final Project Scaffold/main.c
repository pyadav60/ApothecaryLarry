//AHOY! There is a pdf that I submitted alongside this! (THE LAST ONE!!) That has all the info you need!

#include "gba.h"
#include "mode0.h"
#include "print.h"
#include "sprites.h"
//Music!
#include "sound.h"
#include "town.h"       //Littleroot Town, Pokemon RSE OST
#include "reflect.h"    //Reflection, Hollow Knight OST
#include "flip.h"       //Page flip sound from youtube lol idk
#include "shroom.h"     //Underground Mushroom Theme, Terraria OST
#include "surf.h"       //Surf Theme, Pokemon FRLG
#include "townWin.h"    //Littleroot Town Guitar Cover, Joshua Sandoval on Youtube
#include "flower.h"     //Floral Fury, Cuphead OST
#include "secret.h"     //Secret Item, Zelda Ocarina of Time OST
//4BPPTileset and Spritesheet
#include "ss.h"
#include "ts.h"
#include "tsCave.h"
#include "tsFish.h"
//Backgrounds
#include "snow.h"
#include "cave.h"
#include "caveCheat.h"
#include "leaf.h"
#include "fish.h"
#include "world.h"//8BPP
#include "epic.h"
#include "fall.h"
#include "rain.h"
//Collision maps, 8BPP Bitmaps
#include "worldCol.h"
#include "fishCol.h"
#include "snowCol.h"
#include "leafCol.h"
#include "caveCol.h"

//State Screens
#include "start.h"
#include "pause.h"
#include "win.h"
#include "how.h"

//Camera and Randomization
#define MAPWIDTH 512
#define MAPHEIGHT 512
int rSeed;

//States
enum {START, GAME, PAUSE, WIN, INSTRUCTIONS, SNOW, CAVE, FISH, LEAF};
int state;
int sailing;

//Collision handling
unsigned char* collisionbitmap;
inline unsigned char colorAt(int x, int y) {
    if (state == GAME) {
        collisionbitmap = (unsigned char*) worldColBitmap;
    } else if (state == FISH) {
        collisionbitmap = (unsigned char*) fishColBitmap;
    } else if (state == SNOW) {
        collisionbitmap = (unsigned char*) snowColBitmap;
    } else if (state == LEAF) {
        collisionbitmap = (unsigned char*) leafColBitmap;
    } else if (state == CAVE) {
        collisionbitmap = (unsigned char*) caveColBitmap;
    }

    if (sailing) {
        return !collisionbitmap[OFFSET(x,y,MAPWIDTH)];
    }
    return collisionbitmap[OFFSET(x,y,MAPWIDTH)];
}

void initialize();
inline unsigned char colorAt();
OBJ_ATTR shadowOAM[128];

// prototypes
void testTilemap();
void initialize();
void update();
void draw();
// sound
void setupInterrupts();
void interruptHandler();
void setupSoundsReal();
// state prototypes
void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToInstructions();
void instructions();
//Dreams within a dream! AKA the minigames/ other areas
void goToSnow();
void snow();
void goToCave();
void cave();
void goToLeaf();
void leaf();
void goToFish();
void fish();

//Directions
typedef enum {DOWN, UP, LEFT, RIGHT} DIRECTION;
typedef enum {RBOT, LBOT, LTOP, RTOP} DIAG;

//SPRITES
SPRITE player;
SPRITE sherry;
SPRITE jumpy;
//Sounds
SONG town;
SONG reflect;
SONG flip;
SONG shroom;
SONG surf;
SONG secret;
SONG flower;
SONG townWin;


//Buttons
unsigned short oldButtons;
unsigned short buttons;

//Important integers
int hOff;
int vOff;
int fallH;
int fallV;
int diag;
int detroit; //SMASH
//Ingredients + Items
int gotFish;
int gotCarrot;
int gotBerry;
int gotCrystal;
int gotKey;
//Timers
int time;
int bob;
int jumptimer;
int bute;
int litty;
int terr;
//Fishing Minigame
int reel;
int meter;
int reelFrame;
//Camp Minigame
int camping;
int mark;
int markpal;
int markd;
int burnd;
int burn;
int flame1;
int flame2;
int flame3;
int flame4;
int flame5;
//Cheat booleans and ints
int caveCheatInt;
int leafCheat;
int snowCheat;
int fishCheat;
int oil;
int more;
int mored;
int cheeta;
int cheetad;

int main() {
    setupSoundsReal();
    goToStart();
    while (1) {
        oldButtons = buttons;
        buttons = REG_BUTTONS;
        //State machine
        switch (state) {
            case START:
                start();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case INSTRUCTIONS:
                instructions();
                break;
            case SNOW:
                snow();
                break;
            case CAVE:
                cave();
                break;
            case FISH:
                fish();
                break;
            case LEAF:
                leaf();
                break;
        }
        waitForVBlank();
        DMANow(3, shadowOAM, OAM, 128*4);

        //A variety of time based variables that run every frame are handled below.

        time++; //Time
        fallV-=3; //Vertical snow/rainfall 
        fallH--; //Horizontal wind
        if (time == 10000000) { //Lazy multiuse time variable
            time = 0;
        }
        if (time % 2 == 0) { //Campfire Anim
            litty++;
            if(litty == 4) {
                litty = 0;
            }
        }

        if (time % 5 == 0) { //Teri Anim
            terr++;
            if(terr == 4) {
                terr = 0;
            }
        }

        if (time % 6 == 0) { //Button Anim
            bute++;
            if(bute == 3) {
                bute = 0;
            }
        }
        if (jumptimer > 0) jumptimer--; //Jumping animation

        if (cheetad > 0) cheetad--; //Cheat banner animation
        if(cheetad != 5) { 
            cheeta += cheetad;
        }

        //Fishing meter
        if (meter < 160) meter++;
        if (meter > 160) meter--;

        //Fishing rod reel tug effect
        if (time % 10 == 0) {
            reelFrame--;
            if (reelFrame == -1) {
                reelFrame = 7;
            }
        }

        //Mark
        if (markd && mark+1 < 137) {
            mark++;
        } else if (!markd && mark-1 > 20) {
            mark--;
        } else {
            markd = !markd;
        }
        //Burn
        if (burnd && burn+4 < 124) {
            burn+= 2;
        } else if (!burnd && burn-4 > 20) {
            burn-= 2;
        } else {
            burnd = !burnd;
        }
        //More (Fire)
        if (mored && more+4 < 124) {
            more+= 2;
        } else if (!mored && more-4 > 20) {
            more-= 2;
        } else {
            mored = !mored;
        }

        if (gotBerry&&gotCarrot&&gotCrystal&&gotFish && state == GAME && collision(player.x,player.y,16,16,264,240,46,23)) { //Epic win condition holy omg this is so awesome
            detroit = 1;
            if(BUTTON_PRESSED(BUTTON_A)) {
                detroit = 0;
                gotFish = 0;
                gotCarrot = 0;
                gotBerry = 0;
                gotCrystal = 0;
                playSoundA(townWin.data, townWin.length, 1);
                goToWin();
            }
        }
    }
}

void initialize() {
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;

    // Loading sprites into appropriate place in memory
    DMANow(3, ssTiles, &CHARBLOCK[4], ssTilesLen/2);
    DMANow(3, ssPal, SPRITEPALETTE, 256);

    // Initializing hOff and vOff
    hOff = 0;
    vOff = 0;

    // Initializing player sprite
    player.width = 15;
    player.height = 15;
    player.x = 264;
    player.y = 264;
    player.numOfFrames = 8;
    player.direction = DOWN;
    player.timeUntilNextFrame = 10;
    player.xDel = 2;
    player.yDel = 2;

    // Initializing player sprite
    jumpy.width = 15;
    jumpy.height = 15;
    jumpy.x = 32;
    jumpy.y = 448;
    jumpy.numOfFrames = 8;
    jumpy.direction = RIGHT;
    jumpy.timeUntilNextFrame = 10;
    jumpy.xDel = 2;
    jumpy.yDel = 2;

    sherry.x = 280;
    sherry.y = 320;
    burn = 56;
    mark = 56;
    more = 90;
    sailing = 0;
    flame1 = 0;
    flame2 = 0;
    flame3 = 0;
    flame4 = 0;
    flame5 = 0;
    gotKey = 0;
    caveCheatInt = 0;
    snowCheat = 0;
    leafCheat = 0;
    fishCheat = 0;
    oil = 0;
}

void setupSoundsReal() { //Loads in all the songs!
    setupInterrupts();
    setupSounds();
    town.sampleRate = town_sampleRate;
    town.length = town_length;
    town.data = (signed char*) town_data;

    flip.sampleRate = flip_sampleRate;
    flip.length = flip_length - 800;
    flip.data = (signed char*) flip_data;

    reflect.sampleRate = reflect_sampleRate;
    reflect.length = reflect_length;
    reflect.data = (signed char*) reflect_data;

    townWin.sampleRate = townWin_sampleRate;
    townWin.length = townWin_length;
    townWin.data = (signed char*) townWin_data;

    secret.sampleRate = secret_sampleRate;
    secret.length = secret_length;
    secret.data = (signed char*) secret_data;

    flower.sampleRate = flower_sampleRate;
    flower.length = flower_length;
    flower.data = (signed char*) flower_data;

    shroom.sampleRate = shroom_sampleRate;
    shroom.length = shroom_length;
    shroom.data = (signed char*) shroom_data;

    surf.sampleRate = surf_sampleRate;
    surf.length = surf_length;
    surf.data = (signed char*) surf_data;

    playSoundA(town.data, town.length, 1);
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

        // TODO 2.0: Handle soundA
        if (soundA.isPlaying) {
            soundA.vBlankCount++;
            if (soundA.vBlankCount > soundA.durationInVBlanks) {
                if (soundA.looping) {
                    playSoundA(soundA.data, soundA.dataLength, soundA.looping);
                } else {
                    soundA.isPlaying = 0;
                    REG_TM0CNT = 0;
                    dma[1].cnt = 0;
                }
            }
        }

        // TODO 2.1: Handle soundB
        if (soundB.isPlaying) {
            soundB.vBlankCount++;
            if (soundB.vBlankCount > soundB.durationInVBlanks) {
                if (soundB.looping) {
                    playSoundB(soundB.data, soundB.dataLength, soundB.looping);
                } else {
                    soundB.isPlaying = 0;
                    REG_TM1CNT = 0;
                    dma[2].cnt = 0;
                }
            }
        }

    }

    if (REG_IF & IRQ_TIMER(2)) {
        // second has passed
    } 

    if (REG_IF & IRQ_TIMER(3)) {
        // minute has passed
    }

    REG_IF = REG_IF;
    REG_IME = 1;

}

// sets up the start state
void goToStart() {
    initialize();
    hideSprites();
    REG_DISPCTL = MODE(0) | BG_ENABLE(0);
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_SIZE_LARGE;

    DMANow(3, startTiles, &CHARBLOCK[0], sizeof(startTiles)/2); // loading tileset into charblock 0
    DMANow(3, startPal, PALETTE, sizeof(startPal)/2); // loading palette
    DMANow(3, startMap, &SCREENBLOCK[28], startMapLen/2);

    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    state = START;
}// runs every frame of the start state
void start() {
    rSeed++;
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        srand(rSeed);
        playSoundB(flip.data, flip.length, 0);
        goToGame();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        srand(rSeed);
        playSoundB(flip.data, flip.length, 0);
        goToInstructions();
    }
}

// sets up the game state
void goToGame() {
    hideSprites();
    cheeta = 0;
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(24) | BG_SIZE_LARGE;

    DMANow(3, worldTiles, &CHARBLOCK[0], sizeof(worldTiles)/2); // loading tileset into charblock 0
    DMANow(3, worldPal, PALETTE, sizeof(worldPal)/2); // loading palette
    DMANow(3, worldMap, &SCREENBLOCK[24], worldMapLen/2);
    state = GAME;
}// Runs every frame of the game state
void game() {
    update();
    waitForVBlank();
    draw();

    if (BUTTON_PRESSED(BUTTON_START)) {
        playSoundB(flip.data, flip.length, 0);
        goToPause();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        playSoundB(flip.data, flip.length, 0);
        goToWin();
    }

    if(player.x < 5 && player.y < 5) {
        playSoundA(reflect.data, reflect.length, 1);
        goToSnow();
    } else if(player.x > 490 && player.y < 5) {
        goToFish();
    } else if(collision(player.x,player.y,16,16,32,464,16,16)) {
        playSoundA(shroom.data, shroom.length, 1);
        goToCave();
    } else if(player.x > 490 && player.y > 490) {
        playSoundA(flower.data, flower.length, 1);
        goToLeaf();
    }
}

// Sets up the pause state
void goToPause() {
    hideSprites();
    REG_DISPCTL = MODE(0) | BG_ENABLE(0);
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_SIZE_LARGE;

    DMANow(3, pauseTiles, &CHARBLOCK[0], sizeof(pauseTiles)/2); // loading tileset into charblock 0
    DMANow(3, pausePal, PALETTE, sizeof(pausePal)/2); // loading palette
    DMANow(3, pauseMap, &SCREENBLOCK[28], pauseMapLen/2);

    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    state = PAUSE;
}// Runs every frame of the pause state
void pause() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        playSoundB(flip.data, flip.length, 0);
        goToGame();
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        playSoundB(flip.data, flip.length, 0);
        goToStart();
    }
}

// Sets up the win state
void goToWin() {
    hideSprites();
    REG_DISPCTL = MODE(0) | BG_ENABLE(0);
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_SIZE_LARGE;
    DMANow(3, winTiles, &CHARBLOCK[0], sizeof(winTiles)/2); // loading tileset into charblock 0
    DMANow(3, winPal, PALETTE, sizeof(winPal)/2); // loading palette
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    DMANow(3, winMap, &SCREENBLOCK[28], winMapLen/2);
    state = WIN;
}// Runs every frame of the win state
void win() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        playSoundB(flip.data, flip.length, 0);
        playSoundA(town.data, town.length, 1);
        goToStart();
    }
}

// Sets up the instructions state
void goToInstructions() {
    hideSprites();
    REG_DISPCTL = MODE(0) | BG_ENABLE(0);
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_SIZE_LARGE;

    DMANow(3, howTiles, &CHARBLOCK[0], sizeof(howTiles)/2); // loading tileset into charblock 0
    DMANow(3, howPal, PALETTE, sizeof(howPal)/2); // loading palette
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    DMANow(3, howMap, &SCREENBLOCK[28], howMapLen/2);
    state = INSTRUCTIONS;
}// Runs every frame of the instructions state
void instructions() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        playSoundB(flip.data, flip.length, 0);
        goToStart();
    }
}

// Sets up the snow state
void goToSnow() {
    hideSprites();
    REG_DISPCTL = MODE(0) | BG_ENABLE(1) |  BG_ENABLE(0) | SPRITE_ENABLE;

    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(24) | BG_SIZE_LARGE;
    DMANow(3, epicTiles, &CHARBLOCK[0], sizeof(epicTiles)/2); // loading epic into charblock 0
    DMANow(3, epicPal, PALETTE, sizeof(epicPal)/2); // loading epic palette
    DMANow(3, epicMap, &SCREENBLOCK[24], epicMapLen/2);


    REG_BG0CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(28) | BG_SIZE_LARGE;
    DMANow(3, tsTiles, &CHARBLOCK[1], sizeof(tsTiles)/2); // loading tileset into charblock 1
    DMANow(3, tsPal+16, PALETTE+16, 16); // loading ts palette
    DMANow(3, fallMap, &SCREENBLOCK[28], fallMapLen/2);

    jumpy.x = 32;
    jumpy.y = 448;

    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    REG_BG1HOFF = 0;
    REG_BG1VOFF = 0;

    if (snowCheat) cheetad = 9;
    state = SNOW;
}// Runs every frame of the snow state
void snow() {
    jumpDate();
    waitForVBlank();
    draw();
    if (jumpy.x < 4 && jumpy.y > 450) {
        shadowOAM[0].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(player.y - vOff);
        player.x = 30;
        player.y = 30;
        playSoundA(town.data, town.length, 1);
        goToGame();
    }
}

// Sets up the leaf state
void goToLeaf() {
    hideSprites();
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(24) | BG_SIZE_LARGE;
    DMANow(3, tsTiles, &CHARBLOCK[0], sizeof(tsTiles)/2); // loading tileset into charblock 0
    DMANow(3, tsPal, PALETTE, sizeof(tsPal)/2); // loading palette
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    player.y = 30;
    player.x = 30;
    DMANow(3, leafMap, &SCREENBLOCK[24], leafMapLen/2);
    if (leafCheat) cheetad = 9;
    state = LEAF;
}// Runs every frame of the leaf state
void leaf() {
    update();
    waitForVBlank();
    draw();
    if (player.x < 20 && player.y < 20) {
        player.x = 480;
        player.y = 480;
        playSoundA(town.data, town.length, 1);
        goToGame();
    }
}

// Sets up the fish state
void goToFish() {
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(24) | BG_SIZE_LARGE;
    DMANow(3, tsFishTiles, &CHARBLOCK[0], sizeof(tsFishTiles)/2); // loading tileset into charblock 0
    DMANow(3, tsFishPal, PALETTE, sizeof(tsFishPal)/2); // loading palette
    player.y = 460;
    player.x = 10;
    DMANow(3, fishMap, &SCREENBLOCK[24], fishMapLen/2);
    if (fishCheat) cheetad = 9;
    state = FISH;
}// Runs every frame of the fish state
void fish() {
    update();
    waitForVBlank();
    draw();
    if (player.x < 20 && player.y > 480) {
        player.x = 490;
        player.y = 10;
        goToGame();
    }
}

// Sets up the cave state
void goToCave() {
    hideSprites();
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(24) | BG_SIZE_LARGE;
    DMANow(3, tsCaveTiles, &CHARBLOCK[0], sizeof(tsCaveTiles)/2); // loading tileset into charblock 0
    DMANow(3, tsCavePal, PALETTE, sizeof(tsCavePal)/2); // loading palette
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    player.y = 50;
    player.x = 256;
    player.direction = DOWN;
    DMANow(3, caveMap, &SCREENBLOCK[24], caveMapLen/2);
    if (caveCheatInt) cheetad = 9;
    state = CAVE;
}// Runs every frame of the cave state
void cave() {
    update();
    waitForVBlank();
    draw();
    if (collision(player.x,player.y,16,16,216,0,75,16)) {
        player.x = 50;
        player.y = 510;
        playSoundA(town.data, town.length, 1);
        goToGame();
    }
}

//End of State methods, Start of major control loop methods

//Larry's movement, collisions, and pretty much 90% of the gameloop
void update() {
    player.isMoving = 0;
    diag = 0;
    detroit = 0;
    //Pre calculated positions on the sprite
    int left = player.x;
    int right = player.x + player.width-1;
    int top = player.y;
    int bottom = player.y + player.height-1;
    //Movement
    if (sailing && !diag) {
        player.xDel = 3;
        player.yDel = 3;
    } else {
        player.xDel = 2;
        player.yDel = 2;
    }
    if (BUTTON_HELD(BUTTON_UP)) {
        player.isMoving = 1;
        player.direction = UP;
        if ((top-player.yDel > 0) && colorAt(left,top - player.yDel) && colorAt(right,top - player.yDel)) player.y-=player.yDel;
        if(BUTTON_HELD(BUTTON_LEFT)){//For diagonal sailing
            diag = 1;
            player.diag = LTOP;
        }
        if(BUTTON_HELD(BUTTON_RIGHT)){//For Diagonal Sailing
            diag = 1;
            player.diag = RTOP;
        }
    } //Walk Up
    if (BUTTON_HELD(BUTTON_DOWN)) {
        player.isMoving = 1;
        player.direction = DOWN;
        if ((bottom+player.yDel < MAPHEIGHT) && colorAt(left,bottom + player.yDel) && colorAt(right,bottom + player.yDel)) player.y+=player.yDel;
        if(BUTTON_HELD(BUTTON_LEFT)){//For Diagonal Sailing
            diag = 1;
            player.diag = LBOT;
        }
        if(BUTTON_HELD(BUTTON_RIGHT)){//For Diagonal Sailing
            diag = 1;
            player.diag = RBOT;
        }
    } //Walk Down
    if (BUTTON_HELD(BUTTON_LEFT)) {
        player.isMoving = 1;
        player.direction = LEFT;
        if ((left-player.xDel > 0) && colorAt(left - player.xDel,top) && colorAt(left - player.xDel,bottom)) player.x-=player.xDel;
    } //Walk Left
    if (BUTTON_HELD(BUTTON_RIGHT)) {
        player.isMoving = 1;
        player.direction = RIGHT;
        if ((right+player.xDel < MAPWIDTH) && colorAt(right + player.xDel,top) && colorAt(right + player.xDel,bottom)) player.x+=player.xDel;
    } //Walk Right

    if (state == GAME) { //Dock button indicators
        if (collision(player.x,player.y,16,16,240,328,100,60)) {
            detroit = 1;
        } else if(collision(player.x,player.y,16,16,352,352,80,65)) {
            detroit = 1;
        } else if(gotBerry&&gotCarrot&&gotCrystal&&gotFish && collision(player.x,player.y,16,16,264,240,46,23)) {
            detroit = 1;
        } else {
            detroit = 0;
        }
    }

    if (BUTTON_PRESSED(BUTTON_A) && collision(player.x,player.y,16,16,240,328,100,60) && state == GAME) { //Dock 1
        if(!sailing) {
            playSoundA(surf.data, surf.length, 1);
            player.x += 30;
            player.y += 10;
        } else {
            playSoundA(town.data, town.length, 1);
            player.x = 272;
            player.y = 336;

            sherry.x = 280;
            sherry.y = 320;
        }
        sailing = !sailing;
    }
    if (BUTTON_PRESSED(BUTTON_A) && collision(player.x,player.y,16,16,352,352,80,65) && state == GAME) { //Dock 2
        if(!sailing) {
            playSoundA(surf.data, surf.length, 1);
            player.y -= 40;
        } else {
            playSoundA(town.data, town.length, 1);
            player.x = 416;
            player.y = 376;

            sherry.x = 376;
            sherry.y = 352;
        }
        sailing = !sailing;
    }

    if (player.isMoving) { //Animation handling
        //If the player is moving, handle animation
        player.timeUntilNextFrame--;
        if (player.timeUntilNextFrame == 0) {
            player.timeUntilNextFrame = 2;
            player.frame = (player.frame + 1) % 8;
        }
    } else {
        //If the player is not moving, reset animation
        player.frame = 0;
        player.timeUntilNextFrame = 2;
    }

    //Center screen on player as much as possible without wrapping

    hOff = player.x - (SCREENWIDTH - player.width)/2;
    vOff = player.y - (SCREENHEIGHT - player.height)/2;

    if (player.x < 0) player.x = 0;
    if (player.y < 0) player.y = 0;
    if (player.x > MAPWIDTH - player.width) player.x = MAPWIDTH - player.width;
    if (player.y > MAPHEIGHT - player.height) player.y = MAPHEIGHT - player.height;

    if (hOff < 0) hOff = 0;
    if (vOff < 0) vOff = 0;
    if (hOff > MAPWIDTH - SCREENWIDTH) hOff = MAPWIDTH - SCREENWIDTH;
    if (vOff > MAPHEIGHT - SCREENHEIGHT) vOff = MAPHEIGHT - SCREENHEIGHT;

    //Update shadowOAM for Player
    shadowOAM[20].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(player.y - vOff);
    shadowOAM[20].attr1 = ATTR1_SMALL | ATTR1_X(player.x - hOff);
    shadowOAM[20].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(player.direction * 2, player.frame * 2);

    if(sailing) { //Sailing sprites!
        shadowOAM[20].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(player.y - vOff);
        shadowOAM[20].attr1 = ATTR1_MEDIUM | ATTR1_X(player.x - hOff);
        shadowOAM[20].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID((player.direction * 4)+16,2);
        if(diag) { //Diagonal Sprites!
            shadowOAM[20].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(player.y - vOff);
            shadowOAM[20].attr1 = ATTR1_MEDIUM | ATTR1_X(player.x - hOff);
            shadowOAM[20].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID((player.diag * 4)+16,6);
        }
        if(time % 10 == 0 && !player.isMoving) { //Bobbing effect!
            if(bob) {
                player.y++;
                bob = !bob;
            } else {
                player.y--;
                bob = !bob;
            }
        }
    }

    if(state == FISH && collision(player.x,player.y,1,1,336,280,80,80) && !gotFish) { //Fishing minigame trigger
        reel = 1;
    } else {
        reel = 0;
    }

    if (reel) { //Fishing Minigame
        detroit = 1;
        if (BUTTON_PRESSED(BUTTON_A)) {
            meter -= 6;
            reelFrame++;
            if (reelFrame == 8) {
                reelFrame = 0;
            }
            if(fishCheat) {
                meter -= 6;
            }
            if (meter <= 56) {
                reel = 0;
                detroit = 0;
                gotFish = 1;
            }
        }
    } else if (state == FISH) detroit = 0;

    if(state == LEAF && collision(player.x,player.y,16,16,312,400,32,32) && !gotBerry) { //Camping minigame Trigger
        camping = 1;
    } else {
        camping = 0;
    }

    if(collision(mark,5,8,5,burn,5,17,5)) { //Marker overlapping with burn field
        markpal = 2;
        if (state == LEAF && camping) detroit = 1;
    } else if (collision(mark,5,8,5,more,5,17,5) && leafCheat) {
        markpal = 2;
        if (state == LEAF && camping) detroit = 1;
    } else {
        markpal = 0;
        if (state == LEAF) detroit = 0;
    }

    if(camping && BUTTON_PRESSED(BUTTON_A)) { //Camping game
        if(collision(mark,5,8,5,burn,5,17,5) || (collision(mark,5,8,5,more,5,17,5)) && leafCheat) {
            if(!flame1) {
                flame1 = 1;
            } else if(!flame2) {
                flame2 = 1;
            } else if(!flame3) {
                flame3 = 1;
            } else if(!flame4) {
                flame4 = 1;
            } else if(!flame5) {
                flame5 = 1;
                camping = 0;
                gotBerry = 1;
            }
        } else {
            if(flame4) {
                flame4 = 0;
            } else if(flame3) {
                flame3 = 0;
            } else if(flame2) {
                flame2 = 0;
            } else if(flame1) {
                flame1 = 0;
            }
        }
    }

    if(collision(player.x,player.y,16,16,80,424,8,8) && state == CAVE) { //Key collection
        gotKey = 1;
    }

    if(collision(player.x,player.y,16,16,384,312,32,16) && !gotCrystal && gotKey && state == CAVE) { //Indicator to open chest after key is obtained
        detroit = 1;
    }

    if(collision(player.x,player.y,16,16,384,312,32,16) && gotKey && BUTTON_PRESSED(BUTTON_A) && state == CAVE) { //Opening chest
        SCREENBLOCK[27].tilemap[OFFSET(16, 5, 32)] = TILEMAP_ENTRY_TILEID(229);
        SCREENBLOCK[27].tilemap[OFFSET(17, 5, 32)] = TILEMAP_ENTRY_TILEID(230);
        SCREENBLOCK[27].tilemap[OFFSET(18, 5, 32)] = TILEMAP_ENTRY_TILEID(231);
        SCREENBLOCK[27].tilemap[OFFSET(16, 6, 32)] = TILEMAP_ENTRY_TILEID(251);
        SCREENBLOCK[27].tilemap[OFFSET(17, 6, 32)] = TILEMAP_ENTRY_TILEID(252);
        SCREENBLOCK[27].tilemap[OFFSET(18, 6, 32)] = TILEMAP_ENTRY_TILEID(253);

        gotCrystal = 1;
        shadowOAM[19].attr0 = ATTR0_4BPP | ATTR0_TALL | ATTR0_HIDE;
    }


    //CHEATS!
    //Cave Cheat
    if(BUTTON_PRESSED(BUTTON_B)) {
        if(state == CAVE && !caveCheatInt) {
            playSoundB(secret.data, secret.length, 0);
            caveCheatInt = 1;
            cheetad = 9;
            DMANow(3, tsCaveTiles, &CHARBLOCK[0], sizeof(tsCaveTiles)/2); // loading tileset into charblock 0
            DMANow(3, tsCavePal, PALETTE, sizeof(tsCavePal)/2); // loading palette
            DMANow(3, caveCheatMap, &SCREENBLOCK[24], caveCheatMapLen/2);
        }
    }
    //Fishing Cheat
    if(BUTTON_PRESSED(BUTTON_B)) {
        if(state == FISH && !fishCheat) {
            playSoundB(secret.data, secret.length, 0);
            cheetad = 9;
            fishCheat = 1;
        }
    }
    //Leaf Cheat
    if(BUTTON_PRESSED(BUTTON_B)) {
        if(state == LEAF && !leafCheat) {
            playSoundB(secret.data, secret.length, 0);
            cheetad = 9;
            leafCheat = 1;
        }
    }
    //Snow Cheat is in jumpDate
}

//larry's movement in the snow level
void jumpDate() {
    jumpy.isMoving = 0;
    int left = jumpy.x;
    int right = jumpy.x + jumpy.width-1;
    int top = jumpy.y;
    int bottom = jumpy.y + jumpy.height-1;
    if(colorAt(left,bottom + 2) && colorAt(right,bottom + 2)) {
        jumpy.y += 2;
    }

    if(BUTTON_PRESSED(BUTTON_UP) && (!colorAt(left,bottom + 2) || !colorAt(right,bottom + 2))) {
        jumptimer = 9;
    } else if (BUTTON_PRESSED(BUTTON_UP) && snowCheat) {
        jumptimer = 9;
    }
    jumpy.y -= jumptimer;
    //fallV -= jumptimer;

    if(jumpy.y > 494){
        jumpy.x = 32;
        jumpy.y = 448;
    }

    if (BUTTON_HELD(BUTTON_LEFT)) {
        jumpy.isMoving = 1;
        jumpy.direction = LEFT;
        if ((left-jumpy.xDel > 0) && colorAt(left - jumpy.xDel,top) && colorAt(left - jumpy.xDel,bottom)) {
            jumpy.x-=jumpy.xDel;
            //fallH+=2;
        } else if ((left-jumpy.xDel > 0) && colorAt(left - 1,top) && colorAt(left - 1,bottom)) {
            jumpy.x--;
            //fallH+=2;
        }
    } //Walk Left
    if (BUTTON_HELD(BUTTON_RIGHT)) {
        jumpy.isMoving = 1;
        jumpy.direction = RIGHT;
        if ((right+jumpy.xDel < MAPWIDTH) && colorAt(right + jumpy.xDel,top) && colorAt(right + jumpy.xDel,bottom)) {
            jumpy.x+=jumpy.xDel;
            //fallH-=2;
        } else if ((right+jumpy.xDel < MAPWIDTH) && colorAt(right + 1,top) && colorAt(right + 1,bottom)) {
            jumpy.x++;
            //fallH-=2;
        }
    } //Walk Right

    //Center screen on player as much as possible without wrapping
    hOff = jumpy.x - (SCREENWIDTH - jumpy.width)/2;
    vOff = jumpy.y - (SCREENHEIGHT - jumpy.height)/2;
    if (jumpy.x < 0) jumpy.x = 0;
    if (jumpy.y < 0) jumpy.y = 0;
    if (jumpy.x > MAPWIDTH - jumpy.width) jumpy.x = MAPWIDTH - jumpy.width;
    if (jumpy.y > MAPHEIGHT - jumpy.height) jumpy.y = MAPHEIGHT - jumpy.height;
    if (hOff < 0) hOff = 0;
    if (vOff < 0) vOff = 0;
    if (hOff > MAPWIDTH - SCREENWIDTH) hOff = MAPWIDTH - SCREENWIDTH;
    if (vOff > MAPHEIGHT - SCREENHEIGHT) vOff = MAPHEIGHT - SCREENHEIGHT;

    if (jumpy.isMoving) { //Animation
        //If the player is moving, handle animation
        jumpy.timeUntilNextFrame--;
        if (jumpy.timeUntilNextFrame == 0) {
            jumpy.timeUntilNextFrame = 2;
            jumpy.frame = (jumpy.frame + 1) % 8;
        }
    } else {
        //If the player is not moving, reset animation
        jumpy.frame = 0;
        jumpy.timeUntilNextFrame = 2;
    }

    if(collision(jumpy.x,jumpy.y,16,16,64,168,8,8)) { //Getting the carrot!
        gotCarrot = 1;
    }

    if(BUTTON_PRESSED(BUTTON_B)) {
        if(state == SNOW && !snowCheat) {
            playSoundB(secret.data, secret.length, 0);
            snowCheat = 1;
            DMANow(3, tsTiles, &CHARBLOCK[1], sizeof(tsTiles)/2); // loading tileset into charblock 1
            DMANow(3, tsPal+16, PALETTE+16, 16); // loading ts palette
            DMANow(3, rainMap, &SCREENBLOCK[28], rainMapLen/2);
            oil = 4;
            cheetad = 9;
        }
    }

    //Update shadowOAM
    shadowOAM[7].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(jumpy.y - vOff);
    shadowOAM[7].attr1 = ATTR1_SMALL | ATTR1_X(jumpy.x - hOff);
    shadowOAM[7].attr2 = ATTR2_PALROW(0 + (oil/2)) | ATTR2_TILEID((jumpy.direction * 2) + oil, jumpy.frame * 2);
}

//Start of ShadowOAM Mayhem!

void drawSherry() { //Captain of the Apothecary Ferry!
        if(!sailing && (360 > vOff) && (328 < SCREENHEIGHT + vOff)) {
            shadowOAM[1].attr0 = ATTR0_4BPP | ATTR0_TALL | ATTR0_Y(sherry.y - vOff);
            shadowOAM[1].attr1 = ATTR1_MEDIUM | ATTR1_X(sherry.x - hOff);
            if(time % 10 == 0) {
                shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID((time % 3) * 2,16);
            }
        } else {
            shadowOAM[1].attr0 = ATTR0_4BPP | ATTR0_TALL | ATTR0_HIDE;
        }
}

void drawGary() { //A very bored boy
    if(state == LEAF && (464 > vOff) && (400 < SCREENHEIGHT + vOff)) {
        shadowOAM[18].attr0 = ATTR0_4BPP | ATTR0_TALL | ATTR0_Y(400 - vOff);
        shadowOAM[18].attr1 = ATTR1_MEDIUM | ATTR1_X(370 - hOff);
        if(time % 10 == 0) {
            shadowOAM[18].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID((time % 3) * 2 +6,16);
        }
    } else {
        shadowOAM[18].attr0 = ATTR0_4BPP | ATTR0_TALL | ATTR0_HIDE;
    }
}

void drawTeri() { //A lil snow fren! + Platformer Minigame sprites
    if(state == SNOW) {
        if (!gotCarrot && (176 > vOff) && (168 < SCREENHEIGHT + vOff)) {
            shadowOAM[9].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(168 - vOff);
            shadowOAM[9].attr1 = ATTR1_TINY | ATTR1_X(64 - hOff);
            shadowOAM[9].attr2 = ATTR2_PALROW(5) | ATTR2_TILEID(4,20);
        } else {
            shadowOAM[9].attr0 = ATTR0_4BPP | ATTR0_TALL | ATTR0_HIDE;
        }
        shadowOAM[8].attr0 = ATTR0_4BPP | ATTR0_TALL | ATTR0_Y(440 - vOff);
        shadowOAM[8].attr1 = ATTR1_TINY | ATTR1_X(96 - hOff);
            if((456 > vOff) && (440 < SCREENHEIGHT + vOff)) {
                shadowOAM[8].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID((terr)+8,20);
            } else {
                shadowOAM[8].attr0 = ATTR0_4BPP | ATTR0_TALL | ATTR0_HIDE;
            }
    } else {
        shadowOAM[8].attr0 = ATTR0_4BPP | ATTR0_TALL | ATTR0_HIDE;
        shadowOAM[9].attr0 = ATTR0_4BPP | ATTR0_TALL | ATTR0_HIDE;
    }
}

void drawMeter() { //Fishing Minigame sprites
    if (!gotFish && reel) {
            //Meter Box
            shadowOAM[26].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_Y(140);
            shadowOAM[26].attr1 = ATTR1_MEDIUM | ATTR1_X(32+80);
            shadowOAM[26].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(16,14);

            shadowOAM[27].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_Y(140);
            shadowOAM[27].attr1 = ATTR1_MEDIUM | ATTR1_X(64+80);
            shadowOAM[27].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(20,14);

            shadowOAM[16].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_Y(140);
            shadowOAM[16].attr1 = ATTR1_MEDIUM | ATTR1_X(96+80);
            shadowOAM[16].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(24,14);

            shadowOAM[17].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_Y(140);
            shadowOAM[17].attr1 = ATTR1_MEDIUM | ATTR1_X(128+80);
            shadowOAM[17].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(28,14);

            //Meter Progress
            shadowOAM[10].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_Y(144);
            shadowOAM[10].attr1 = ATTR1_SMALL | ATTR1_X(meter+72+80);
            shadowOAM[10].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(20,12);

            shadowOAM[11].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_Y(144);
            shadowOAM[11].attr1 = ATTR1_SMALL | ATTR1_X(meter+40+80);
            shadowOAM[11].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(20,12);

            shadowOAM[12].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_Y(144);
            shadowOAM[12].attr1 = ATTR1_SMALL | ATTR1_X(meter+8+80);
            shadowOAM[12].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(20,12);

            shadowOAM[13].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(144);
            shadowOAM[13].attr1 = ATTR1_TINY | ATTR1_X(meter+80);
            shadowOAM[13].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(19,12);

            //Reel effect
            shadowOAM[29].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(140);
            shadowOAM[29].attr1 = ATTR1_SMALL | ATTR1_X(90);
            shadowOAM[29].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(14, (reelFrame*2) + 8);

            if (fishCheat) { //Change color of meter, not via palette but by different sprites altogether lol
                shadowOAM[10].attr2 = ATTR2_PALROW(2) | ATTR2_TILEID(20,13);
                shadowOAM[11].attr2 = ATTR2_PALROW(2) | ATTR2_TILEID(20,13);
                shadowOAM[12].attr2 = ATTR2_PALROW(2) | ATTR2_TILEID(20,13);
                shadowOAM[13].attr2 = ATTR2_PALROW(2) | ATTR2_TILEID(19,13);
            }


        } else {
            shadowOAM[10].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_HIDE;
            shadowOAM[11].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_HIDE;
            shadowOAM[12].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_HIDE;
            shadowOAM[13].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_HIDE;
            shadowOAM[26].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_HIDE;
            shadowOAM[27].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_HIDE;
            shadowOAM[16].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_HIDE;
            shadowOAM[17].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_HIDE;
            shadowOAM[29].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_HIDE;
    }
}

void drawBanner() { //A fancy banner showing you how much of a cheater you are
    if(((state == LEAF) && leafCheat) || ((state == SNOW) && snowCheat) || ((state == CAVE) && caveCheatInt) || ((state == FISH) && fishCheat)) {
        shadowOAM[14].attr0 = ATTR0_4BPP | ATTR0_TALL | ATTR0_Y(cheeta);
        shadowOAM[14].attr1 = ATTR1_MEDIUM | ATTR1_X(216);
        shadowOAM[14].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(12,9);

        shadowOAM[15].attr0 = ATTR0_4BPP | ATTR0_TALL | ATTR0_Y(cheeta + 32);
        shadowOAM[15].attr1 = ATTR1_MEDIUM | ATTR1_X(216);
        shadowOAM[15].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(12,13);

    } else {
        shadowOAM[14].attr0 = ATTR0_4BPP | ATTR0_TALL | ATTR0_HIDE;
        shadowOAM[15].attr0 = ATTR0_4BPP | ATTR0_TALL | ATTR0_HIDE;
    }

    if((state == LEAF) && leafCheat) {
        shadowOAM[28].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(cheeta - 27);
        shadowOAM[28].attr1 = ATTR1_SMALL | ATTR1_X(190);
        shadowOAM[28].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(12,6);
    }
    else if((state == SNOW) && snowCheat) {
        shadowOAM[28].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(cheeta - 27);
        shadowOAM[28].attr1 = ATTR1_SMALL | ATTR1_X(190);
        shadowOAM[28].attr2 = ATTR2_PALROW(2) | ATTR2_TILEID(14,4);
    }
    else if((state == CAVE) && caveCheatInt) {
        shadowOAM[28].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(cheeta - 27);
        shadowOAM[28].attr1 = ATTR1_SMALL | ATTR1_X(190);
        shadowOAM[28].attr2 = ATTR2_PALROW(2) | ATTR2_TILEID(14,6);
    }
    else if((state == FISH) && fishCheat) {
        shadowOAM[28].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(cheeta - 27);
        shadowOAM[28].attr1 = ATTR1_SMALL | ATTR1_X(190);
        shadowOAM[28].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(12,4);
    } else {
        shadowOAM[28].attr0 = ATTR0_4BPP | ATTR0_TALL | ATTR0_HIDE;
    }
}

void drawCamp() { //Campfire Minigame sprites
    if(!gotBerry && camping && collision(player.x,player.y,16,16,312,400,32,32)) {
        //Meter Box
        shadowOAM[34].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_Y(140);
        shadowOAM[34].attr1 = ATTR1_MEDIUM | ATTR1_X(16+40);
        shadowOAM[34].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(16,10);

        shadowOAM[35].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_Y(140);
        shadowOAM[35].attr1 = ATTR1_MEDIUM | ATTR1_X(48+40);
        shadowOAM[35].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(20,10);

        shadowOAM[36].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_Y(140);
        shadowOAM[36].attr1 = ATTR1_MEDIUM | ATTR1_X(80+40);
        shadowOAM[36].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(24,10);

        shadowOAM[37].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_Y(140);
        shadowOAM[37].attr1 = ATTR1_MEDIUM | ATTR1_X(112+40);
        shadowOAM[37].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(28,10);

        //Success box + flames
        shadowOAM[38].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(132);
        shadowOAM[38].attr1 = ATTR1_TINY | ATTR1_X(16+80+4);
        shadowOAM[38].attr2 = ATTR2_PALROW(2) | ATTR2_TILEID(27,12 + flame1);

        shadowOAM[61].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(132);
        shadowOAM[61].attr1 = ATTR1_TINY | ATTR1_X(16+80+12);
        shadowOAM[61].attr2 = ATTR2_PALROW(2) | ATTR2_TILEID(28,12 + flame2);

        shadowOAM[60].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(132);
        shadowOAM[60].attr1 = ATTR1_TINY | ATTR1_X(16+80+20);
        shadowOAM[60].attr2 = ATTR2_PALROW(2) | ATTR2_TILEID(29,12 + flame3);

        shadowOAM[39].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(132);
        shadowOAM[39].attr1 = ATTR1_TINY | ATTR1_X(16+80+28);
        shadowOAM[39].attr2 = ATTR2_PALROW(2) | ATTR2_TILEID(30,12 + flame4);

        shadowOAM[40].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(132);
        shadowOAM[40].attr1 = ATTR1_TINY | ATTR1_X(16+80+36);
        shadowOAM[40].attr2 = ATTR2_PALROW(2) | ATTR2_TILEID(31,12 + flame5);
        //Burn and Mark
        shadowOAM[33].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_Y(144);
        shadowOAM[33].attr1 = ATTR1_SMALL | ATTR1_X(burn + 35);
        shadowOAM[33].attr2 = ATTR2_PALROW(2) | ATTR2_TILEID(12,0);

        shadowOAM[25].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(140);
        shadowOAM[25].attr1 = ATTR1_TINY | ATTR1_X(mark + 35);
        shadowOAM[25].attr2 = ATTR2_PALROW(markpal) | ATTR2_TILEID(4,23);

        if (leafCheat && camping) { //More burning!!
            shadowOAM[32].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_Y(144);
            shadowOAM[32].attr1 = ATTR1_SMALL | ATTR1_X(more + 35);
            shadowOAM[32].attr2 = ATTR2_PALROW(2) | ATTR2_TILEID(12,1);
        } else {
            shadowOAM[32].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_HIDE;
        }
    } else {
        shadowOAM[32].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_HIDE;
        shadowOAM[33].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_HIDE;
        shadowOAM[34].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_HIDE;
        shadowOAM[35].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_HIDE;
        shadowOAM[36].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_HIDE;
        shadowOAM[37].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_HIDE;
        shadowOAM[38].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_HIDE;
        shadowOAM[39].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_HIDE;
        shadowOAM[40].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_HIDE;
        shadowOAM[25].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_HIDE;
        shadowOAM[61].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_HIDE;
        shadowOAM[60].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_HIDE;
    }

     //Final fire!!!
     if (gotBerry && (464 > vOff) && (400 < SCREENHEIGHT + vOff)) {
        shadowOAM[31].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(408-vOff);
        shadowOAM[31].attr1 = ATTR1_TINY | ATTR1_X(324-hOff);
        shadowOAM[31].attr2 = ATTR2_PALROW(2) | ATTR2_TILEID(12,20+litty);
     } else {
        shadowOAM[31].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_HIDE;
     }
}

void drawKeys() { //Cave Minigame sprites
    if (state == CAVE) {
        if (!gotKey  && (408 > vOff) && (400 < SCREENHEIGHT + vOff)) {
            shadowOAM[21].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(424 - vOff);
            shadowOAM[21].attr1 = ATTR1_TINY | ATTR1_X(80 - hOff);
            shadowOAM[21].attr2 = ATTR2_PALROW(2) | ATTR2_TILEID(4,22);
        } else {
            shadowOAM[21].attr0 = ATTR0_4BPP | ATTR0_TALL | ATTR0_HIDE;
        }
        if (gotKey) {
            shadowOAM[19].attr0 = ATTR0_4BPP | ATTR0_TALL | ATTR0_Y(4);
            shadowOAM[19].attr1 = ATTR1_TINY | ATTR1_X(180);
            shadowOAM[19].attr2 = ATTR2_PALROW(2) | ATTR2_TILEID(5,22);
        } else {
            shadowOAM[19].attr0 = ATTR0_4BPP | ATTR0_TALL | ATTR0_HIDE;
        }
    }
}

void drawInventory() { //Shows current ingredients
    //Testing lol
    // gotBerry = 1;
    // gotCarrot = 1;
    // gotCrystal = 1;
    // gotFish = 1;
    shadowOAM[6].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(0);
    shadowOAM[6].attr1 = ATTR1_MEDIUM | ATTR1_X(208);
    shadowOAM[6].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0,20);
    if (gotFish) {
        shadowOAM[2].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(5);
        shadowOAM[2].attr1 = ATTR1_TINY | ATTR1_X(227);
        shadowOAM[2].attr2 = ATTR2_PALROW(5) | ATTR2_TILEID(5,20);
    }
    if (gotBerry) {
        shadowOAM[3].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(19);
        shadowOAM[3].attr1 = ATTR1_TINY | ATTR1_X(227);
        shadowOAM[3].attr2 = ATTR2_PALROW(5) | ATTR2_TILEID(5,21);
    }
    if (gotCarrot) {
        shadowOAM[4].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(5);
        shadowOAM[4].attr1 = ATTR1_TINY | ATTR1_X(213);
        shadowOAM[4].attr2 = ATTR2_PALROW(5) | ATTR2_TILEID(4,20);
    }
    if (gotCrystal) {
        shadowOAM[5].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(19);
        shadowOAM[5].attr1 = ATTR1_TINY | ATTR1_X(213);
        shadowOAM[5].attr2 = ATTR2_PALROW(5) | ATTR2_TILEID(4,21);
    }
}

void drawIndicator() { //Tells the player to SMASH DA A BUTTON
    if (detroit) {
        shadowOAM[41].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(136);
        shadowOAM[41].attr1 = ATTR1_SMALL | ATTR1_X(8);
        shadowOAM[41].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(6+(bute*2),22);
    } else {
        shadowOAM[41].attr0 = ATTR0_4BPP | ATTR0_TALL | ATTR0_HIDE;
    }
}

//Moving shadowOAM into OAM
void draw() {
    drawInventory();
    drawIndicator();
    drawBanner();
    if(state != SNOW) {
        REG_BG0HOFF = hOff;
        REG_BG0VOFF = vOff;
    } else {
        REG_BG1HOFF = hOff;
        REG_BG1VOFF = vOff;
        REG_BG0HOFF = hOff - fallH;
        REG_BG0VOFF = vOff + fallV;
    }
    if (state == GAME) drawSherry();
    if (state == SNOW) drawTeri();
    if (state == FISH) drawMeter();
    if (state == LEAF) drawGary();
    if (state == LEAF) drawCamp();
    if (state == CAVE) drawKeys();
    DMANow(3, shadowOAM, OAM, 128*4);
}