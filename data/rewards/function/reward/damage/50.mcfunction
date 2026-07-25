give @s minecraft:netherite_helmet[enchantments={protection:3, unbreaking:2}]
scoreboard players set @s rwd_dmg_stage 50
title @s subtitle {"text":"⭐ Damage Taken — Level 50  |  Netherite Helmet (Protection III, Unbreaking II)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Netherite Helmet (Protection III, Unbreaking II)","color":"aqua","bold":true}]