give @s minecraft:experience_bottle 9
scoreboard players set @s rwd_ench_stage 4
title @s subtitle {"text":"⭐ Enchanting — Level 4  |  Experience Bottle x9","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Experience Bottle x9","color":"aqua","bold":true}]