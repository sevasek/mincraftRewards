scoreboard objectives setdisplay sidebar rwd_logs
tellraw @a [{"text":"[Leaderboard] ","color":"gold","bold":true},{"text":"Now showing: ","color":"gray"},{"text":"Logs Chopped","color":"green","bold":true}]
execute as @a run function rewards:lb/enable_triggers