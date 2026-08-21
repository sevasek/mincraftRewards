scoreboard objectives setdisplay sidebar rwd_trims
tellraw @a [{"text":"[Leaderboard] ","color":"gold","bold":true},{"text":"Now showing: ","color":"gray"},{"text":"Armour Trims","color":"dark_aqua","bold":true}]
execute as @a run function rewards:lb/enable_triggers