give @s minecraft:iron_sword
scoreboard players set @s rwd_kill_stage 3
title @s subtitle {"text":"⭐ Mob Kills — Level 3  |  Iron Sword","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Iron Sword","color":"aqua","bold":true}]