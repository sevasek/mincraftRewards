give @s minecraft:shears
scoreboard players set @s rwd_shear_stage 1
title @s subtitle {"text":"⭐ Shear Sheep — Level 1  |  Shears","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Shears","color":"aqua","bold":true}]