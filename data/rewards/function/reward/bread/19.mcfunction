give @s minecraft:golden_apple 4
scoreboard players set @s rwd_bread_stage 19
title @s subtitle {"text":"⭐ Bake Bread — Level 19  |  Golden Apple x4","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Golden Apple x4","color":"aqua","bold":true}]