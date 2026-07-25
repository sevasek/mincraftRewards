give @s minecraft:shears[enchantments={efficiency:1, unbreaking:3}]
scoreboard players set @s rwd_shear_stage 14
title @s subtitle {"text":"⭐ Shear Sheep — Level 14  |  Shears (Efficiency I, Unbreaking III)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Shears (Efficiency I, Unbreaking III)","color":"aqua","bold":true}]