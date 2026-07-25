give @s minecraft:netherite_spear[enchantments={sharpness:5, unbreaking:3, looting:3, mending:1}]
scoreboard players set @s rwd_spear_stage 19
title @s subtitle {"text":"⭐ Spear Kills — Level 19  |  Netherite Spear (Sharpness V, Unbreaking III, Looting III, Mending I)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Netherite Spear (Sharpness V, Unbreaking III, Looting III, Mending I)","color":"aqua","bold":true}]