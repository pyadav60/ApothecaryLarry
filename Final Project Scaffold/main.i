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
typedef void (*ihp_t)(void);






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
# 133 "gba.h"
typedef void (*ihp)(void);
# 163 "gba.h"
typedef struct {

    char* title;
    unsigned short color;

    unsigned int sampleRate;
    unsigned int length;
    signed char* data;

} SONG;

SONG songs[10];
# 4 "main.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct { u16 tileData[16]; } TILE;
typedef TILE charblock[512];



typedef struct {
 u16 tilemap[1024];
} screenblock;
# 5 "main.c" 2
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
# 6 "main.c" 2
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
    int xDel;
    int yDel;
    int width;
    int height;
    int direction;
    int diag;
    int isMoving;
    int timeUntilNextFrame;
    int frame;
    int numOfFrames;
    int active;
    int hide;
} SPRITE;
# 7 "main.c" 2

# 1 "sound.h" 1



void setupSounds();
void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void pauseSounds();
void unpauseSounds();
void stopSounds();
# 49 "sound.h"
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
# 9 "main.c" 2
# 1 "town.h" 1


extern const unsigned int town_sampleRate;
extern const unsigned int town_length;
extern const signed char town_data[];
# 10 "main.c" 2
# 1 "reflect.h" 1


extern const unsigned int reflect_sampleRate;
extern const unsigned int reflect_length;
extern const signed char reflect_data[];
# 11 "main.c" 2
# 1 "flip.h" 1


extern const unsigned int flip_sampleRate;
extern const unsigned int flip_length;
extern const signed char flip_data[];
# 12 "main.c" 2
# 1 "shroom.h" 1


extern const unsigned int shroom_sampleRate;
extern const unsigned int shroom_length;
extern const signed char shroom_data[];
# 13 "main.c" 2
# 1 "surf.h" 1


extern const unsigned int surf_sampleRate;
extern const unsigned int surf_length;
extern const signed char surf_data[];
# 14 "main.c" 2
# 1 "townWin.h" 1


extern const unsigned int townWin_sampleRate;
extern const unsigned int townWin_length;
extern const signed char townWin_data[];
# 15 "main.c" 2
# 1 "flower.h" 1


extern const unsigned int flower_sampleRate;
extern const unsigned int flower_length;
extern const signed char flower_data[];
# 16 "main.c" 2
# 1 "secret.h" 1


extern const unsigned int secret_sampleRate;
extern const unsigned int secret_length;
extern const signed char secret_data[];
# 17 "main.c" 2

# 1 "ss.h" 1
# 21 "ss.h"
extern const unsigned short ssTiles[16384];


extern const unsigned short ssPal[256];
# 19 "main.c" 2
# 1 "ts.h" 1
# 21 "ts.h"
extern const unsigned short tsTiles[7040];


extern const unsigned short tsPal[256];
# 20 "main.c" 2
# 1 "tsCave.h" 1
# 21 "tsCave.h"
extern const unsigned short tsCaveTiles[7040];


extern const unsigned short tsCavePal[256];
# 21 "main.c" 2
# 1 "tsFish.h" 1
# 21 "tsFish.h"
extern const unsigned short tsFishTiles[7040];


extern const unsigned short tsFishPal[256];
# 22 "main.c" 2

# 1 "snow.h" 1







extern const unsigned short snowMap[4096];
# 24 "main.c" 2
# 1 "cave.h" 1







extern const unsigned short caveMap[4096];
# 25 "main.c" 2
# 1 "caveCheat.h" 1







extern const unsigned short caveCheatMap[4096];
# 26 "main.c" 2
# 1 "leaf.h" 1







extern const unsigned short leafMap[4096];
# 27 "main.c" 2
# 1 "fish.h" 1







extern const unsigned short fishMap[4096];
# 28 "main.c" 2
# 1 "world.h" 1
# 22 "world.h"
extern const unsigned short worldTiles[3488];


extern const unsigned short worldMap[4096];


extern const unsigned short worldPal[256];
# 29 "main.c" 2
# 1 "epic.h" 1
# 22 "epic.h"
extern const unsigned short epicTiles[6512];


extern const unsigned short epicMap[4096];


extern const unsigned short epicPal[256];
# 30 "main.c" 2
# 1 "fall.h" 1







extern const unsigned short fallMap[4096];
# 31 "main.c" 2
# 1 "rain.h" 1







extern const unsigned short rainMap[4096];
# 32 "main.c" 2

# 1 "worldCol.h" 1
# 21 "worldCol.h"
extern const unsigned short worldColBitmap[131072];


extern const unsigned short worldColPal[256];
# 34 "main.c" 2
# 1 "fishCol.h" 1
# 21 "fishCol.h"
extern const unsigned short fishColBitmap[131072];


extern const unsigned short fishColPal[256];
# 35 "main.c" 2
# 1 "snowCol.h" 1
# 21 "snowCol.h"
extern const unsigned short snowColBitmap[131072];


extern const unsigned short snowColPal[256];
# 36 "main.c" 2
# 1 "leafCol.h" 1
# 21 "leafCol.h"
extern const unsigned short leafColBitmap[131072];


extern const unsigned short leafColPal[256];
# 37 "main.c" 2
# 1 "caveCol.h" 1
# 21 "caveCol.h"
extern const unsigned short caveColBitmap[131072];


extern const unsigned short caveColPal[256];
# 38 "main.c" 2


# 1 "start.h" 1
# 22 "start.h"
extern const unsigned short startTiles[3264];


extern const unsigned short startMap[1024];


extern const unsigned short startPal[256];
# 41 "main.c" 2
# 1 "pause.h" 1
# 22 "pause.h"
extern const unsigned short pauseTiles[2432];


extern const unsigned short pauseMap[1024];


extern const unsigned short pausePal[256];
# 42 "main.c" 2
# 1 "win.h" 1
# 22 "win.h"
extern const unsigned short winTiles[4064];


extern const unsigned short winMap[1024];


extern const unsigned short winPal[256];
# 43 "main.c" 2
# 1 "how.h" 1
# 22 "how.h"
extern const unsigned short howTiles[5296];


extern const unsigned short howMap[1024];


extern const unsigned short howPal[256];
# 44 "main.c" 2




int rSeed;


