give @s minecraft:diamond_chestplate[enchantments={protection:1}]
scoreboard players set @s rwd_dmg_stage 32
title @s subtitle {"text":"⭐ Damage Taken — Level 32  |  Diamond Chestplate (Protection I)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Diamond Chestplate (Protection I)","color":"aqua","bold":true}]