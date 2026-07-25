give @s minecraft:mace[enchantments={density:1}]
scoreboard players set @s rwd_mace_stage 2
title @s subtitle {"text":"⭐ Mace Kills — Level 2  |  Mace (Density I)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Mace (Density I)","color":"aqua","bold":true}]