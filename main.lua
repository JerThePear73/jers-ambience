-- name: \\#008000\\Jer's Ambience
-- incompatible: light environment-tint
-- description: Description

local SKYBOX_NONE       = 255
local SKYBOX_WATER      = 0
local SKYBOX_SUNSET     = 1
local SKYBOX_HELL       = 2
local SKYBOX_EVIL       = 3
local SKYBOX_CLOUDS     = 4
local SKYBOX_WINTER     = 5
local SKYBOX_SPOOKY     = 6
local SKYBOX_NIGHT      = 7
local SKYBOX_DESERT     = 8
local SKYBOX_GLOOMY     = 9
local SKYBOX_DARKWORLD  = 10
local SKYBOX_UNDERWATER = 11
local SKYBOX_SWAMP      = 12
local SKYBOX_NIGHTSKY   = 13
local SKYBOX_SPACE      = 14
local SKYBOX_SPACE_RED  = 15


local E_MODEL_SKYBOX = smlua_model_util_get_id('jambi_skyboxes_geo')
local E_MODEL_GLOW = smlua_model_util_get_id('jambi_glow_geo')
local skyboxState = 0
local prevLevel = 10
local prevArea = 10

-- environment presets
local ENV_SUNNY         = {colour = { r = 255, g = 255, b = 255 },  shade = 1,      glow = false,   sky = SKYBOX_WATER}
local ENV_SUNSET        = {colour = { r = 255, g = 180, b = 100 },  shade = 0.8,    glow = false,   sky = SKYBOX_SUNSET}
local ENV_LAVA          = {colour = { r = 255, g = 125, b = 80 },   shade = 0.8,    glow = false,   sky = SKYBOX_HELL}
local ENV_BITS          = {colour = { r = 200, g = 100, b = 255 },  shade = 0.5,    glow = false,   sky = SKYBOX_EVIL}
local ENV_GOLD_CLOUDS   = {colour = { r = 255, g = 180, b = 120 },  shade = 1,      glow = false,   sky = SKYBOX_CLOUDS}
local ENV_SNOW          = {colour = { r = 150, g = 160, b = 220 },  shade = 0.9,    glow = false,   sky = SKYBOX_WINTER}
local ENV_SNOW_INDOOR   = {colour = { r = 150, g = 160, b = 220 },  shade = 0.9,    glow = false,   sky = SKYBOX_NONE}
local ENV_SPOOKY        = {colour = { r = 100, g =  70, b =  50 },  shade = 0,      glow = true,    sky = SKYBOX_SPOOKY}
local ENV_SNOW_NIGHT    = {colour = { r =  50, g =  70, b = 120 },  shade = 0.5,    glow = true,    sky = SKYBOX_NIGHT}
local ENV_DUNGEON       = {colour = { r = 130, g = 100, b =  50 },  shade = 0.2,    glow = true,    sky = SKYBOX_NONE}
local ENV_DESERT        = {colour = { r = 255, g = 200, b = 120 },  shade = 0.8,    glow = false,   sky = SKYBOX_DESERT}
local ENV_GLOOMY        = {colour = { r = 130, g = 150, b = 180 },  shade = 0.7,    glow = false,   sky = SKYBOX_GLOOMY}
local ENV_DARKWORLD     = {colour = { r =  80, g = 180, b = 150 },  shade = 0,      glow = true,    sky = SKYBOX_DARKWORLD}
local ENV_UNDERWATER    = {colour = { r = 120, g = 130, b = 230 },  shade = 1,      glow = false,   sky = SKYBOX_UNDERWATER}
local ENV_INDOOR        = {colour = { r = 255, g = 220, b = 160 },  shade = 0.8,    glow = false,   sky = SKYBOX_NONE}
local ENV_SLIDE         = {colour = { r = 255, g = 180, b = 100 },  shade = 0.8,    glow = false,   sky = SKYBOX_NONE}
local ENV_CLOCK         = {colour = { r = 255, g = 190, b = 100 },  shade = 1,      glow = false,   sky = SKYBOX_NONE}
local ENV_VANISH        = {colour = { r =  80, g =  80, b =  80 },  shade = 0.5,    glow = true,    sky = SKYBOX_NONE}
-- star road
local ENV_PUGATORY      = {colour = { r = 255, g = 255, b = 255 },  shade = 0.5,    glow = true,    sky = SKYBOX_NONE}
local ENV_SWAMP         = {colour = { r = 210, g = 230, b = 120 },  shade = 0.8,    glow = false,   sky = SKYBOX_SWAMP}
local ENV_NIGHT         = {colour = { r =  80, g = 110, b = 170 },  shade = 0.2,    glow = true,    sky = SKYBOX_NIGHTSKY}
local ENV_SPACE         = {colour = { r = 170, g = 150, b = 255 },  shade = 0.5,    glow = false,   sky = SKYBOX_SPACE}
-- eureka
local ENV_CAVE          = {colour = { r =  80, g = 110, b = 170 },  shade = 0.2,    glow = true,    sky = SKYBOX_NONE}
local ENV_NIGHT_CITY    = {colour = { r =  50, g =  70, b = 100 },  shade = 0,      glow = true,    sky = SKYBOX_NONE}
local ENV_CASTLE        = {colour = { r = 200, g = 180, b = 100 },  shade = 0.4,    glow = false,   sky = SKYBOX_NONE}
local ENV_SPACE_RED     = {colour = { r = 255, g = 100, b = 200 },  shade = 0.5,    glow = false,   sky = SKYBOX_SPACE_RED}

