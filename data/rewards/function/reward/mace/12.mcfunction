give @s minecraft:mace[enchantments={density:2, breach:2}]
scoreboard players set @s rwd_mace_stage 12
title @s subtitle {"text":"⭐ Mace Kills — Level 12  |  Mace (Density II, Breach II)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Mace (Density II, Breach II)","color":"aqua","bold":true}]