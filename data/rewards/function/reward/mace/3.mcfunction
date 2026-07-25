give @s minecraft:mace[enchantments={density:2}]
scoreboard players set @s rwd_mace_stage 3
title @s subtitle {"text":"⭐ Mace Kills — Level 3  |  Mace (Density II)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Mace (Density II)","color":"aqua","bold":true}]