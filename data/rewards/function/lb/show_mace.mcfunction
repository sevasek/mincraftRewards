scoreboard objectives setdisplay sidebar rwd_mace_kills
tellraw @a [{"text":"[Leaderboard] ","color":"gold","bold":true},{"text":"Now showing: ","color":"gray"},{"text":"Mace Kills","color":"yellow","bold":true}]
execute as @a run function rewards:lb/enable_triggers