local romBasegame = {
    [LEVEL_BBH]                 = {ENV_SPOOKY},
    [LEVEL_CCM]                 = {ENV_SNOW, ENV_SNOW_INDOOR},
    [LEVEL_CASTLE]              = {ENV_INDOOR, ENV_INDOOR, ENV_INDOOR},
    [LEVEL_HMC]                 = {ENV_DUNGEON},
    [LEVEL_SSL]                 = {ENV_DESERT, ENV_DUNGEON, ENV_DUNGEON},
    [LEVEL_BOB]                 = {ENV_SUNNY},
    [LEVEL_SL]                  = {ENV_SNOW, ENV_SNOW_INDOOR},
    [LEVEL_WDW]                 = {ENV_UNDERWATER},
    [LEVEL_JRB]                 = {ENV_GLOOMY, ENV_GLOOMY},
    [LEVEL_THI]                 = {ENV_SUNNY, ENV_SUNSET, ENV_DUNGEON},
    [LEVEL_TTC]                 = {ENV_CLOCK},
    [LEVEL_RR]                  = {ENV_SNOW_NIGHT},
    [LEVEL_CASTLE_GROUNDS]      = {ENV_SUNNY, ENV_SUNSET},
    [LEVEL_BITDW]               = {ENV_DARKWORLD},
    [LEVEL_VCUTM]               = {ENV_VANISH},
    [LEVEL_BITFS]               = {ENV_LAVA},
    [LEVEL_SA]                  = {ENV_SUNSET},
    [LEVEL_BITS]                = {ENV_BITS},
    [LEVEL_LLL]                 = {ENV_LAVA, ENV_LAVA},
    [LEVEL_DDD]                 = {ENV_SUNSET, ENV_SLIDE},
    [LEVEL_WF]                  = {ENV_GOLD_CLOUDS},
    [LEVEL_ENDING]              = {ENV_SUNNY},
    [LEVEL_CASTLE_COURTYARD]    = {ENV_SUNSET},
    [LEVEL_PSS]                 = {ENV_SLIDE},
    [LEVEL_COTMC]               = {ENV_DUNGEON},
    [LEVEL_TOTWC]               = {ENV_GOLD_CLOUDS},
    [LEVEL_BOWSER_1]            = {ENV_DARKWORLD},
    [LEVEL_WMOTR]               = {ENV_GOLD_CLOUDS},
    [LEVEL_BOWSER_2]            = {ENV_LAVA},
    [LEVEL_BOWSER_3]            = {ENV_BITS},
    [LEVEL_TTM]                 = {ENV_SUNSET, ENV_SLIDE},
}
local romStarRoad = {
    [4]     = {ENV_SPOOKY},         --Gloomy Garden
    [5]     = {ENV_SUNSET},         --Chuckya Harbor
    [6]     = {ENV_SPACE},          --Overworld 3 (Clouds)
    [7]     = {ENV_GLOOMY},         --Colorful Coral Caverns
    [8]     = {ENV_GOLD_CLOUDS},    --Large Leaf Forest
    [9]     = {ENV_SUNNY},          --Bob-omb Islands
    [10]    = {ENV_SNOW},           --Melting Snow Peaks
    [11]    = {ENV_GOLD_CLOUDS},    --Colossal Candy Clutter
    [12]    = {ENV_NIGHT},          --Piranha Plant Pond
    [13]    = {ENV_LAVA},           --Fatal Flames Falls
    [14]    = {ENV_SPACE},          --Bob-omb Battle Factory
    [15]    = {ENV_SPACE},          --Starlight Runway
    [16]    = {ENV_SUNNY},          --Overworld 1 (Outdoor)
    [17]    = {ENV_SWAMP},          --Bowser's Slippery Swamp
    [18]    = {ENV_VANISH},         --Puzzle Of The Vanish Cap
    [19]    = {ENV_LAVA},           --Retro Remix Castle
    [20]    = {ENV_DESERT},         --Sandy Secret Slide
    [21]    = {ENV_SPACE},          --Bowser's Rainbow Rumble
    [22]    = {ENV_DESERT},         --Koopa Canyon
    [23]    = {ENV_GOLD_CLOUDS},    --Mad Musical Mess
    [24]    = {ENV_GOLD_CLOUDS},    --Sky Land Resort
    [25]    = {ENV_NIGHT},          --The End (Night Overworld)
    [26]    = {ENV_INDOOR},         --Overworld 2 (Inside Castle)
    [27]    = {ENV_SUNNY},          --Mushroom Mountain Town
    [28]    = {ENV_DUNGEON},        --Creepy Cap Cave
    [29]    = {ENV_GOLD_CLOUDS},    --Windy Wing Cap Well
    [30]    = {ENV_SWAMP},          --Bowser Fight 1
    [31]    = {ENV_GOLD_CLOUDS},    --Hidden Palace Finale
    [33]    = {ENV_LAVA},           --Bowser Fight 2
    [34]    = {ENV_SPACE},          --Bowser Fight 3
    [36]    = {ENV_GOLD_CLOUDS},    --Cloudrail Station
    [50]    = {ENV_PUGATORY},       --Purgatory
}
local romEureka = {
    [4]     = {ENV_SWAMP, ENV_INDOOR, ENV_SWAMP},                                   --Slime Juice Swamp -- Area 2 = katze789 -- Area 3 = Poison cave area
    [5]     = {ENV_DESERT, ENV_DESERT, ENV_INDOOR},                                 --Plateau Palace -- Area 2 = Koopa race -- Area 3 = Grypht18
    [6]     = {ENV_CASTLE, ENV_CASTLE, ENV_CASTLE},                                 --Overworld 3 (Bowser Hallway) -- Area 2 = Bowser 3 entrance -- Area 3 = 1up minigame
    [7]     = {ENV_NIGHT, ENV_LAVA, ENV_NIGHT, ENV_INDOOR, ENV_NIGHT},              --Moonlit Forest -- Area 2 = UFO -- Area 3 = Big Boo boss -- Area 4 = Dackage -- Area 5 = Point of no return
    [8]     = {ENV_LAVA, ENV_INDOOR},                                               --Everlasting Embers -- Area 2 = LoogieTanuki
    [9]     = {ENV_SUNNY, ENV_INDOOR, ENV_INDOOR},                                  --Vibrant Valley -- Area 2 = KazeSM64 -- Area 3 = Toad's house
    [10]    = {ENV_SPACE, ENV_INDOOR, ENV_SPACE},                                   --Solitary Starline -- Area 2 = Tomatobird8 -- Area 3 = I actually have no idea what this is. There is no star, 1up or anything. The pipe takes you to Slime Juice Swamp for some reason.
    [11]    = {ENV_CLOCK},                                                          --Tower Of Time
    [12]    = {ENV_SUNSET, ENV_CAVE, ENV_INDOOR},                                   --Sun Bleached Bay -- Area 2 = Red coin cave -- Area 3 = BroDute
    [13]    = {ENV_DUNGEON},                                                        --Koopa's Dungeon
    [14]    = {ENV_CAVE, ENV_DUNGEON},                                              --River Cave Retreat -- Area 2 = King Bob-omb boss
    [15]    = {ENV_SPACE},                                                          --Planetary Intergalactic
    [16]    = {ENV_INDOOR, ENV_DARKWORLD, ENV_SPACE},                               --Overworld 1 (Lobby) -- Area 2 = Lab -- Area 3 = Lucky Cat 1
    [17]    = {ENV_LAVA},                                                           --The Chamber of Secrets (B1)
    [18]    = {ENV_NIGHT_CITY, ENV_VANISH},                                         --The Art of Vanishing -- Area 2 = King Whomp boss
    [19]    = {ENV_DUNGEON},                                                        --The Sands of Time (B2)
    [20]    = {ENV_SPACE, ENV_SPACE, ENV_SPACE, ENV_SPACE, ENV_SPACE, ENV_SPACE},   --Credits -- Areas 1-5 = Credits -- Area 6 = Continue?
    [21]    = {ENV_SPACE_RED},                                                      --The Ultimate Showdown (B3)
    [22]    = {ENV_SNOW, ENV_INDOOR},                                               --Gusty Grotto -- Area 2 = Ap616
    [23]    = {ENV_NIGHT, ENV_INDOOR, ENV_INDOOR},                                  --Spooky Sweepstakes -- Area 2 = Its MattyBuhh -- Area 3 = Koopa race
    [24]    = {ENV_GOLD_CLOUDS, ENV_INDOOR, ENV_VANISH, ENV_GOLD_CLOUDS},           --Farmland Factory -- Area 2 = Inside building -- Area 3 = Basement -- Area 4 = drunkrazy
    [26]    = {ENV_GOLD_CLOUDS, ENV_INDOOR, ENV_INDOOR, ENV_SPACE},                 --Overworld 2 (Outdoor) -- Area 2 = Poker house -- Area 3 = Tree Of Wisdom -- Area 4 = Lucky Cat 2
    [27]    = {ENV_INDOOR},                                                         --100 reasons To Be Kinged
    [28]    = {ENV_DUNGEON},                                                        --The Power Of Metal
    [29]    = {ENV_GOLD_CLOUDS},                                                    --The Gift Of Flight
    [30]    = {ENV_DUNGEON},                                                        --Bowser Fight 1
    [31]    = {ENV_NIGHT, ENV_NIGHT, ENV_NIGHT},                                    --The Raging Clue -- Areas 1-3 = Different puzzles
    [33]    = {ENV_DESERT},                                                         --Bowser Fight 2
    [34]    = {ENV_SPACE_RED},                                                      --Bowser Fight 3
    [36]    = {ENV_SPACE, ENV_SPACE},                                               --Majestic Mirage -- Area 2 = Wiggler boss
}

