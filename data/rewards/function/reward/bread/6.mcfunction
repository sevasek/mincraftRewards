give @s minecraft:cooked_mutton 8
scoreboard players set @s rwd_bread_stage 6
title @s subtitle {"text":"⭐ Bake Bread — Level 6  |  Cooked Mutton x8","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Cooked Mutton x8","color":"aqua","bold":true}]