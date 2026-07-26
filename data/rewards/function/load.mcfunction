# Remove any leftover debug objectives
scoreboard objectives remove rwd_test

# Per-block-type stat objectives
scoreboard objectives add st_oak_log minecraft.mined:minecraft.oak_log
scoreboard objectives add st_birch_log minecraft.mined:minecraft.birch_log
scoreboard objectives add st_spruce_log minecraft.mined:minecraft.spruce_log
scoreboard objectives add st_jungle_log minecraft.mined:minecraft.jungle_log
scoreboard objectives add st_acacia_log minecraft.mined:minecraft.acacia_log
scoreboard objectives add st_dark_oak_log minecraft.mined:minecraft.dark_oak_log
scoreboard objectives add st_mangrove_log minecraft.mined:minecraft.mangrove_log
scoreboard objectives add st_cherry_log minecraft.mined:minecraft.cherry_log
scoreboard objectives add st_oak_wood minecraft.mined:minecraft.oak_wood
scoreboard objectives add st_birch_wood minecraft.mined:minecraft.birch_wood
scoreboard objectives add st_spruce_wood minecraft.mined:minecraft.spruce_wood
scoreboard objectives add st_jungle_wood minecraft.mined:minecraft.jungle_wood
scoreboard objectives add st_acacia_wood minecraft.mined:minecraft.acacia_wood
scoreboard objectives add st_dark_oak_woo minecraft.mined:minecraft.dark_oak_wood
scoreboard objectives add st_mangrove_woo minecraft.mined:minecraft.mangrove_wood
scoreboard objectives add st_cherry_wood minecraft.mined:minecraft.cherry_wood
scoreboard objectives add st_coal minecraft.mined:minecraft.coal_ore
scoreboard objectives add st_ds_coal minecraft.mined:minecraft.deepslate_coal_ore
scoreboard objectives add st_iron minecraft.mined:minecraft.iron_ore
scoreboard objectives add st_ds_iron minecraft.mined:minecraft.deepslate_iron_ore
scoreboard objectives add st_copper minecraft.mined:minecraft.copper_ore
scoreboard objectives add st_ds_copper minecraft.mined:minecraft.deepslate_copper_ore
scoreboard objectives add st_gold minecraft.mined:minecraft.gold_ore
scoreboard objectives add st_ds_gold minecraft.mined:minecraft.deepslate_gold_ore
scoreboard objectives add st_nether_gold minecraft.mined:minecraft.nether_gold_ore
scoreboard objectives add st_lapis minecraft.mined:minecraft.lapis_ore
scoreboard objectives add st_ds_lapis minecraft.mined:minecraft.deepslate_lapis_ore
scoreboard objectives add st_redstone minecraft.mined:minecraft.redstone_ore
scoreboard objectives add st_ds_redstone minecraft.mined:minecraft.deepslate_redstone_ore
scoreboard objectives add st_emerald minecraft.mined:minecraft.emerald_ore
scoreboard objectives add st_ds_emerald minecraft.mined:minecraft.deepslate_emerald_ore
scoreboard objectives add st_diamond minecraft.mined:minecraft.diamond_ore
scoreboard objectives add st_ds_diamond minecraft.mined:minecraft.deepslate_diamond_ore
scoreboard objectives add st_nether_quart minecraft.mined:minecraft.nether_quartz_ore
scoreboard objectives add st_ancient_debr minecraft.mined:minecraft.ancient_debris
scoreboard objectives add st_d_dirt minecraft.mined:minecraft.dirt
scoreboard objectives add st_d_coarse_di minecraft.mined:minecraft.coarse_dirt
scoreboard objectives add st_d_rooted_di minecraft.mined:minecraft.rooted_dirt
scoreboard objectives add st_d_grass_blo minecraft.mined:minecraft.grass_block
scoreboard objectives add st_d_mycelium minecraft.mined:minecraft.mycelium
scoreboard objectives add st_d_podzol minecraft.mined:minecraft.podzol
scoreboard objectives add st_d_farmland minecraft.mined:minecraft.farmland
scoreboard objectives add st_d_gravel minecraft.mined:minecraft.gravel
scoreboard objectives add st_d_sand minecraft.mined:minecraft.sand
scoreboard objectives add st_d_red_sand minecraft.mined:minecraft.red_sand
scoreboard objectives add st_d_soul_sand minecraft.mined:minecraft.soul_sand
scoreboard objectives add st_d_soul_soil minecraft.mined:minecraft.soul_soil
scoreboard objectives add st_d_mud minecraft.mined:minecraft.mud
scoreboard objectives add st_d_muddy_man minecraft.mined:minecraft.muddy_mangrove_roots
scoreboard objectives add st_wooden_sp minecraft.used:minecraft.wooden_spear
scoreboard objectives add st_stone_sp minecraft.used:minecraft.stone_spear
scoreboard objectives add st_iron_sp minecraft.used:minecraft.iron_spear
scoreboard objectives add st_golden_sp minecraft.used:minecraft.golden_spear
scoreboard objectives add st_diamon_sp minecraft.used:minecraft.diamond_spear
scoreboard objectives add st_nether_sp minecraft.used:minecraft.netherite_spear

