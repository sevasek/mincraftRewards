give @s minecraft:experience_bottle 30
scoreboard players set @s rwd_ench_stage 14
title @s subtitle {"text":"⭐ Enchanting — Level 14  |  Experience Bottle x30","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Experience Bottle x30","color":"aqua","bold":true}]