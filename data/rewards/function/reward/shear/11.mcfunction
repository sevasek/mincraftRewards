give @s minecraft:shears[enchantments={efficiency:3}]
scoreboard players set @s rwd_shear_stage 11
title @s subtitle {"text":"⭐ Shear Sheep — Level 11  |  Shears (Efficiency III)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Shears (Efficiency III)","color":"aqua","bold":true}]