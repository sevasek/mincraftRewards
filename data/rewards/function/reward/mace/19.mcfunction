give @s minecraft:mace[enchantments={density:5, breach:4, wind_burst:3, unbreaking:3}]
scoreboard players set @s rwd_mace_stage 19
title @s subtitle {"text":"⭐ Mace Kills — Level 19  |  Mace (Density V, Breach IV, Wind Burst III, Unbreaking III)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Mace (Density V, Breach IV, Wind Burst III, Unbreaking III)","color":"aqua","bold":true}]