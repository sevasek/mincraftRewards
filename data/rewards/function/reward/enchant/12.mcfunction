give @s minecraft:enchanted_book[stored_enchantments={mending:1}]
scoreboard players set @s rwd_ench_stage 12
title @s subtitle {"text":"⭐ Enchanting — Level 12  |  Mending Book","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Mending Book","color":"aqua","bold":true}]