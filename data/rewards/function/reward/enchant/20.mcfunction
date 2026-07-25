give @s minecraft:enchanted_book[stored_enchantments={mending:1}] 2
scoreboard players set @s rwd_ench_stage 20
title @s subtitle {"text":"⭐ Enchanting — Level 20  |  Mending Book x2","color":"gold"}
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Mending Book x2","color":"aqua","bold":true}]