enum {START, GAME, PAUSE, WIN, INSTRUCTIONS, SNOW, CAVE, FISH, LEAF};
int state;
int sailing;


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
        return !collisionbitmap[((y) * (512) + (x))];
    }
    return collisionbitmap[((y) * (512) + (x))];
}

void initialize();
inline unsigned char colorAt();
OBJ_ATTR shadowOAM[128];


void testTilemap();
void initialize();
void update();
void draw();

void setupInterrupts();
void interruptHandler();
void setupSoundsReal();

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

void goToSnow();
void snow();
void goToCave();
void cave();
void goToLeaf();
void leaf();
void goToFish();
void fish();


typedef enum {DOWN, UP, LEFT, RIGHT} DIRECTION;
typedef enum {RBOT, LBOT, LTOP, RTOP} DIAG;


SPRITE player;
SPRITE sherry;
SPRITE jumpy;

SONG town;
SONG reflect;
SONG flip;
SONG shroom;
SONG surf;
SONG secret;
SONG flower;
SONG townWin;



unsigned short oldButtons;
unsigned short buttons;


int hOff;
int vOff;
int fallH;
int fallV;
int diag;
int detroit;

int gotFish;
int gotCarrot;
int gotBerry;
int gotCrystal;
int gotKey;

int time;
int bob;
int jumptimer;
int bute;
int litty;
int terr;

int reel;
int meter;
int reelFrame;

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
        buttons = (*(volatile unsigned short *)0x04000130);

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
        DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128*4);



        time++;
        fallV-=3;
        fallH--;
        if (time == 10000000) {
            time = 0;
        }
        if (time % 2 == 0) {
            litty++;
            if(litty == 4) {
                litty = 0;
            }
        }

        if (time % 5 == 0) {
            terr++;
            if(terr == 4) {
                terr = 0;
            }
        }

        if (time % 6 == 0) {
            bute++;
            if(bute == 3) {
                bute = 0;
            }
        }
        if (jumptimer > 0) jumptimer--;

        if (cheetad > 0) cheetad--;
        if(cheetad != 5) {
            cheeta += cheetad;
        }


        if (meter < 160) meter++;
        if (meter > 160) meter--;


        if (time % 10 == 0) {
            reelFrame--;
            if (reelFrame == -1) {
                reelFrame = 7;
            }
        }


        if (markd && mark+1 < 137) {
            mark++;
        } else if (!markd && mark-1 > 20) {
            mark--;
        } else {
            markd = !markd;
        }

        if (burnd && burn+4 < 124) {
            burn+= 2;
        } else if (!burnd && burn-4 > 20) {
            burn-= 2;
        } else {
            burnd = !burnd;
        }

        if (mored && more+4 < 124) {
            more+= 2;
        } else if (!mored && more-4 > 20) {
            more-= 2;
        } else {
            mored = !mored;
        }

        if (gotBerry&&gotCarrot&&gotCrystal&&gotFish && state == GAME && collision(player.x,player.y,16,16,264,240,46,23)) {
            detroit = 1;
            if((!(~(oldButtons) & ((1<<0))) && (~(buttons) & ((1<<0))))) {
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
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << 12);


    DMANow(3, ssTiles, &((charblock *)0x06000000)[4], 32768/2);
    DMANow(3, ssPal, ((u16 *)0x5000200), 256);


    hOff = 0;
    vOff = 0;


    player.width = 15;
    player.height = 15;
    player.x = 264;
    player.y = 264;
    player.numOfFrames = 8;
    player.direction = DOWN;
    player.timeUntilNextFrame = 10;
    player.xDel = 2;
    player.yDel = 2;


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

void setupSoundsReal() {
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
            if (soundA.vBlankCount > soundA.durationInVBlanks) {
                if (soundA.looping) {
                    playSoundA(soundA.data, soundA.dataLength, soundA.looping);
                } else {
                    soundA.isPlaying = 0;
                    *(volatile unsigned short*)0x4000102 = 0;
                    dma[1].cnt = 0;
                }
            }
        }


        if (soundB.isPlaying) {
            soundB.vBlankCount++;
            if (soundB.vBlankCount > soundB.durationInVBlanks) {
                if (soundB.looping) {
                    playSoundB(soundB.data, soundB.dataLength, soundB.looping);
                } else {
                    soundB.isPlaying = 0;
                    *(volatile unsigned short*)0x4000106 = 0;
                    dma[2].cnt = 0;
                }
            }
        }

    }

    if (*(volatile unsigned short*)0x4000202 & (1 << ((2 % 4) + 3))) {

    }

    if (*(volatile unsigned short*)0x4000202 & (1 << ((3 % 4) + 3))) {

    }

    *(volatile unsigned short*)0x4000202 = *(volatile unsigned short*)0x4000202;
    *(unsigned short*)0x4000208 = 1;

}


void goToStart() {
    initialize();
    hideSprites();
    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4)));
    (*(volatile unsigned short*)0x4000008) = ((0) << 2) | ((28) << 8) | (3 << 14);

    DMANow(3, startTiles, &((charblock *)0x06000000)[0], sizeof(startTiles)/2);
    DMANow(3, startPal, ((unsigned short *)0x5000000), sizeof(startPal)/2);
    DMANow(3, startMap, &((screenblock *)0x6000000)[28], 2048/2);

    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000012) = 0;

    state = START;
}
void start() {
    rSeed++;
    waitForVBlank();
    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        srand(rSeed);
        playSoundB(flip.data, flip.length, 0);
        goToGame();
    }
    if ((!(~(oldButtons) & ((1<<2))) && (~(buttons) & ((1<<2))))) {
        srand(rSeed);
        playSoundB(flip.data, flip.length, 0);
        goToInstructions();
    }
}


