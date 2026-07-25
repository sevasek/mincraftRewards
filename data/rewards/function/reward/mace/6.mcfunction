give @s minecraft:mace[enchantments={density:5}]
scoreboard players set @s rwd_mace_stage 6
title @s subtitle {"text":"⭐ Mace Kills — Level 6  |  Mace (Density V)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Mace (Density V)","color":"aqua","bold":true}]