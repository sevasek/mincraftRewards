give @s minecraft:bread 16
scoreboard players set @s rwd_bread_stage 2
title @s subtitle {"text":"⭐ Bake Bread — Level 2  |  Bread x16","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Bread x16","color":"aqua","bold":true}]