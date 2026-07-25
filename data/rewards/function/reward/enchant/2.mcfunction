give @s minecraft:experience_bottle 6
scoreboard players set @s rwd_ench_stage 2
title @s subtitle {"text":"⭐ Enchanting — Level 2  |  Experience Bottle x6","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Experience Bottle x6","color":"aqua","bold":true}]