give @s minecraft:wooden_sword
scoreboard players set @s rwd_kill_stage 1
title @s subtitle {"text":"⭐ Mob Kills — Level 1  |  Wooden Sword","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Wooden Sword","color":"aqua","bold":true}]