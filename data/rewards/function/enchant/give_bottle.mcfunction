give @s minecraft:experience_bottle
title @s actionbar [{"text":"Enchanting ✦  ","color":"light_purple","bold":true},{"score":{"name":"@s","objective":"rwd_enchant"},"color":"white"},{"text":" enchants","color":"gray"}]
scoreboard players remove @s rwd_enc_delta 1
scoreboard players add @s rwd_enc_m10 1
scoreboard players add @s rwd_enc_m50 1
scoreboard players add @s rwd_enc_m100 1
execute if score @s rwd_enc_m10 matches 10.. run function rewards:enchant/give_book
execute if score @s rwd_enc_m50 matches 50.. run function rewards:enchant/give_anvil
execute if score @s rwd_enc_m100 matches 100.. run function rewards:enchant/give_lightning_book
execute if score @s rwd_enc_delta matches 1.. run function rewards:enchant/give_bottle