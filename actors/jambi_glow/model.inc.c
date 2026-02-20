Gfx jambi_glow_spotlight_rgba16_aligner[] = {gsSPEndDisplayList()};
u8 jambi_glow_spotlight_rgba16[] = {
	#include "actors/jambi_glow/spotlight.rgba16.inc.c"
};

Vtx jambi_glow_Glow_DL_mesh_layer_5_vtx_0[4] = {
	{{ {-200, -200, -100}, 0, {-16, 2032}, {255, 255, 255, 255} }},
	{{ {200, -200, -100}, 0, {2032, 2032}, {255, 255, 255, 255} }},
	{{ {200, 200, -100}, 0, {2032, -16}, {255, 255, 255, 255} }},
	{{ {-200, 200, -100}, 0, {-16, -16}, {255, 255, 255, 255} }},
};

Gfx jambi_glow_Glow_DL_mesh_layer_5_tri_0[] = {
	gsSPVertex(jambi_glow_Glow_DL_mesh_layer_5_vtx_0 + 0, 4, 0),
	gsSP2Triangles(0, 1, 2, 0, 0, 2, 3, 0),
	gsSPEndDisplayList(),
};


Gfx mat_jambi_glow_Light[] = {
	gsSPGeometryMode(G_ZBUFFER | G_SHADE | G_LIGHTING | G_SHADING_SMOOTH, 0),
	gsDPPipeSync(),
	gsDPSetCombineLERP(TEXEL0, 0, PRIMITIVE, 0, TEXEL0, 0, PRIMITIVE, 0, TEXEL0, 0, PRIMITIVE, 0, TEXEL0, 0, PRIMITIVE, 0),
	gsDPSetTextureFilter(G_TF_AVERAGE),
	gsSPTexture(65535, 65535, 0, 0, 1),
	gsDPSetPrimColor(0, 0, 255, 255, 255, 255),
	gsDPSetTextureImage(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 1, jambi_glow_spotlight_rgba16),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b_LOAD_BLOCK, 0, 0, 7, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0, G_TX_WRAP | G_TX_NOMIRROR, 0, 0),
	gsDPLoadBlock(7, 0, 0, 4095, 128),
	gsDPSetTile(G_IM_FMT_RGBA, G_IM_SIZ_16b, 16, 0, 0, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, 0, G_TX_CLAMP | G_TX_NOMIRROR, 6, 0),
	gsDPSetTileSize(0, 0, 0, 252, 252),
	gsSPEndDisplayList(),
};

Gfx mat_revert_jambi_glow_Light[] = {
	gsSPGeometryMode(0, G_ZBUFFER | G_SHADE | G_LIGHTING | G_SHADING_SMOOTH),
	gsDPPipeSync(),
	gsDPSetTextureFilter(G_TF_BILERP),
	gsSPEndDisplayList(),
};

Gfx jambi_glow_Glow_DL_mesh_layer_5[] = {
	gsSPDisplayList(mat_jambi_glow_Light),
	gsSPDisplayList(jambi_glow_Glow_DL_mesh_layer_5_tri_0),
	gsSPDisplayList(mat_revert_jambi_glow_Light),
	gsDPPipeSync(),
	gsSPSetGeometryMode(G_LIGHTING),
	gsSPClearGeometryMode(G_TEXTURE_GEN),
	gsDPSetCombineLERP(0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT, 0, 0, 0, SHADE, 0, 0, 0, ENVIRONMENT),
	gsSPTexture(65535, 65535, 0, 0, 0),
	gsDPSetEnvColor(255, 255, 255, 255),
	gsDPSetAlphaCompare(G_AC_NONE),
	gsSPEndDisplayList(),
};

