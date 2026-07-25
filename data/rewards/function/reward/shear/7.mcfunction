give @s minecraft:shears[enchantments={unbreaking:2, mending:1}]
scoreboard players set @s rwd_shear_stage 7
title @s subtitle {"text":"⭐ Shear Sheep — Level 7  |  Shears (Unbreaking II, Mending I)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Shears (Unbreaking II, Mending I)","color":"aqua","bold":true}]