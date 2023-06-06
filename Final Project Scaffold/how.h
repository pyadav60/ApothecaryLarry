
//{{BLOCK(how)

//======================================================================
//
//	how, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 331 tiles (t|f|p reduced) not compressed
//	+ regular map (flat), not compressed, 32x32 
//	Total size: 512 + 10592 + 2048 = 13152
//
//	Time-stamp: 2023-04-20, 15:23:08
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_HOW_H
#define GRIT_HOW_H

#define howTilesLen 10592
extern const unsigned short howTiles[5296];

#define howMapLen 2048
extern const unsigned short howMap[1024];

#define howPalLen 512
extern const unsigned short howPal[256];

#endif // GRIT_HOW_H

//}}BLOCK(how)
