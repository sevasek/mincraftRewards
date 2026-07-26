scoreboard objectives setdisplay sidebar rwd_tot_kills
tellraw @a [{"text":"[Leaderboard] ","color":"gold","bold":true},{"text":"Now showing: ","color":"gray"},{"text":"Mob Kills","color":"red","bold":true}]
execute as @a run function rewards:lb/enable_triggers