scoreboard objectives setdisplay sidebar rwd_ores
tellraw @a [{"text":"[Leaderboard] ","color":"gold","bold":true},{"text":"Now showing: ","color":"gray"},{"text":"Ores Mined","color":"aqua","bold":true}]
execute as @a run function rewards:lb/enable_triggers