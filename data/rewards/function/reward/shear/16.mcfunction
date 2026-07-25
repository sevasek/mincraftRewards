give @s minecraft:shears[enchantments={efficiency:3, unbreaking:3}]
scoreboard players set @s rwd_shear_stage 16
title @s subtitle {"text":"⭐ Shear Sheep — Level 16  |  Shears (Efficiency III, Unbreaking III)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Shears (Efficiency III, Unbreaking III)","color":"aqua","bold":true}]