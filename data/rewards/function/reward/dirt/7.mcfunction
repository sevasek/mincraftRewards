give @s minecraft:diamond_shovel[enchantments={efficiency:1}]
scoreboard players set @s rwd_dirt_stage 7
title @s subtitle {"text":"⭐ Dig Dirt — Level 7  |  Diamond Shovel (Efficiency I)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Diamond Shovel (Efficiency I)","color":"aqua","bold":true}]