# Running totals and stages
scoreboard objectives add rwd_logs dummy
scoreboard objectives add rwd_log_stage dummy
scoreboard objectives add rwd_ores dummy
scoreboard objectives add rwd_ore_stage dummy
scoreboard objectives add rwd_kills minecraft.custom:minecraft.mob_kills
scoreboard objectives add rwd_tot_kills dummy
scoreboard objectives add rwd_v2 dummy
scoreboard objectives add rwd_kill_stage dummy
scoreboard objectives add rwd_damage minecraft.custom:minecraft.damage_taken
scoreboard objectives add rwd_dmg_stage dummy
scoreboard objectives add rwd_dirt dummy
scoreboard objectives add rwd_dirt_stage dummy
scoreboard objectives remove rwd_shear
scoreboard objectives add rwd_enchanting minecraft.used:minecraft.shears
scoreboard objectives add rwd_shear_stage dummy
scoreboard objectives add rwd_milk minecraft.used:minecraft.bucket
scoreboard objectives add rwd_milk_stage dummy
scoreboard objectives add rwd_egg minecraft.used:minecraft.egg
scoreboard objectives add rwd_egg_stage dummy
scoreboard objectives add rwd_bread minecraft.crafted:minecraft.bread
scoreboard objectives add rwd_bread_stage dummy
scoreboard objectives add rwd_enchant minecraft.custom:minecraft.enchant_item

# Enchanting counters (mod-based, unlimited)
scoreboard objectives add rwd_enc_m10 dummy
scoreboard objectives add rwd_enc_m50 dummy
scoreboard objectives add rwd_enc_m100 dummy
scoreboard objectives add rwd_enc_delta dummy

# Weapon kill tracking (window-based detection)
scoreboard objectives add rwd_pkills minecraft.custom:minecraft.player_kills
scoreboard objectives add rwd_mace minecraft.used:minecraft.mace
scoreboard objectives add rwd_spear_used dummy
scoreboard objectives add rwd_spear_ul dummy
scoreboard objectives add rwd_spear_win dummy
scoreboard objectives add rwd_spear_kills dummy
scoreboard objectives add rwd_spear_stage dummy
scoreboard objectives add rwd_mace_ul dummy
scoreboard objectives add rwd_mace_win dummy
scoreboard objectives add rwd_mace_kills dummy
scoreboard objectives add rwd_mace_stage dummy
scoreboard objectives add rwd_all_kills dummy
scoreboard objectives add rwd_kill_snap dummy
scoreboard objectives add rwd_kills_delay dummy

# Previous-tick snapshots for change detection
scoreboard objectives add rwd_log_last dummy
scoreboard objectives add rwd_ore_last dummy
scoreboard objectives add rwd_kill_last dummy
scoreboard objectives add rwd_dmg_last dummy
scoreboard objectives add rwd_dirt_last dummy
scoreboard objectives add rwd_shear_last dummy
scoreboard objectives add rwd_milk_last dummy
scoreboard objectives add rwd_egg_last dummy
scoreboard objectives add rwd_bread_last dummy
scoreboard objectives add rwd_enchant_last dummy
scoreboard objectives add rwd_spear_kl dummy
scoreboard objectives add rwd_mace_kl dummy

