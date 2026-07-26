scoreboard objectives setdisplay sidebar rwd_spear_kills
tellraw @a [{"text":"[Leaderboard] ","color":"gold","bold":true},{"text":"Now showing: ","color":"gray"},{"text":"Spear Kills","color":"gold","bold":true}]
execute as @a run function rewards:lb/enable_triggers