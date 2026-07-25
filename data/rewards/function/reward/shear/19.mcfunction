give @s minecraft:shears[enchantments={efficiency:5, unbreaking:3, mending:1}]
scoreboard players set @s rwd_shear_stage 19
title @s subtitle {"text":"⭐ Shear Sheep — Level 19  |  Shears (Efficiency V, Unbreaking III, Mending I)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Shears (Efficiency V, Unbreaking III, Mending I)","color":"aqua","bold":true}]