give @s minecraft:shears[enchantments={efficiency:4, unbreaking:3}]
scoreboard players set @s rwd_shear_stage 17
title @s subtitle {"text":"⭐ Shear Sheep — Level 17  |  Shears (Efficiency IV, Unbreaking III)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Shears (Efficiency IV, Unbreaking III)","color":"aqua","bold":true}]