give @s minecraft:pumpkin_pie 4
scoreboard players set @s rwd_bread_stage 10
title @s subtitle {"text":"⭐ Bake Bread — Level 10  |  Pumpkin Pie x4","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Pumpkin Pie x4","color":"aqua","bold":true}]