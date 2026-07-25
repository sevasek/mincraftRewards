give @s minecraft:netherite_sword[enchantments={sharpness:2, fire_aspect:1}]
scoreboard players set @s rwd_kill_stage 10
title @s subtitle {"text":"⭐ Mob Kills — Level 10  |  Netherite Sword (Sharpness II, Fire Aspect I)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Netherite Sword (Sharpness II, Fire Aspect I)","color":"aqua","bold":true}]