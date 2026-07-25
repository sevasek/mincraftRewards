give @s minecraft:diamond_chestplate[enchantments={protection:2, unbreaking:1}]
scoreboard players set @s rwd_dmg_stage 40
title @s subtitle {"text":"⭐ Damage Taken — Level 40  |  Diamond Chestplate (Protection II, Unbreaking I)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Diamond Chestplate (Protection II, Unbreaking I)","color":"aqua","bold":true}]