give @s minecraft:baked_potato 8
scoreboard players set @s rwd_bread_stage 9
title @s subtitle {"text":"⭐ Bake Bread — Level 9  |  Baked Potato x8","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Baked Potato x8","color":"aqua","bold":true}]