give @s minecraft:diamond_shovel[enchantments={efficiency:5}]
scoreboard players set @s rwd_dirt_stage 15
title @s subtitle {"text":"⭐ Dig Dirt — Level 15  |  Diamond Shovel (Efficiency V)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Diamond Shovel (Efficiency V)","color":"aqua","bold":true}]