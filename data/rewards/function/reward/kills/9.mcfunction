give @s minecraft:diamond_sword[enchantments={sharpness:2}]
scoreboard players set @s rwd_kill_stage 9
title @s subtitle {"text":"⭐ Mob Kills — Level 9  |  Diamond Sword (Sharpness II)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Diamond Sword (Sharpness II)","color":"aqua","bold":true}]