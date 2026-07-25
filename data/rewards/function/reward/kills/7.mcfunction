give @s minecraft:diamond_sword[enchantments={sharpness:1}]
scoreboard players set @s rwd_kill_stage 7
title @s subtitle {"text":"⭐ Mob Kills — Level 7  |  Diamond Sword (Sharpness I)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Diamond Sword (Sharpness I)","color":"aqua","bold":true}]