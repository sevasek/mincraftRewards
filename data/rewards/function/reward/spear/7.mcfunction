give @s minecraft:diamond_spear[enchantments={sharpness:1}]
scoreboard players set @s rwd_spear_stage 7
title @s subtitle {"text":"⭐ Spear Kills — Level 7  |  Diamond Spear (Sharpness I)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Diamond Spear (Sharpness I)","color":"aqua","bold":true}]