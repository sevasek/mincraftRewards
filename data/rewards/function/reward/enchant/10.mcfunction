give @s minecraft:experience_bottle 21
scoreboard players set @s rwd_ench_stage 10
title @s subtitle {"text":"⭐ Enchanting — Level 10  |  Experience Bottle x21","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Experience Bottle x21","color":"aqua","bold":true}]