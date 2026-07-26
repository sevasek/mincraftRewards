execute as @a run function rewards:player_init
execute as @a run function rewards:weapon_kill_detect
execute as @a run function rewards:enchant_check
scoreboard players add .tick rwd_tick 1
execute if score .tick rwd_tick matches 20.. run scoreboard players set .tick rwd_tick 0
execute if score .tick rwd_tick matches 0 run execute as @a[scores={rwd_log_stage=..19}] at @s run function rewards:update/logs
execute if score .tick rwd_tick matches 0 run execute as @a[scores={rwd_ore_stage=..19}] at @s run function rewards:update/ores
execute if score .tick rwd_tick matches 0 run execute as @a[scores={rwd_dirt_stage=..19}] at @s run function rewards:update/dirt
execute if score .tick rwd_tick matches 0 run execute as @a[scores={rwd_kill_stage=..19}] run function rewards:update/kills
execute if score .tick rwd_tick matches 0 run execute as @a[scores={rwd_dmg_stage=..79}] run function rewards:update/damage
execute if score .tick rwd_tick matches 0 run execute as @a[scores={rwd_shear_stage=..19}] run function rewards:update/shear
execute if score .tick rwd_tick matches 0 run execute as @a[scores={rwd_milk_stage=..19}] run function rewards:update/milk
execute if score .tick rwd_tick matches 0 run execute as @a[scores={rwd_egg_stage=..19}] run function rewards:update/egg
execute if score .tick rwd_tick matches 0 run execute as @a[scores={rwd_bread_stage=..19}] run function rewards:update/bread
execute if score .tick rwd_tick matches 0 run execute as @a[scores={rwd_log_stage=..19}] run function rewards:check/logs
execute if score .tick rwd_tick matches 0 run execute as @a[scores={rwd_ore_stage=..19}] run function rewards:check/ores
execute if score .tick rwd_tick matches 0 run execute as @a[scores={rwd_kill_stage=..19}] run function rewards:check/kills
execute if score .tick rwd_tick matches 0 run execute as @a[scores={rwd_dmg_stage=..79}] run function rewards:check/damage
execute if score .tick rwd_tick matches 0 run execute as @a[scores={rwd_dirt_stage=..19}] run function rewards:check/dirt
execute if score .tick rwd_tick matches 0 run execute as @a[scores={rwd_shear_stage=..19}] run function rewards:check/shear
execute if score .tick rwd_tick matches 0 run execute as @a[scores={rwd_milk_stage=..19}] run function rewards:check/milk
execute if score .tick rwd_tick matches 0 run execute as @a[scores={rwd_egg_stage=..19}] run function rewards:check/egg
execute if score .tick rwd_tick matches 0 run execute as @a[scores={rwd_bread_stage=..19}] run function rewards:check/bread
execute if score .tick rwd_tick matches 0 run execute as @a[scores={rwd_spear_stage=..20}] run function rewards:check/spear
execute if score .tick rwd_tick matches 0 run execute as @a[scores={rwd_mace_stage=..19}] run function rewards:check/mace
execute if score .tick rwd_tick matches 0 run function rewards:lb/tick
