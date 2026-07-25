give @s minecraft:netherite_sword[enchantments={sharpness:5, fire_aspect:2, knockback:1, looting:1}]
scoreboard players set @s rwd_kill_stage 16
title @s subtitle {"text":"⭐ Mob Kills — Level 16  |  Netherite Sword (Sharpness V, Fire Aspect II, Knockback I, Looting I)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Netherite Sword (Sharpness V, Fire Aspect II, Knockback I, Looting I)","color":"aqua","bold":true}]