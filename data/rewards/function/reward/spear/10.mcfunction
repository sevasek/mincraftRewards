give @s minecraft:netherite_spear[enchantments={sharpness:2}]
scoreboard players set @s rwd_spear_stage 10
title @s subtitle {"text":"⭐ Spear Kills — Level 10  |  Netherite Spear (Sharpness II)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Netherite Spear (Sharpness II)","color":"aqua","bold":true}]