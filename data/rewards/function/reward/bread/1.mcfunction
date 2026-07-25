give @s minecraft:bread 8
scoreboard players set @s rwd_bread_stage 1
title @s subtitle {"text":"⭐ Bake Bread — Level 1  |  Bread x8","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Bread x8","color":"aqua","bold":true}]