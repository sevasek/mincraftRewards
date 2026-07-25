give @s minecraft:mace[enchantments={density:5, breach:4}]
scoreboard players set @s rwd_mace_stage 15
title @s subtitle {"text":"⭐ Mace Kills — Level 15  |  Mace (Density V, Breach IV)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Mace (Density V, Breach IV)","color":"aqua","bold":true}]