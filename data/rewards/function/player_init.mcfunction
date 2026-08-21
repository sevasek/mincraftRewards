scoreboard players add @s rwd_init 0
execute if score @s rwd_init matches 0 run function rewards:do_init
scoreboard players add @s rwd_v2 0
execute if score @s rwd_v2 matches 0 if score @s rwd_init matches 1.. run function rewards:migrate_v2
scoreboard players add @s rwd_v3 0
execute if score @s rwd_v3 matches 0 if score @s rwd_init matches 1.. run function rewards:migrate_v3