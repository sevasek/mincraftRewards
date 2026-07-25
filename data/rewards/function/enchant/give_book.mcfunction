give @s minecraft:enchanted_book[stored_enchantments={mending:1}]
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Mending Book","color":"aqua","bold":true}]
scoreboard players remove @s rwd_enc_m10 10
execute if score @s rwd_enc_m10 matches 10.. run function rewards:enchant/give_book