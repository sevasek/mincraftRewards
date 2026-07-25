give @s minecraft:cooked_beef 8
scoreboard players set @s rwd_bread_stage 3
title @s subtitle {"text":"⭐ Bake Bread — Level 3  |  Cooked Beef x8","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Cooked Beef x8","color":"aqua","bold":true}]