void goToGame() {
    hideSprites();
    cheeta = 0;
    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << 12);
    (*(volatile unsigned short*)0x4000008) = ((0) << 2) | ((24) << 8) | (3 << 14);

    DMANow(3, worldTiles, &((charblock *)0x06000000)[0], sizeof(worldTiles)/2);
    DMANow(3, worldPal, ((unsigned short *)0x5000000), sizeof(worldPal)/2);
    DMANow(3, worldMap, &((screenblock *)0x6000000)[24], 8192/2);
    state = GAME;
}
void game() {
    update();
    waitForVBlank();
    draw();

    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        playSoundB(flip.data, flip.length, 0);
        goToPause();
    }
    if ((!(~(oldButtons) & ((1<<2))) && (~(buttons) & ((1<<2))))) {
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


void goToPause() {
    hideSprites();
    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4)));
    (*(volatile unsigned short*)0x4000008) = ((0) << 2) | ((28) << 8) | (3 << 14);

    DMANow(3, pauseTiles, &((charblock *)0x06000000)[0], sizeof(pauseTiles)/2);
    DMANow(3, pausePal, ((unsigned short *)0x5000000), sizeof(pausePal)/2);
    DMANow(3, pauseMap, &((screenblock *)0x6000000)[28], 2048/2);

    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000012) = 0;
    state = PAUSE;
}
void pause() {
    waitForVBlank();
    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        playSoundB(flip.data, flip.length, 0);
        goToGame();
    } else if ((!(~(oldButtons) & ((1<<2))) && (~(buttons) & ((1<<2))))) {
        playSoundB(flip.data, flip.length, 0);
        goToStart();
    }
}


void goToWin() {
    hideSprites();
    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4)));
    (*(volatile unsigned short*)0x4000008) = ((0) << 2) | ((28) << 8) | (3 << 14);
    DMANow(3, winTiles, &((charblock *)0x06000000)[0], sizeof(winTiles)/2);
    DMANow(3, winPal, ((unsigned short *)0x5000000), sizeof(winPal)/2);
    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000012) = 0;
    DMANow(3, winMap, &((screenblock *)0x6000000)[28], 2048/2);
    state = WIN;
}
void win() {
    waitForVBlank();
    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        playSoundB(flip.data, flip.length, 0);
        playSoundA(town.data, town.length, 1);
        goToStart();
    }
}


void goToInstructions() {
    hideSprites();
    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4)));
    (*(volatile unsigned short*)0x4000008) = ((0) << 2) | ((28) << 8) | (3 << 14);

    DMANow(3, howTiles, &((charblock *)0x06000000)[0], sizeof(howTiles)/2);
    DMANow(3, howPal, ((unsigned short *)0x5000000), sizeof(howPal)/2);
    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000012) = 0;
    DMANow(3, howMap, &((screenblock *)0x6000000)[28], 2048/2);
    state = INSTRUCTIONS;
}
void instructions() {
    waitForVBlank();
    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        playSoundB(flip.data, flip.length, 0);
        goToStart();
    }
}


void goToSnow() {
    hideSprites();
    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (1 % 4))) | (1 << (8 + (0 % 4))) | (1 << 12);

    (*(volatile unsigned short*)0x400000A) = ((0) << 2) | ((24) << 8) | (3 << 14);
    DMANow(3, epicTiles, &((charblock *)0x06000000)[0], sizeof(epicTiles)/2);
    DMANow(3, epicPal, ((unsigned short *)0x5000000), sizeof(epicPal)/2);
    DMANow(3, epicMap, &((screenblock *)0x6000000)[24], 8192/2);


    (*(volatile unsigned short*)0x4000008) = ((1) << 2) | ((28) << 8) | (3 << 14);
    DMANow(3, tsTiles, &((charblock *)0x06000000)[1], sizeof(tsTiles)/2);
    DMANow(3, tsPal+16, ((unsigned short *)0x5000000)+16, 16);
    DMANow(3, fallMap, &((screenblock *)0x6000000)[28], (8192)/2);

    jumpy.x = 32;
    jumpy.y = 448;

    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000012) = 0;

    (*(volatile unsigned short *)0x04000014) = 0;
    (*(volatile unsigned short *)0x04000016) = 0;

    if (snowCheat) cheetad = 9;
    state = SNOW;
}
void snow() {
    jumpDate();
    waitForVBlank();
    draw();
    if (jumpy.x < 4 && jumpy.y > 450) {
        shadowOAM[0].attr0 = (0<<13) | (0<<14) | ((player.y - vOff) & 0xFF);
        player.x = 30;
        player.y = 30;
        playSoundA(town.data, town.length, 1);
        goToGame();
    }
}


void goToLeaf() {
    hideSprites();
    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << 12);
    (*(volatile unsigned short*)0x4000008) = ((0) << 2) | ((24) << 8) | (3 << 14);
    DMANow(3, tsTiles, &((charblock *)0x06000000)[0], sizeof(tsTiles)/2);
    DMANow(3, tsPal, ((unsigned short *)0x5000000), sizeof(tsPal)/2);
    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000012) = 0;
    player.y = 30;
    player.x = 30;
    DMANow(3, leafMap, &((screenblock *)0x6000000)[24], (8192)/2);
    if (leafCheat) cheetad = 9;
    state = LEAF;
}
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


void goToFish() {
    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << 12);
    (*(volatile unsigned short*)0x4000008) = ((0) << 2) | ((24) << 8) | (3 << 14);
    DMANow(3, tsFishTiles, &((charblock *)0x06000000)[0], sizeof(tsFishTiles)/2);
    DMANow(3, tsFishPal, ((unsigned short *)0x5000000), sizeof(tsFishPal)/2);
    player.y = 460;
    player.x = 10;
    DMANow(3, fishMap, &((screenblock *)0x6000000)[24], (8192)/2);
    if (fishCheat) cheetad = 9;
    state = FISH;
}
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


void goToCave() {
    hideSprites();
    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << 12);
    (*(volatile unsigned short*)0x4000008) = ((0) << 2) | ((24) << 8) | (3 << 14);
    DMANow(3, tsCaveTiles, &((charblock *)0x06000000)[0], sizeof(tsCaveTiles)/2);
    DMANow(3, tsCavePal, ((unsigned short *)0x5000000), sizeof(tsCavePal)/2);
    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000012) = 0;
    player.y = 50;
    player.x = 256;
    player.direction = DOWN;
    DMANow(3, caveMap, &((screenblock *)0x6000000)[24], (8192)/2);
    if (caveCheatInt) cheetad = 9;
    state = CAVE;
}
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




