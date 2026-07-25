give @s minecraft:diamond_spear[enchantments={sharpness:2}]
scoreboard players set @s rwd_spear_stage 9
title @s subtitle {"text":"⭐ Spear Kills — Level 9  |  Diamond Spear (Sharpness II)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Diamond Spear (Sharpness II)","color":"aqua","bold":true}]