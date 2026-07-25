give @s minecraft:mace[enchantments={density:1, breach:1}]
scoreboard players set @s rwd_mace_stage 11
title @s subtitle {"text":"⭐ Mace Kills — Level 11  |  Mace (Density I, Breach I)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Mace (Density I, Breach I)","color":"aqua","bold":true}]