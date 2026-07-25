give @s minecraft:netherite_spear[enchantments={sharpness:5, unbreaking:3, looting:3}]
scoreboard players set @s rwd_spear_stage 18
title @s subtitle {"text":"⭐ Spear Kills — Level 18  |  Netherite Spear (Sharpness V, Unbreaking III, Looting III)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Netherite Spear (Sharpness V, Unbreaking III, Looting III)","color":"aqua","bold":true}]