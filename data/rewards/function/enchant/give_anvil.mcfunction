give @s minecraft:anvil
tellraw @s [{"text":"[Rewards] ","color":"gold","bold":true},{"text":"You received: ","color":"gray"},{"text":"Anvil","color":"aqua","bold":true}]
scoreboard players remove @s rwd_enc_m50 50
execute if score @s rwd_enc_m50 matches 50.. run function rewards:enchant/give_anvil