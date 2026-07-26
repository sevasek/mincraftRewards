scoreboard objectives setdisplay sidebar rwd_milk
tellraw @a [{"text":"[Leaderboard] ","color":"gold","bold":true},{"text":"Now showing: ","color":"gray"},{"text":"Milk Collected","color":"white","bold":true}]
execute as @a run function rewards:lb/enable_triggers