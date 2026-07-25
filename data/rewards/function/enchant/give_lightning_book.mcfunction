give @s minecraft:enchanted_book[stored_enchantments={rewards:lightning:1}]
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Lightning Book","color":"aqua","bold":true}]
scoreboard players remove @s rwd_enc_m100 100
execute if score @s rwd_enc_m100 matches 100.. run function rewards:enchant/give_lightning_book