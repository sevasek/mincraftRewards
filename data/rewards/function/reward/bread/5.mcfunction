give @s minecraft:cooked_chicken 8
scoreboard players set @s rwd_bread_stage 5
title @s subtitle {"text":"⭐ Bake Bread — Level 5  |  Cooked Chicken x8","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Cooked Chicken x8","color":"aqua","bold":true}]