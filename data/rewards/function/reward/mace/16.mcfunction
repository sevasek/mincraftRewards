give @s minecraft:mace[enchantments={density:5, breach:4, wind_burst:1}]
scoreboard players set @s rwd_mace_stage 16
title @s subtitle {"text":"⭐ Mace Kills — Level 16  |  Mace (Density V, Breach IV, Wind Burst I)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Mace (Density V, Breach IV, Wind Burst I)","color":"aqua","bold":true}]