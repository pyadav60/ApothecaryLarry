
//{{BLOCK(epic)

//======================================================================
//
//	epic, 512x512@4, 
//	+ palette 256 entries, not compressed
//	+ 407 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 13024 + 8192 = 21728
//
//	Time-stamp: 2023-04-20, 02:13:58
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_EPIC_H
#define GRIT_EPIC_H

#define epicTilesLen 13024
extern const unsigned short epicTiles[6512];

#define epicMapLen 8192
extern const unsigned short epicMap[4096];

#define epicPalLen 512
extern const unsigned short epicPal[256];

#endif // GRIT_EPIC_H

//}}BLOCK(epic)
