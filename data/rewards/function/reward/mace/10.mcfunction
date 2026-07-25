give @s minecraft:mace[enchantments={breach:4}]
scoreboard players set @s rwd_mace_stage 10
title @s subtitle {"text":"⭐ Mace Kills — Level 10  |  Mace (Breach IV)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Mace (Breach IV)","color":"aqua","bold":true}]