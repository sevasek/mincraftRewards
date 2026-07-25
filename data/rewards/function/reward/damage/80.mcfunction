give @s minecraft:netherite_chestplate[enchantments={protection:4, unbreaking:3, thorns:3, mending:1}]
scoreboard players set @s rwd_dmg_stage 80
title @s subtitle {"text":"⭐ Damage Taken — Level 80  |  Netherite Chestplate (Protection IV, Unbreaking III, Thorns III, Mending I)","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Netherite Chestplate (Protection IV, Unbreaking III, Thorns III, Mending I)","color":"aqua","bold":true}]