give @s minecraft:netherite_pickaxe[enchantments={fortune:3, efficiency:5, unbreaking:1}]
scoreboard players set @s rwd_ore_stage 18
title @s subtitle {"text":"⭐ Mine Ores — Level 18  |  Netherite Pickaxe (Fortune III, Efficiency V, Unbreaking I)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Netherite Pickaxe (Fortune III, Efficiency V, Unbreaking I)","color":"aqua","bold":true}]