void update() {
    player.isMoving = 0;
    diag = 0;
    detroit = 0;

    int left = player.x;
    int right = player.x + player.width-1;
    int top = player.y;
    int bottom = player.y + player.height-1;

    if (sailing && !diag) {
        player.xDel = 3;
        player.yDel = 3;
    } else {
        player.xDel = 2;
        player.yDel = 2;
    }
    if ((~(buttons) & ((1<<6)))) {
        player.isMoving = 1;
        player.direction = UP;
        if ((top-player.yDel > 0) && colorAt(left,top - player.yDel) && colorAt(right,top - player.yDel)) player.y-=player.yDel;
        if((~(buttons) & ((1<<5)))){
            diag = 1;
            player.diag = LTOP;
        }
        if((~(buttons) & ((1<<4)))){
            diag = 1;
            player.diag = RTOP;
        }
    }
    if ((~(buttons) & ((1<<7)))) {
        player.isMoving = 1;
        player.direction = DOWN;
        if ((bottom+player.yDel < 512) && colorAt(left,bottom + player.yDel) && colorAt(right,bottom + player.yDel)) player.y+=player.yDel;
        if((~(buttons) & ((1<<5)))){
            diag = 1;
            player.diag = LBOT;
        }
        if((~(buttons) & ((1<<4)))){
            diag = 1;
            player.diag = RBOT;
        }
    }
    if ((~(buttons) & ((1<<5)))) {
        player.isMoving = 1;
        player.direction = LEFT;
        if ((left-player.xDel > 0) && colorAt(left - player.xDel,top) && colorAt(left - player.xDel,bottom)) player.x-=player.xDel;
    }
    if ((~(buttons) & ((1<<4)))) {
        player.isMoving = 1;
        player.direction = RIGHT;
        if ((right+player.xDel < 512) && colorAt(right + player.xDel,top) && colorAt(right + player.xDel,bottom)) player.x+=player.xDel;
    }

    if (state == GAME) {
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

    if ((!(~(oldButtons) & ((1<<0))) && (~(buttons) & ((1<<0)))) && collision(player.x,player.y,16,16,240,328,100,60) && state == GAME) {
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
    if ((!(~(oldButtons) & ((1<<0))) && (~(buttons) & ((1<<0)))) && collision(player.x,player.y,16,16,352,352,80,65) && state == GAME) {
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

    if (player.isMoving) {

        player.timeUntilNextFrame--;
        if (player.timeUntilNextFrame == 0) {
            player.timeUntilNextFrame = 2;
            player.frame = (player.frame + 1) % 8;
        }
    } else {

        player.frame = 0;
        player.timeUntilNextFrame = 2;
    }



    hOff = player.x - (240 - player.width)/2;
    vOff = player.y - (160 - player.height)/2;

    if (player.x < 0) player.x = 0;
    if (player.y < 0) player.y = 0;
    if (player.x > 512 - player.width) player.x = 512 - player.width;
    if (player.y > 512 - player.height) player.y = 512 - player.height;

    if (hOff < 0) hOff = 0;
    if (vOff < 0) vOff = 0;
    if (hOff > 512 - 240) hOff = 512 - 240;
    if (vOff > 512 - 160) vOff = 512 - 160;


    shadowOAM[20].attr0 = (0<<13) | (0<<14) | ((player.y - vOff) & 0xFF);
    shadowOAM[20].attr1 = (1<<14) | ((player.x - hOff) & 0x1FF);
    shadowOAM[20].attr2 = (((0) & 0xF) << 12) | (((player.frame * 2) * 32 + (player.direction * 2)) & 0x3FF);

    if(sailing) {
        shadowOAM[20].attr0 = (0<<13) | (0<<14) | ((player.y - vOff) & 0xFF);
        shadowOAM[20].attr1 = (2<<14) | ((player.x - hOff) & 0x1FF);
        shadowOAM[20].attr2 = (((0) & 0xF) << 12) | (((2) * 32 + ((player.direction * 4)+16)) & 0x3FF);
        if(diag) {
            shadowOAM[20].attr0 = (0<<13) | (0<<14) | ((player.y - vOff) & 0xFF);
            shadowOAM[20].attr1 = (2<<14) | ((player.x - hOff) & 0x1FF);
            shadowOAM[20].attr2 = (((0) & 0xF) << 12) | (((6) * 32 + ((player.diag * 4)+16)) & 0x3FF);
        }
        if(time % 10 == 0 && !player.isMoving) {
            if(bob) {
                player.y++;
                bob = !bob;
            } else {
                player.y--;
                bob = !bob;
            }
        }
    }

    if(state == FISH && collision(player.x,player.y,1,1,336,280,80,80) && !gotFish) {
        reel = 1;
    } else {
        reel = 0;
    }

    if (reel) {
        detroit = 1;
        if ((!(~(oldButtons) & ((1<<0))) && (~(buttons) & ((1<<0))))) {
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

    if(state == LEAF && collision(player.x,player.y,16,16,312,400,32,32) && !gotBerry) {
        camping = 1;
    } else {
        camping = 0;
    }

    if(collision(mark,5,8,5,burn,5,17,5)) {
        markpal = 2;
        if (state == LEAF && camping) detroit = 1;
    } else if (collision(mark,5,8,5,more,5,17,5) && leafCheat) {
        markpal = 2;
        if (state == LEAF && camping) detroit = 1;
    } else {
        markpal = 0;
        if (state == LEAF) detroit = 0;
    }

    if(camping && (!(~(oldButtons) & ((1<<0))) && (~(buttons) & ((1<<0))))) {
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

    if(collision(player.x,player.y,16,16,80,424,8,8) && state == CAVE) {
        gotKey = 1;
    }

    if(collision(player.x,player.y,16,16,384,312,32,16) && !gotCrystal && gotKey && state == CAVE) {
        detroit = 1;
    }

    if(collision(player.x,player.y,16,16,384,312,32,16) && gotKey && (!(~(oldButtons) & ((1<<0))) && (~(buttons) & ((1<<0)))) && state == CAVE) {
        ((screenblock *)0x6000000)[27].tilemap[((5) * (32) + (16))] = (229 % 512);
        ((screenblock *)0x6000000)[27].tilemap[((5) * (32) + (17))] = (230 % 512);
        ((screenblock *)0x6000000)[27].tilemap[((5) * (32) + (18))] = (231 % 512);
        ((screenblock *)0x6000000)[27].tilemap[((6) * (32) + (16))] = (251 % 512);
        ((screenblock *)0x6000000)[27].tilemap[((6) * (32) + (17))] = (252 % 512);
        ((screenblock *)0x6000000)[27].tilemap[((6) * (32) + (18))] = (253 % 512);

        gotCrystal = 1;
        shadowOAM[19].attr0 = (0<<13) | (2<<14) | (2<<8);
    }




    if((!(~(oldButtons) & ((1<<1))) && (~(buttons) & ((1<<1))))) {
        if(state == CAVE && !caveCheatInt) {
            playSoundB(secret.data, secret.length, 0);
            caveCheatInt = 1;
            cheetad = 9;
            DMANow(3, tsCaveTiles, &((charblock *)0x06000000)[0], sizeof(tsCaveTiles)/2);
            DMANow(3, tsCavePal, ((unsigned short *)0x5000000), sizeof(tsCavePal)/2);
            DMANow(3, caveCheatMap, &((screenblock *)0x6000000)[24], (8192)/2);
        }
    }

    if((!(~(oldButtons) & ((1<<1))) && (~(buttons) & ((1<<1))))) {
        if(state == FISH && !fishCheat) {
            playSoundB(secret.data, secret.length, 0);
            cheetad = 9;
            fishCheat = 1;
        }
    }

    if((!(~(oldButtons) & ((1<<1))) && (~(buttons) & ((1<<1))))) {
        if(state == LEAF && !leafCheat) {
            playSoundB(secret.data, secret.length, 0);
            cheetad = 9;
            leafCheat = 1;
        }
    }

}


void jumpDate() {
    jumpy.isMoving = 0;
    int left = jumpy.x;
    int right = jumpy.x + jumpy.width-1;
    int top = jumpy.y;
    int bottom = jumpy.y + jumpy.height-1;
    if(colorAt(left,bottom + 2) && colorAt(right,bottom + 2)) {
        jumpy.y += 2;
    }

    if((!(~(oldButtons) & ((1<<6))) && (~(buttons) & ((1<<6)))) && (!colorAt(left,bottom + 2) || !colorAt(right,bottom + 2))) {
        jumptimer = 9;
    } else if ((!(~(oldButtons) & ((1<<6))) && (~(buttons) & ((1<<6)))) && snowCheat) {
        jumptimer = 9;
    }
    jumpy.y -= jumptimer;


    if(jumpy.y > 494){
        jumpy.x = 32;
        jumpy.y = 448;
    }

    if ((~(buttons) & ((1<<5)))) {
        jumpy.isMoving = 1;
        jumpy.direction = LEFT;
        if ((left-jumpy.xDel > 0) && colorAt(left - jumpy.xDel,top) && colorAt(left - jumpy.xDel,bottom)) {
            jumpy.x-=jumpy.xDel;

        } else if ((left-jumpy.xDel > 0) && colorAt(left - 1,top) && colorAt(left - 1,bottom)) {
            jumpy.x--;

        }
    }
    if ((~(buttons) & ((1<<4)))) {
        jumpy.isMoving = 1;
        jumpy.direction = RIGHT;
        if ((right+jumpy.xDel < 512) && colorAt(right + jumpy.xDel,top) && colorAt(right + jumpy.xDel,bottom)) {
            jumpy.x+=jumpy.xDel;

        } else if ((right+jumpy.xDel < 512) && colorAt(right + 1,top) && colorAt(right + 1,bottom)) {
            jumpy.x++;

        }
    }


    hOff = jumpy.x - (240 - jumpy.width)/2;
    vOff = jumpy.y - (160 - jumpy.height)/2;
    if (jumpy.x < 0) jumpy.x = 0;
    if (jumpy.y < 0) jumpy.y = 0;
    if (jumpy.x > 512 - jumpy.width) jumpy.x = 512 - jumpy.width;
    if (jumpy.y > 512 - jumpy.height) jumpy.y = 512 - jumpy.height;
    if (hOff < 0) hOff = 0;
    if (vOff < 0) vOff = 0;
    if (hOff > 512 - 240) hOff = 512 - 240;
    if (vOff > 512 - 160) vOff = 512 - 160;

    if (jumpy.isMoving) {

        jumpy.timeUntilNextFrame--;
        if (jumpy.timeUntilNextFrame == 0) {
            jumpy.timeUntilNextFrame = 2;
            jumpy.frame = (jumpy.frame + 1) % 8;
        }
    } else {

        jumpy.frame = 0;
        jumpy.timeUntilNextFrame = 2;
    }

    if(collision(jumpy.x,jumpy.y,16,16,64,168,8,8)) {
        gotCarrot = 1;
    }

    if((!(~(oldButtons) & ((1<<1))) && (~(buttons) & ((1<<1))))) {
        if(state == SNOW && !snowCheat) {
            playSoundB(secret.data, secret.length, 0);
            snowCheat = 1;
            DMANow(3, tsTiles, &((charblock *)0x06000000)[1], sizeof(tsTiles)/2);
            DMANow(3, tsPal+16, ((unsigned short *)0x5000000)+16, 16);
            DMANow(3, rainMap, &((screenblock *)0x6000000)[28], (8192)/2);
            oil = 4;
            cheetad = 9;
        }
    }


    shadowOAM[7].attr0 = (0<<13) | (0<<14) | ((jumpy.y - vOff) & 0xFF);
    shadowOAM[7].attr1 = (1<<14) | ((jumpy.x - hOff) & 0x1FF);
    shadowOAM[7].attr2 = (((0 + (oil/2)) & 0xF) << 12) | (((jumpy.frame * 2) * 32 + ((jumpy.direction * 2) + oil)) & 0x3FF);
}



void drawSherry() {
        if(!sailing && (360 > vOff) && (328 < 160 + vOff)) {
            shadowOAM[1].attr0 = (0<<13) | (2<<14) | ((sherry.y - vOff) & 0xFF);
            shadowOAM[1].attr1 = (2<<14) | ((sherry.x - hOff) & 0x1FF);
            if(time % 10 == 0) {
                shadowOAM[1].attr2 = (((0) & 0xF) << 12) | (((16) * 32 + ((time % 3) * 2)) & 0x3FF);
            }
        } else {
            shadowOAM[1].attr0 = (0<<13) | (2<<14) | (2<<8);
        }
}

void drawGary() {
    if(state == LEAF && (464 > vOff) && (400 < 160 + vOff)) {
        shadowOAM[18].attr0 = (0<<13) | (2<<14) | ((400 - vOff) & 0xFF);
        shadowOAM[18].attr1 = (2<<14) | ((370 - hOff) & 0x1FF);
        if(time % 10 == 0) {
            shadowOAM[18].attr2 = (((4) & 0xF) << 12) | (((16) * 32 + ((time % 3) * 2 +6)) & 0x3FF);
        }
    } else {
        shadowOAM[18].attr0 = (0<<13) | (2<<14) | (2<<8);
    }
}

void drawTeri() {
    if(state == SNOW) {
        if (!gotCarrot && (176 > vOff) && (168 < 160 + vOff)) {
            shadowOAM[9].attr0 = (0<<13) | (0<<14) | ((168 - vOff) & 0xFF);
            shadowOAM[9].attr1 = (0<<14) | ((64 - hOff) & 0x1FF);
            shadowOAM[9].attr2 = (((5) & 0xF) << 12) | (((20) * 32 + (4)) & 0x3FF);
        } else {
            shadowOAM[9].attr0 = (0<<13) | (2<<14) | (2<<8);
        }
        shadowOAM[8].attr0 = (0<<13) | (2<<14) | ((440 - vOff) & 0xFF);
        shadowOAM[8].attr1 = (0<<14) | ((96 - hOff) & 0x1FF);
            if((456 > vOff) && (440 < 160 + vOff)) {
                shadowOAM[8].attr2 = (((0) & 0xF) << 12) | (((20) * 32 + ((terr)+8)) & 0x3FF);
            } else {
                shadowOAM[8].attr0 = (0<<13) | (2<<14) | (2<<8);
            }
    } else {
        shadowOAM[8].attr0 = (0<<13) | (2<<14) | (2<<8);
        shadowOAM[9].attr0 = (0<<13) | (2<<14) | (2<<8);
    }
}

void drawMeter() {
    if (!gotFish && reel) {

            shadowOAM[26].attr0 = (0<<13) | (1<<14) | ((140) & 0xFF);
            shadowOAM[26].attr1 = (2<<14) | ((32+80) & 0x1FF);
            shadowOAM[26].attr2 = (((0) & 0xF) << 12) | (((14) * 32 + (16)) & 0x3FF);

            shadowOAM[27].attr0 = (0<<13) | (1<<14) | ((140) & 0xFF);
            shadowOAM[27].attr1 = (2<<14) | ((64+80) & 0x1FF);
            shadowOAM[27].attr2 = (((0) & 0xF) << 12) | (((14) * 32 + (20)) & 0x3FF);

            shadowOAM[16].attr0 = (0<<13) | (1<<14) | ((140) & 0xFF);
            shadowOAM[16].attr1 = (2<<14) | ((96+80) & 0x1FF);
            shadowOAM[16].attr2 = (((0) & 0xF) << 12) | (((14) * 32 + (24)) & 0x3FF);

            shadowOAM[17].attr0 = (0<<13) | (1<<14) | ((140) & 0xFF);
            shadowOAM[17].attr1 = (2<<14) | ((128+80) & 0x1FF);
            shadowOAM[17].attr2 = (((0) & 0xF) << 12) | (((14) * 32 + (28)) & 0x3FF);


            shadowOAM[10].attr0 = (0<<13) | (1<<14) | ((144) & 0xFF);
            shadowOAM[10].attr1 = (1<<14) | ((meter+72+80) & 0x1FF);
            shadowOAM[10].attr2 = (((1) & 0xF) << 12) | (((12) * 32 + (20)) & 0x3FF);

            shadowOAM[11].attr0 = (0<<13) | (1<<14) | ((144) & 0xFF);
            shadowOAM[11].attr1 = (1<<14) | ((meter+40+80) & 0x1FF);
            shadowOAM[11].attr2 = (((1) & 0xF) << 12) | (((12) * 32 + (20)) & 0x3FF);

            shadowOAM[12].attr0 = (0<<13) | (1<<14) | ((144) & 0xFF);
            shadowOAM[12].attr1 = (1<<14) | ((meter+8+80) & 0x1FF);
            shadowOAM[12].attr2 = (((1) & 0xF) << 12) | (((12) * 32 + (20)) & 0x3FF);

            shadowOAM[13].attr0 = (0<<13) | (0<<14) | ((144) & 0xFF);
            shadowOAM[13].attr1 = (0<<14) | ((meter+80) & 0x1FF);
            shadowOAM[13].attr2 = (((1) & 0xF) << 12) | (((12) * 32 + (19)) & 0x3FF);


            shadowOAM[29].attr0 = (0<<13) | (0<<14) | ((140) & 0xFF);
            shadowOAM[29].attr1 = (1<<14) | ((90) & 0x1FF);
            shadowOAM[29].attr2 = (((0) & 0xF) << 12) | ((((reelFrame*2) + 8) * 32 + (14)) & 0x3FF);

            if (fishCheat) {
                shadowOAM[10].attr2 = (((2) & 0xF) << 12) | (((13) * 32 + (20)) & 0x3FF);
                shadowOAM[11].attr2 = (((2) & 0xF) << 12) | (((13) * 32 + (20)) & 0x3FF);
                shadowOAM[12].attr2 = (((2) & 0xF) << 12) | (((13) * 32 + (20)) & 0x3FF);
                shadowOAM[13].attr2 = (((2) & 0xF) << 12) | (((13) * 32 + (19)) & 0x3FF);
            }


        } else {
            shadowOAM[10].attr0 = (0<<13) | (1<<14) | (2<<8);
            shadowOAM[11].attr0 = (0<<13) | (1<<14) | (2<<8);
            shadowOAM[12].attr0 = (0<<13) | (1<<14) | (2<<8);
            shadowOAM[13].attr0 = (0<<13) | (1<<14) | (2<<8);
            shadowOAM[26].attr0 = (0<<13) | (1<<14) | (2<<8);
            shadowOAM[27].attr0 = (0<<13) | (1<<14) | (2<<8);
            shadowOAM[16].attr0 = (0<<13) | (1<<14) | (2<<8);
            shadowOAM[17].attr0 = (0<<13) | (1<<14) | (2<<8);
            shadowOAM[29].attr0 = (0<<13) | (1<<14) | (2<<8);
    }
}

void drawBanner() {
    if(((state == LEAF) && leafCheat) || ((state == SNOW) && snowCheat) || ((state == CAVE) && caveCheatInt) || ((state == FISH) && fishCheat)) {
        shadowOAM[14].attr0 = (0<<13) | (2<<14) | ((cheeta) & 0xFF);
        shadowOAM[14].attr1 = (2<<14) | ((216) & 0x1FF);
        shadowOAM[14].attr2 = (((0) & 0xF) << 12) | (((9) * 32 + (12)) & 0x3FF);

        shadowOAM[15].attr0 = (0<<13) | (2<<14) | ((cheeta + 32) & 0xFF);
        shadowOAM[15].attr1 = (2<<14) | ((216) & 0x1FF);
        shadowOAM[15].attr2 = (((0) & 0xF) << 12) | (((13) * 32 + (12)) & 0x3FF);

    } else {
        shadowOAM[14].attr0 = (0<<13) | (2<<14) | (2<<8);
        shadowOAM[15].attr0 = (0<<13) | (2<<14) | (2<<8);
    }

    if((state == LEAF) && leafCheat) {
        shadowOAM[28].attr0 = (0<<13) | (0<<14) | ((cheeta - 27) & 0xFF);
        shadowOAM[28].attr1 = (1<<14) | ((190) & 0x1FF);
        shadowOAM[28].attr2 = (((0) & 0xF) << 12) | (((6) * 32 + (12)) & 0x3FF);
    }
    else if((state == SNOW) && snowCheat) {
        shadowOAM[28].attr0 = (0<<13) | (0<<14) | ((cheeta - 27) & 0xFF);
        shadowOAM[28].attr1 = (1<<14) | ((190) & 0x1FF);
        shadowOAM[28].attr2 = (((2) & 0xF) << 12) | (((4) * 32 + (14)) & 0x3FF);
    }
    else if((state == CAVE) && caveCheatInt) {
        shadowOAM[28].attr0 = (0<<13) | (0<<14) | ((cheeta - 27) & 0xFF);
        shadowOAM[28].attr1 = (1<<14) | ((190) & 0x1FF);
        shadowOAM[28].attr2 = (((2) & 0xF) << 12) | (((6) * 32 + (14)) & 0x3FF);
    }
    else if((state == FISH) && fishCheat) {
        shadowOAM[28].attr0 = (0<<13) | (0<<14) | ((cheeta - 27) & 0xFF);
        shadowOAM[28].attr1 = (1<<14) | ((190) & 0x1FF);
        shadowOAM[28].attr2 = (((0) & 0xF) << 12) | (((4) * 32 + (12)) & 0x3FF);
    } else {
        shadowOAM[28].attr0 = (0<<13) | (2<<14) | (2<<8);
    }
}

void drawCamp() {
    if(!gotBerry && camping && collision(player.x,player.y,16,16,312,400,32,32)) {

        shadowOAM[34].attr0 = (0<<13) | (1<<14) | ((140) & 0xFF);
        shadowOAM[34].attr1 = (2<<14) | ((16+40) & 0x1FF);
        shadowOAM[34].attr2 = (((0) & 0xF) << 12) | (((10) * 32 + (16)) & 0x3FF);

        shadowOAM[35].attr0 = (0<<13) | (1<<14) | ((140) & 0xFF);
        shadowOAM[35].attr1 = (2<<14) | ((48+40) & 0x1FF);
        shadowOAM[35].attr2 = (((0) & 0xF) << 12) | (((10) * 32 + (20)) & 0x3FF);

        shadowOAM[36].attr0 = (0<<13) | (1<<14) | ((140) & 0xFF);
        shadowOAM[36].attr1 = (2<<14) | ((80+40) & 0x1FF);
        shadowOAM[36].attr2 = (((0) & 0xF) << 12) | (((10) * 32 + (24)) & 0x3FF);

        shadowOAM[37].attr0 = (0<<13) | (1<<14) | ((140) & 0xFF);
        shadowOAM[37].attr1 = (2<<14) | ((112+40) & 0x1FF);
        shadowOAM[37].attr2 = (((0) & 0xF) << 12) | (((10) * 32 + (28)) & 0x3FF);


        shadowOAM[38].attr0 = (0<<13) | (0<<14) | ((132) & 0xFF);
        shadowOAM[38].attr1 = (0<<14) | ((16+80+4) & 0x1FF);
        shadowOAM[38].attr2 = (((2) & 0xF) << 12) | (((12 + flame1) * 32 + (27)) & 0x3FF);

        shadowOAM[61].attr0 = (0<<13) | (0<<14) | ((132) & 0xFF);
        shadowOAM[61].attr1 = (0<<14) | ((16+80+12) & 0x1FF);
        shadowOAM[61].attr2 = (((2) & 0xF) << 12) | (((12 + flame2) * 32 + (28)) & 0x3FF);

        shadowOAM[60].attr0 = (0<<13) | (0<<14) | ((132) & 0xFF);
        shadowOAM[60].attr1 = (0<<14) | ((16+80+20) & 0x1FF);
        shadowOAM[60].attr2 = (((2) & 0xF) << 12) | (((12 + flame3) * 32 + (29)) & 0x3FF);

        shadowOAM[39].attr0 = (0<<13) | (0<<14) | ((132) & 0xFF);
        shadowOAM[39].attr1 = (0<<14) | ((16+80+28) & 0x1FF);
        shadowOAM[39].attr2 = (((2) & 0xF) << 12) | (((12 + flame4) * 32 + (30)) & 0x3FF);

        shadowOAM[40].attr0 = (0<<13) | (0<<14) | ((132) & 0xFF);
        shadowOAM[40].attr1 = (0<<14) | ((16+80+36) & 0x1FF);
        shadowOAM[40].attr2 = (((2) & 0xF) << 12) | (((12 + flame5) * 32 + (31)) & 0x3FF);

        shadowOAM[33].attr0 = (0<<13) | (1<<14) | ((144) & 0xFF);
        shadowOAM[33].attr1 = (1<<14) | ((burn + 35) & 0x1FF);
        shadowOAM[33].attr2 = (((2) & 0xF) << 12) | (((0) * 32 + (12)) & 0x3FF);

        shadowOAM[25].attr0 = (0<<13) | (0<<14) | ((140) & 0xFF);
        shadowOAM[25].attr1 = (0<<14) | ((mark + 35) & 0x1FF);
        shadowOAM[25].attr2 = (((markpal) & 0xF) << 12) | (((23) * 32 + (4)) & 0x3FF);

        if (leafCheat && camping) {
            shadowOAM[32].attr0 = (0<<13) | (1<<14) | ((144) & 0xFF);
            shadowOAM[32].attr1 = (1<<14) | ((more + 35) & 0x1FF);
            shadowOAM[32].attr2 = (((2) & 0xF) << 12) | (((1) * 32 + (12)) & 0x3FF);
        } else {
            shadowOAM[32].attr0 = (0<<13) | (1<<14) | (2<<8);
        }
    } else {
        shadowOAM[32].attr0 = (0<<13) | (1<<14) | (2<<8);
        shadowOAM[33].attr0 = (0<<13) | (1<<14) | (2<<8);
        shadowOAM[34].attr0 = (0<<13) | (1<<14) | (2<<8);
        shadowOAM[35].attr0 = (0<<13) | (1<<14) | (2<<8);
        shadowOAM[36].attr0 = (0<<13) | (1<<14) | (2<<8);
        shadowOAM[37].attr0 = (0<<13) | (1<<14) | (2<<8);
        shadowOAM[38].attr0 = (0<<13) | (1<<14) | (2<<8);
        shadowOAM[39].attr0 = (0<<13) | (1<<14) | (2<<8);
        shadowOAM[40].attr0 = (0<<13) | (1<<14) | (2<<8);
        shadowOAM[25].attr0 = (0<<13) | (1<<14) | (2<<8);
        shadowOAM[61].attr0 = (0<<13) | (1<<14) | (2<<8);
        shadowOAM[60].attr0 = (0<<13) | (1<<14) | (2<<8);
    }


     if (gotBerry && (464 > vOff) && (400 < 160 + vOff)) {
        shadowOAM[31].attr0 = (0<<13) | (0<<14) | ((408-vOff) & 0xFF);
        shadowOAM[31].attr1 = (0<<14) | ((324-hOff) & 0x1FF);
        shadowOAM[31].attr2 = (((2) & 0xF) << 12) | (((20+litty) * 32 + (12)) & 0x3FF);
     } else {
        shadowOAM[31].attr0 = (0<<13) | (1<<14) | (2<<8);
     }
}

void drawKeys() {
    if (state == CAVE) {
        if (!gotKey && (408 > vOff) && (400 < 160 + vOff)) {
            shadowOAM[21].attr0 = (0<<13) | (0<<14) | ((424 - vOff) & 0xFF);
            shadowOAM[21].attr1 = (0<<14) | ((80 - hOff) & 0x1FF);
            shadowOAM[21].attr2 = (((2) & 0xF) << 12) | (((22) * 32 + (4)) & 0x3FF);
        } else {
            shadowOAM[21].attr0 = (0<<13) | (2<<14) | (2<<8);
        }
        if (gotKey) {
            shadowOAM[19].attr0 = (0<<13) | (2<<14) | ((4) & 0xFF);
            shadowOAM[19].attr1 = (0<<14) | ((180) & 0x1FF);
            shadowOAM[19].attr2 = (((2) & 0xF) << 12) | (((22) * 32 + (5)) & 0x3FF);
        } else {
            shadowOAM[19].attr0 = (0<<13) | (2<<14) | (2<<8);
        }
    }
}

void drawInventory() {





    shadowOAM[6].attr0 = (0<<13) | (0<<14) | ((0) & 0xFF);
    shadowOAM[6].attr1 = (2<<14) | ((208) & 0x1FF);
    shadowOAM[6].attr2 = (((0) & 0xF) << 12) | (((20) * 32 + (0)) & 0x3FF);
    if (gotFish) {
        shadowOAM[2].attr0 = (0<<13) | (0<<14) | ((5) & 0xFF);
        shadowOAM[2].attr1 = (0<<14) | ((227) & 0x1FF);
        shadowOAM[2].attr2 = (((5) & 0xF) << 12) | (((20) * 32 + (5)) & 0x3FF);
    }
    if (gotBerry) {
        shadowOAM[3].attr0 = (0<<13) | (0<<14) | ((19) & 0xFF);
        shadowOAM[3].attr1 = (0<<14) | ((227) & 0x1FF);
        shadowOAM[3].attr2 = (((5) & 0xF) << 12) | (((21) * 32 + (5)) & 0x3FF);
    }
    if (gotCarrot) {
        shadowOAM[4].attr0 = (0<<13) | (0<<14) | ((5) & 0xFF);
        shadowOAM[4].attr1 = (0<<14) | ((213) & 0x1FF);
        shadowOAM[4].attr2 = (((5) & 0xF) << 12) | (((20) * 32 + (4)) & 0x3FF);
    }
    if (gotCrystal) {
        shadowOAM[5].attr0 = (0<<13) | (0<<14) | ((19) & 0xFF);
        shadowOAM[5].attr1 = (0<<14) | ((213) & 0x1FF);
        shadowOAM[5].attr2 = (((5) & 0xF) << 12) | (((21) * 32 + (4)) & 0x3FF);
    }
}

void drawIndicator() {
    if (detroit) {
        shadowOAM[41].attr0 = (0<<13) | (0<<14) | ((136) & 0xFF);
        shadowOAM[41].attr1 = (1<<14) | ((8) & 0x1FF);
        shadowOAM[41].attr2 = (((0) & 0xF) << 12) | (((22) * 32 + (6+(bute*2))) & 0x3FF);
    } else {
        shadowOAM[41].attr0 = (0<<13) | (2<<14) | (2<<8);
    }
}


void draw() {
    drawInventory();
    drawIndicator();
    drawBanner();
    if(state != SNOW) {
        (*(volatile unsigned short *)0x04000010) = hOff;
        (*(volatile unsigned short *)0x04000012) = vOff;
    } else {
        (*(volatile unsigned short *)0x04000014) = hOff;
        (*(volatile unsigned short *)0x04000016) = vOff;
        (*(volatile unsigned short *)0x04000010) = hOff - fallH;
        (*(volatile unsigned short *)0x04000012) = vOff + fallV;
    }
    if (state == GAME) drawSherry();
    if (state == SNOW) drawTeri();
    if (state == FISH) drawMeter();
    if (state == LEAF) drawGary();
    if (state == LEAF) drawCamp();
    if (state == CAVE) drawKeys();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128*4);
}