# Leaderboard trigger objectives (players use /trigger lb_<metric>)
scoreboard objectives add lb_kills trigger
scoreboard objectives add lb_spear trigger
scoreboard objectives add lb_mace trigger
scoreboard objectives add lb_logs trigger
scoreboard objectives add lb_ores trigger
scoreboard objectives add lb_damage trigger
scoreboard objectives add lb_dirt trigger
scoreboard objectives add lb_enchant trigger
scoreboard objectives add lb_milk trigger
scoreboard objectives add lb_eggs trigger
scoreboard objectives add lb_bread trigger
scoreboard objectives add lb_off trigger
scoreboard objectives add lb_help trigger

# Set sidebar display names
scoreboard objectives modify rwd_tot_kills displayname [{"text": "Mob Kills", "color": "red", "bold": true}]
scoreboard objectives modify rwd_spear_kills displayname [{"text": "Spear Kills", "color": "gold", "bold": true}]
scoreboard objectives modify rwd_mace_kills displayname [{"text": "Mace Kills", "color": "yellow", "bold": true}]
scoreboard objectives modify rwd_logs displayname [{"text": "Logs Chopped", "color": "green", "bold": true}]
scoreboard objectives modify rwd_ores displayname [{"text": "Ores Mined", "color": "aqua", "bold": true}]
scoreboard objectives modify rwd_damage displayname [{"text": "Damage Dealt", "color": "light_purple", "bold": true}]
scoreboard objectives modify rwd_dirt displayname [{"text": "Dirt Moved", "color": "dark_green", "bold": true}]
scoreboard objectives modify rwd_enchant displayname [{"text": "Enchants", "color": "light_purple", "bold": true}]
scoreboard objectives modify rwd_milk displayname [{"text": "Milk Collected", "color": "white", "bold": true}]
scoreboard objectives modify rwd_egg displayname [{"text": "Eggs Collected", "color": "yellow", "bold": true}]
scoreboard objectives modify rwd_bread displayname [{"text": "Bread Baked", "color": "gold", "bold": true}]

# Initialisation flag
scoreboard objectives add rwd_init dummy

# Initialise any currently-online players
execute as @a unless score @s rwd_init matches 1.. run function rewards:player_init

# Tick counter on a fake player
scoreboard objectives add rwd_tick dummy
scoreboard players set .tick rwd_tick 0

tellraw @a {"text":""}
tellraw @a [{"text":"        ✦ ","color":"dark_gray"},{"text":"R E W A R D S","color":"gold","bold":true},{"text":" ✦","color":"dark_gray"}]
tellraw @a [{"text":"  ","color":"dark_gray"},{"text":"Chop logs ","color":"green"},{"text":"› ","color":"dark_gray"},{"text":"Mine ores ","color":"aqua"},{"text":"› ","color":"dark_gray"},{"text":"Kill mobs ","color":"red"},{"text":"› ","color":"dark_gray"},{"text":"Take damage ","color":"light_purple"},{"text":"› ","color":"dark_gray"},{"text":"Dig dirt ","color":"yellow"},{"text":"› ","color":"dark_gray"},{"text":"Shear sheep ","color":"white"},{"text":"› ","color":"dark_gray"},{"text":"Milk cows ","color":"dark_green"},{"text":"› ","color":"dark_gray"},{"text":"Throw eggs ","color":"dark_red"},{"text":"› ","color":"dark_gray"},{"text":"Bake bread ","color":"gold"},{"text":"› ","color":"dark_gray"},{"text":"Spear kills ","color":"dark_aqua"},{"text":"› ","color":"dark_gray"},{"text":"Mace kills ","color":"dark_purple"},{"text":"› ","color":"dark_gray"},{"text":"Enchant","color":"light_purple"}]
tellraw @a [{"text":"  ","color":"dark_gray"},{"text":"Earn better tools & armour as you play.","color":"gray","italic":true}]
tellraw @a {"text":""}
scoreboard objectives setdisplay sidebar rwd_tot_kills
