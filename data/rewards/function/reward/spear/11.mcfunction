give @s minecraft:diamond_spear[enchantments={sharpness:3}]
scoreboard players set @s rwd_spear_stage 11
title @s subtitle {"text":"⭐ Spear Kills — Level 11  |  Diamond Spear (Sharpness III)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Diamond Spear (Sharpness III)","color":"aqua","bold":true}]