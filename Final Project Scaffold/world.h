
//{{BLOCK(world)

//======================================================================
//
//	world, 512x512@4, 
//	+ palette 256 entries, not compressed
//	+ 218 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 6976 + 8192 = 15680
//
//	Time-stamp: 2023-04-12, 23:45:57
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_WORLD_H
#define GRIT_WORLD_H

#define worldTilesLen 6976
extern const unsigned short worldTiles[3488];

#define worldMapLen 8192
extern const unsigned short worldMap[4096];

#define worldPalLen 512
extern const unsigned short worldPal[256];

#endif // GRIT_WORLD_H

//}}BLOCK(world)
