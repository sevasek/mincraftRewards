give @s minecraft:diamond_chestplate[enchantments={protection:3, unbreaking:2}]
scoreboard players set @s rwd_dmg_stage 48
title @s subtitle {"text":"⭐ Damage Taken — Level 48  |  Diamond Chestplate (Protection III, Unbreaking II)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Diamond Chestplate (Protection III, Unbreaking II)","color":"aqua","bold":true}]