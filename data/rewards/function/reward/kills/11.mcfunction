give @s minecraft:diamond_sword[enchantments={sharpness:3}]
scoreboard players set @s rwd_kill_stage 11
title @s subtitle {"text":"⭐ Mob Kills — Level 11  |  Diamond Sword (Sharpness III)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Diamond Sword (Sharpness III)","color":"aqua","bold":true}]