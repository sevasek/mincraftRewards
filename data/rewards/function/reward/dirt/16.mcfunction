give @s minecraft:diamond_shovel[enchantments={efficiency:5, unbreaking:3}]
scoreboard players set @s rwd_dirt_stage 16
title @s subtitle {"text":"⭐ Dig Dirt — Level 16  |  Diamond Shovel (Efficiency V, Unbreaking III)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Diamond Shovel (Efficiency V, Unbreaking III)","color":"aqua","bold":true}]