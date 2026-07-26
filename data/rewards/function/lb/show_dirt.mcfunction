scoreboard objectives setdisplay sidebar rwd_dirt
tellraw @a [{"text":"[Leaderboard] ","color":"gold","bold":true},{"text":"Now showing: ","color":"gray"},{"text":"Dirt Moved","color":"dark_green","bold":true}]
execute as @a run function rewards:lb/enable_triggers