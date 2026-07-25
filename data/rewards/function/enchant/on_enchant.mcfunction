# Compute delta (how many enchants since last tick)
scoreboard players set @s rwd_enc_delta 0
scoreboard players operation @s rwd_enc_delta += @s rwd_enchant
scoreboard players operation @s rwd_enc_delta -= @s rwd_enchant_last
execute if score @s rwd_enc_delta matches 1.. run function rewards:enchant/give_bottle