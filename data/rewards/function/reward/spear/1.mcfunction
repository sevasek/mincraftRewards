give @s minecraft:wooden_spear
scoreboard players set @s rwd_spear_stage 1
title @s subtitle {"text":"⭐ Spear Kills — Level 1  |  Wooden Spear","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Wooden Spear","color":"aqua","bold":true}]