give @s minecraft:iron_spear
scoreboard players set @s rwd_spear_stage 3
title @s subtitle {"text":"⭐ Spear Kills — Level 3  |  Iron Spear","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Iron Spear","color":"aqua","bold":true}]