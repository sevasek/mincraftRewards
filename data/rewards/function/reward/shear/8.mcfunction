give @s minecraft:shears[enchantments={unbreaking:3, mending:1}]
scoreboard players set @s rwd_shear_stage 8
title @s subtitle {"text":"⭐ Shear Sheep — Level 8  |  Shears (Unbreaking III, Mending I)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Shears (Unbreaking III, Mending I)","color":"aqua","bold":true}]