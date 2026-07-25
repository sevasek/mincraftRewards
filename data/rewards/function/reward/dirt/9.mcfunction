give @s minecraft:diamond_shovel[enchantments={efficiency:2}]
scoreboard players set @s rwd_dirt_stage 9
title @s subtitle {"text":"⭐ Dig Dirt — Level 9  |  Diamond Shovel (Efficiency II)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Diamond Shovel (Efficiency II)","color":"aqua","bold":true}]