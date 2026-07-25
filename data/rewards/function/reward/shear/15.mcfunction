give @s minecraft:shears[enchantments={efficiency:2, unbreaking:3}]
scoreboard players set @s rwd_shear_stage 15
title @s subtitle {"text":"⭐ Shear Sheep — Level 15  |  Shears (Efficiency II, Unbreaking III)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Shears (Efficiency II, Unbreaking III)","color":"aqua","bold":true}]