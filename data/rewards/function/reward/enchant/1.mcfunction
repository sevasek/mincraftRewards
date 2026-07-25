give @s minecraft:experience_bottle 3
scoreboard players set @s rwd_ench_stage 1
title @s subtitle {"text":"⭐ Enchanting — Level 1  |  Experience Bottle x3","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Experience Bottle x3","color":"aqua","bold":true}]