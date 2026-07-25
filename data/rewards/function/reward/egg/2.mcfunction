give @s minecraft:egg 32
scoreboard players set @s rwd_egg_stage 2
title @s subtitle {"text":"⭐ Throw Eggs — Level 2  |  Egg x32","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Egg x32","color":"aqua","bold":true}]