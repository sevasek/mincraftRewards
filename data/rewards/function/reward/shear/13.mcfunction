give @s minecraft:shears[enchantments={efficiency:5}]
scoreboard players set @s rwd_shear_stage 13
title @s subtitle {"text":"⭐ Shear Sheep — Level 13  |  Shears (Efficiency V)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Shears (Efficiency V)","color":"aqua","bold":true}]