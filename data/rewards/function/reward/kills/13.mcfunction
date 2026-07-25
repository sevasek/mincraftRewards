give @s minecraft:diamond_sword[enchantments={sharpness:4, knockback:1}]
scoreboard players set @s rwd_kill_stage 13
title @s subtitle {"text":"⭐ Mob Kills — Level 13  |  Diamond Sword (Sharpness IV, Knockback I)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Diamond Sword (Sharpness IV, Knockback I)","color":"aqua","bold":true}]