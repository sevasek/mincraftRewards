scoreboard objectives setdisplay sidebar rwd_bread
tellraw @a [{"text":"[Leaderboard] ","color":"gold","bold":true},{"text":"Now showing: ","color":"gray"},{"text":"Bread Baked","color":"gold","bold":true}]
execute as @a run function rewards:lb/enable_triggers