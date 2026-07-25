give @s minecraft:diamond_helmet[enchantments={protection:1}]
scoreboard players set @s rwd_dmg_stage 30
title @s subtitle {"text":"⭐ Damage Taken — Level 30  |  Diamond Helmet (Protection I)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Diamond Helmet (Protection I)","color":"aqua","bold":true}]