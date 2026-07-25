give @s minecraft:mace[enchantments={density:4}]
scoreboard players set @s rwd_mace_stage 5
title @s subtitle {"text":"⭐ Mace Kills — Level 5  |  Mace (Density IV)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Mace (Density IV)","color":"aqua","bold":true}]