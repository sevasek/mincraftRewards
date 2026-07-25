give @s minecraft:shears[enchantments={unbreaking:2}]
scoreboard players set @s rwd_shear_stage 3
title @s subtitle {"text":"⭐ Shear Sheep — Level 3  |  Shears (Unbreaking II)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Shears (Unbreaking II)","color":"aqua","bold":true}]