give @s minecraft:shears[enchantments={efficiency:5, unbreaking:3}]
scoreboard players set @s rwd_shear_stage 18
title @s subtitle {"text":"⭐ Shear Sheep — Level 18  |  Shears (Efficiency V, Unbreaking III)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Shears (Efficiency V, Unbreaking III)","color":"aqua","bold":true}]