give @s minecraft:shears[enchantments={mending:1}]
scoreboard players set @s rwd_shear_stage 5
title @s subtitle {"text":"⭐ Shear Sheep — Level 5  |  Shears (Mending I)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Shears (Mending I)","color":"aqua","bold":true}]