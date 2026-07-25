give @s minecraft:mace[enchantments={breach:1}]
scoreboard players set @s rwd_mace_stage 7
title @s subtitle {"text":"⭐ Mace Kills — Level 7  |  Mace (Breach I)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Mace (Breach I)","color":"aqua","bold":true}]