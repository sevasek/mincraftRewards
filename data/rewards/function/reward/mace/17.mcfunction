give @s minecraft:mace[enchantments={density:5, breach:4, wind_burst:2}]
scoreboard players set @s rwd_mace_stage 17
title @s subtitle {"text":"⭐ Mace Kills — Level 17  |  Mace (Density V, Breach IV, Wind Burst II)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Mace (Density V, Breach IV, Wind Burst II)","color":"aqua","bold":true}]