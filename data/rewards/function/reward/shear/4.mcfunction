give @s minecraft:shears[enchantments={unbreaking:3}]
scoreboard players set @s rwd_shear_stage 4
title @s subtitle {"text":"⭐ Shear Sheep — Level 4  |  Shears (Unbreaking III)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Shears (Unbreaking III)","color":"aqua","bold":true}]