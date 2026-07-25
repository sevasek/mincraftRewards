give @s minecraft:shears[enchantments={efficiency:4}]
scoreboard players set @s rwd_shear_stage 12
title @s subtitle {"text":"⭐ Shear Sheep — Level 12  |  Shears (Efficiency IV)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Shears (Efficiency IV)","color":"aqua","bold":true}]