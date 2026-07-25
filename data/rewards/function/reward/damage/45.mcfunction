give @s minecraft:diamond_boots[enchantments={protection:3, unbreaking:2}]
scoreboard players set @s rwd_dmg_stage 45
title @s subtitle {"text":"⭐ Damage Taken — Level 45  |  Diamond Boots (Protection III, Unbreaking II)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Diamond Boots (Protection III, Unbreaking II)","color":"aqua","bold":true}]