local curr_romhack = romBasegame
local function get_romhack()
    for _,mods in pairs(gActiveMods) do
        if mods.name == "Star Road" then
            curr_romhack = romStarRoad
            --djui_popup_create("star road", 1)
        elseif mods.name == "\\#ffeb69\\Eureka" then
            curr_romhack = romEureka
            --djui_popup_create("eureka", 1)
        end
    end
    --djui_popup_create("loaded", 1)
end
hook_event(HOOK_ON_MODS_LOADED, get_romhack)

local function skybox_init(o)
    o.header.gfx.skipInViewCheck = true
    set_override_far(200000)
end

local function skybox_loop(o)
    return
end

id_bhvSkybox = hook_behavior(id_bhvSkybox, OBJ_LIST_UNIMPORTANT, true, skybox_init, skybox_loop)

local function glow_init(o)
    o.oFlags = OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
end

local function glow_loop(o)
    local m = gMarioStates[0]
    o.oPosX = m.pos.x
    o.oPosY = m.pos.y + 70
    o.oPosZ = m.pos.z
end

id_bhvGlow = hook_behavior(id_bhvGlow, OBJ_LIST_UNIMPORTANT, true, glow_init, glow_loop)

function skybox_switch(node, marStackIndex)
    local asSwitchNode = cast_graph_node(node)
    asSwitchNode.selectedCase = skyboxState
