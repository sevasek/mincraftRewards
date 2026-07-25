give @s minecraft:shears[enchantments={unbreaking:1, mending:1}]
scoreboard players set @s rwd_shear_stage 6
title @s subtitle {"text":"⭐ Shear Sheep — Level 6  |  Shears (Unbreaking I, Mending I)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Shears (Unbreaking I, Mending I)","color":"aqua","bold":true}]