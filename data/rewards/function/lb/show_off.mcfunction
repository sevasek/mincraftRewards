scoreboard objectives setdisplay sidebar
tellraw @a [{"text":"[Leaderboard] ","color":"gold","bold":true},{"text":"Sidebar hidden.","color":"gray"}]
execute as @a run function rewards:lb/enable_triggers