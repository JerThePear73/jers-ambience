#include "src/game/envfx_snow.h"

const GeoLayout jambi_skyboxes_Switch_opt1[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_DISPLAY_LIST(LAYER_FORCE, jambi_skyboxes_Skybox_DL_mesh_layer_0_mat_override__1_Sunset_0),
	GEO_CLOSE_NODE(),
	GEO_RETURN(),
};
const GeoLayout jambi_skyboxes_Switch_opt2[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_DISPLAY_LIST(LAYER_FORCE, jambi_skyboxes_Skybox_DL_mesh_layer_0_mat_override__2_Hell_1),
	GEO_CLOSE_NODE(),
	GEO_RETURN(),
};
const GeoLayout jambi_skyboxes_Switch_opt3[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_DISPLAY_LIST(LAYER_FORCE, jambi_skyboxes_Skybox_DL_mesh_layer_0_mat_override__3_Evil_2),
	GEO_CLOSE_NODE(),
	GEO_RETURN(),
};
const GeoLayout jambi_skyboxes_Switch_opt4[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_DISPLAY_LIST(LAYER_FORCE, jambi_skyboxes_Skybox_DL_mesh_layer_0_mat_override__4_Clouds_3),
	GEO_CLOSE_NODE(),
	GEO_RETURN(),
};
const GeoLayout jambi_skyboxes_Switch_opt5[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_DISPLAY_LIST(LAYER_FORCE, jambi_skyboxes_Skybox_DL_mesh_layer_0_mat_override__5_Winter_4),
	GEO_CLOSE_NODE(),
	GEO_RETURN(),
};
const GeoLayout jambi_skyboxes_Switch_opt6[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_DISPLAY_LIST(LAYER_FORCE, jambi_skyboxes_Skybox_DL_mesh_layer_0_mat_override__6_Spooky_5),
	GEO_CLOSE_NODE(),
	GEO_RETURN(),
};
const GeoLayout jambi_skyboxes_Switch_opt7[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_DISPLAY_LIST(LAYER_FORCE, jambi_skyboxes_Skybox_DL_mesh_layer_0_mat_override__7_Night_6),
	GEO_CLOSE_NODE(),
	GEO_RETURN(),
};
const GeoLayout jambi_skyboxes_Switch_opt8[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_DISPLAY_LIST(LAYER_FORCE, jambi_skyboxes_Skybox_DL_mesh_layer_0_mat_override__8_Desert_7),
	GEO_CLOSE_NODE(),
	GEO_RETURN(),
};
const GeoLayout jambi_skyboxes_Switch_opt9[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_DISPLAY_LIST(LAYER_FORCE, jambi_skyboxes_Skybox_DL_mesh_layer_0_mat_override__9_Gloomy_8),
	GEO_CLOSE_NODE(),
	GEO_RETURN(),
};
const GeoLayout jambi_skyboxes_Switch_opt10[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_DISPLAY_LIST(LAYER_FORCE, jambi_skyboxes_Skybox_DL_mesh_layer_0_mat_override__10_Darkworld_9),
	GEO_CLOSE_NODE(),
	GEO_RETURN(),
};
const GeoLayout jambi_skyboxes_Switch_opt11[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_DISPLAY_LIST(LAYER_FORCE, jambi_skyboxes_Skybox_DL_mesh_layer_0_mat_override__11_Underwater_10),
	GEO_CLOSE_NODE(),
	GEO_RETURN(),
};
const GeoLayout jambi_skyboxes_Switch_opt12[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_DISPLAY_LIST(LAYER_FORCE, jambi_skyboxes_Skybox_DL_mesh_layer_0_mat_override__12_Swamp_11),
	GEO_CLOSE_NODE(),
	GEO_RETURN(),
};
const GeoLayout jambi_skyboxes_Switch_opt13[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_DISPLAY_LIST(LAYER_FORCE, jambi_skyboxes_Skybox_DL_mesh_layer_0_mat_override__13_Night_12),
	GEO_CLOSE_NODE(),
	GEO_RETURN(),
};
const GeoLayout jambi_skyboxes_Switch_opt14[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_DISPLAY_LIST(LAYER_FORCE, jambi_skyboxes_Skybox_DL_mesh_layer_0_mat_override__14_Space_13),
	GEO_CLOSE_NODE(),
	GEO_RETURN(),
};
const GeoLayout jambi_skyboxes_Switch_opt15[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_DISPLAY_LIST(LAYER_FORCE, jambi_skyboxes_Skybox_DL_mesh_layer_0_mat_override__15_Space_Red_14),
	GEO_CLOSE_NODE(),
	GEO_RETURN(),
};
const GeoLayout jambi_skyboxes_geo[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_SCALE(LAYER_OPAQUE, 655360),
		GEO_OPEN_NODE(),
			GEO_SWITCH_CASE(0, skybox_switch),
			GEO_OPEN_NODE(),
				GEO_NODE_START(),
				GEO_OPEN_NODE(),
					GEO_DISPLAY_LIST(LAYER_FORCE, jambi_skyboxes_Skybox_DL_mesh_layer_0),
				GEO_CLOSE_NODE(),
				GEO_BRANCH(1, jambi_skyboxes_Switch_opt1),
				GEO_BRANCH(1, jambi_skyboxes_Switch_opt2),
				GEO_BRANCH(1, jambi_skyboxes_Switch_opt3),
				GEO_BRANCH(1, jambi_skyboxes_Switch_opt4),
				GEO_BRANCH(1, jambi_skyboxes_Switch_opt5),
				GEO_BRANCH(1, jambi_skyboxes_Switch_opt6),
				GEO_BRANCH(1, jambi_skyboxes_Switch_opt7),
				GEO_BRANCH(1, jambi_skyboxes_Switch_opt8),
				GEO_BRANCH(1, jambi_skyboxes_Switch_opt9),
				GEO_BRANCH(1, jambi_skyboxes_Switch_opt10),
				GEO_BRANCH(1, jambi_skyboxes_Switch_opt11),
				GEO_BRANCH(1, jambi_skyboxes_Switch_opt12),
				GEO_BRANCH(1, jambi_skyboxes_Switch_opt13),
				GEO_BRANCH(1, jambi_skyboxes_Switch_opt14),
				GEO_BRANCH(1, jambi_skyboxes_Switch_opt15),
			GEO_CLOSE_NODE(),
		GEO_CLOSE_NODE(),
	GEO_CLOSE_NODE(),
	GEO_END(),
};
