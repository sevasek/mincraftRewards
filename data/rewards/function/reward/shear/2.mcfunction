give @s minecraft:shears[enchantments={unbreaking:1}]
scoreboard players set @s rwd_shear_stage 2
title @s subtitle {"text":"⭐ Shear Sheep — Level 2  |  Shears (Unbreaking I)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Shears (Unbreaking I)","color":"aqua","bold":true}]