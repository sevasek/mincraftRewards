give @s minecraft:shears[enchantments={efficiency:2}]
scoreboard players set @s rwd_shear_stage 10
title @s subtitle {"text":"⭐ Shear Sheep — Level 10  |  Shears (Efficiency II)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Shears (Efficiency II)","color":"aqua","bold":true}]