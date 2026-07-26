give @s minecraft:netherite_spear[enchantments={sharpness:5, unbreaking:3, looting:3, mending:1, "rewards:lightning":1, "rewards:lunge":3}]
scoreboard players set @s rwd_spear_stage 21
title @s subtitle {"text":"⭐ Spear Kills — Level 21  |  Netherite Spear (Sharpness V, Unbreaking III, Looting III, Mending I, Lightning I, Lunge III)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Netherite Spear (Sharpness V, Unbreaking III, Looting III, Mending I, Lightning I, Lunge III)","color":"aqua","bold":true}]