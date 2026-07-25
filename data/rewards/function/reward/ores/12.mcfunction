give @s minecraft:netherite_pickaxe[enchantments={fortune:3}]
scoreboard players set @s rwd_ore_stage 12
title @s subtitle {"text":"⭐ Mine Ores — Level 12  |  Netherite Pickaxe (Fortune III)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Netherite Pickaxe (Fortune III)","color":"aqua","bold":true}]