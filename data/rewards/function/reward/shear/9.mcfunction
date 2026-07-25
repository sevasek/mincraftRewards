give @s minecraft:shears[enchantments={efficiency:1}]
scoreboard players set @s rwd_shear_stage 9
title @s subtitle {"text":"⭐ Shear Sheep — Level 9  |  Shears (Efficiency I)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Shears (Efficiency I)","color":"aqua","bold":true}]