end

local function create_skybox()
    local level = gNetworkPlayers[0].currLevelNum
    local area = gNetworkPlayers[0].currAreaIndex
    local environment = curr_romhack[level][area]
    spawn_non_sync_object(
        id_bhvSkybox,
        E_MODEL_SKYBOX,
        0, 0, 0, 
        function(o)
            obj_scale(o, 30)
            if environment.sky == SKYBOX_NONE then
                obj_mark_for_deletion(o)
            end
        end)
end

local function level_warp()
    set_override_skybox(BACKGROUND_CUSTOM)
end

local function level_init()
    local level = gNetworkPlayers[0].currLevelNum
    local area = gNetworkPlayers[0].currAreaIndex
    local environment = curr_romhack[level][area]
    if level == prevLevel then
        create_skybox()
    end
end

local function mario_update(m)
    local level = gNetworkPlayers[0].currLevelNum
    local area = gNetworkPlayers[0].currAreaIndex
    local environment = curr_romhack[level][area]

    if m.action == ACT_END_PEACH_CUTSCENE or m.action == ACT_END_WAVING_CUTSCENE and curr_romhack == romBasegame then
        environment = romBasegame[level][2]
    end

    if (prevLevel ~= level or prevArea ~= area) and environment ~= nil then
        set_lighting_color(0, environment.colour.r)
        set_lighting_color(1, environment.colour.g)
        set_lighting_color(2, environment.colour.b)
        set_vertex_color(0, environment.colour.r)
        set_vertex_color(1, environment.colour.g)
        set_vertex_color(2, environment.colour.b)
        set_fog_color(0, environment.colour.r)
        set_fog_color(1, environment.colour.g)
        set_fog_color(2, environment.colour.b)
        set_lighting_color_ambient(0, environment.colour.r * environment.shade)
        set_lighting_color_ambient(1, environment.colour.g * environment.shade)
        set_lighting_color_ambient(2, environment.colour.b * environment.shade)
        skyboxState = environment.sky
        if environment.glow then
            spawn_non_sync_object(
                id_bhvGlow,
                E_MODEL_GLOW,
                0, 0, 0,
                nil
            )
        end
        create_skybox()
        prevLevel = level
        prevArea = area
    end
end

hook_event(HOOK_ON_LEVEL_INIT, level_init)
hook_event(HOOK_ON_WARP, level_warp)
hook_event(HOOK_MARIO_UPDATE, mario_update)