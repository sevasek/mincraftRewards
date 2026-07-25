give @s minecraft:experience_bottle 15
scoreboard players set @s rwd_ench_stage 7
title @s subtitle {"text":"⭐ Enchanting — Level 7  |  Experience Bottle x15","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Experience Bottle x15","color":"aqua","bold":true}]