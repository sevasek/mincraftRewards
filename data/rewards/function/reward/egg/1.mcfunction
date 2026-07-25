give @s minecraft:egg 16
scoreboard players set @s rwd_egg_stage 1
title @s subtitle {"text":"⭐ Throw Eggs — Level 1  |  Egg x16","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Egg x16","color":"aqua","bold":true}]