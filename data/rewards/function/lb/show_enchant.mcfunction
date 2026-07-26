scoreboard objectives setdisplay sidebar rwd_enchant
tellraw @a [{"text":"[Leaderboard] ","color":"gold","bold":true},{"text":"Now showing: ","color":"gray"},{"text":"Enchants","color":"light_purple","bold":true}]
execute as @a run function rewards:lb/enable_triggers