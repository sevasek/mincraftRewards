give @s minecraft:mace[enchantments={density:3}]
scoreboard players set @s rwd_mace_stage 4
title @s subtitle {"text":"⭐ Mace Kills — Level 4  |  Mace (Density III)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Mace (Density III)","color":"aqua","bold":true}]