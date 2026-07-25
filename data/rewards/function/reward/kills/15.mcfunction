give @s minecraft:diamond_sword[enchantments={sharpness:5, knockback:1, looting:1}]
scoreboard players set @s rwd_kill_stage 15
title @s subtitle {"text":"⭐ Mob Kills — Level 15  |  Diamond Sword (Sharpness V, Knockback I, Looting I)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Diamond Sword (Sharpness V, Knockback I, Looting I)","color":"aqua","bold":true}]