scoreboard objectives setdisplay sidebar rwd_egg
tellraw @a [{"text":"[Leaderboard] ","color":"gold","bold":true},{"text":"Now showing: ","color":"gray"},{"text":"Eggs Collected","color":"yellow","bold":true}]
execute as @a run function rewards:lb/enable_triggers