give @s minecraft:mace[enchantments={density:4, breach:4}]
scoreboard players set @s rwd_mace_stage 14
title @s subtitle {"text":"⭐ Mace Kills — Level 14  |  Mace (Density IV, Breach IV)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Mace (Density IV, Breach IV)","color":"aqua","bold":true}]