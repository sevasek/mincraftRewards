give @s minecraft:mace[enchantments={density:3, breach:3}]
scoreboard players set @s rwd_mace_stage 13
title @s subtitle {"text":"⭐ Mace Kills — Level 13  |  Mace (Density III, Breach III)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Mace (Density III, Breach III)","color":"aqua","bold":true}]