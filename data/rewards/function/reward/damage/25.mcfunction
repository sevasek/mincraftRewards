give @s minecraft:iron_boots[enchantments={protection:1}]
scoreboard players set @s rwd_dmg_stage 25
title @s subtitle {"text":"⭐ Damage Taken — Level 25  |  Iron Boots (Protection I)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Iron Boots (Protection I)","color":"aqua","bold":true}]