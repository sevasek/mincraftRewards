give @s minecraft:diamond_spear[enchantments={sharpness:5}]
scoreboard players set @s rwd_spear_stage 15
title @s subtitle {"text":"⭐ Spear Kills — Level 15  |  Diamond Spear (Sharpness V)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Diamond Spear (Sharpness V)","color":"aqua","bold":true}]