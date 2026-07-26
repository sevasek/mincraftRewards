tellraw @a {"text":""}
tellraw @a [{"text":"  ✦ ","color":"dark_gray"},{"text":"Leaderboard","color":"gold","bold":true},{"text":" — click a metric or type /trigger lb_<name>","color":"gray"}]
tellraw @a [{"text":"  [Mob Kills]","color":"red","clickEvent":{"action":"run_command","value":"/trigger lb_kills"},"hoverEvent":{"action":"show_text","contents":{"text":"/trigger lb_kills","color":"gray"}}}]
tellraw @a [{"text":"  [Spear Kills]","color":"gold","clickEvent":{"action":"run_command","value":"/trigger lb_spear"},"hoverEvent":{"action":"show_text","contents":{"text":"/trigger lb_spear","color":"gray"}}}]
tellraw @a [{"text":"  [Mace Kills]","color":"yellow","clickEvent":{"action":"run_command","value":"/trigger lb_mace"},"hoverEvent":{"action":"show_text","contents":{"text":"/trigger lb_mace","color":"gray"}}}]
tellraw @a [{"text":"  [Logs Chopped]","color":"green","clickEvent":{"action":"run_command","value":"/trigger lb_logs"},"hoverEvent":{"action":"show_text","contents":{"text":"/trigger lb_logs","color":"gray"}}}]
tellraw @a [{"text":"  [Ores Mined]","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger lb_ores"},"hoverEvent":{"action":"show_text","contents":{"text":"/trigger lb_ores","color":"gray"}}}]
tellraw @a [{"text":"  [Damage Dealt]","color":"light_purple","clickEvent":{"action":"run_command","value":"/trigger lb_damage"},"hoverEvent":{"action":"show_text","contents":{"text":"/trigger lb_damage","color":"gray"}}}]
tellraw @a [{"text":"  [Dirt Moved]","color":"dark_green","clickEvent":{"action":"run_command","value":"/trigger lb_dirt"},"hoverEvent":{"action":"show_text","contents":{"text":"/trigger lb_dirt","color":"gray"}}}]
tellraw @a [{"text":"  [Enchants]","color":"light_purple","clickEvent":{"action":"run_command","value":"/trigger lb_enchant"},"hoverEvent":{"action":"show_text","contents":{"text":"/trigger lb_enchant","color":"gray"}}}]
tellraw @a [{"text":"  [Milk Collected]","color":"white","clickEvent":{"action":"run_command","value":"/trigger lb_milk"},"hoverEvent":{"action":"show_text","contents":{"text":"/trigger lb_milk","color":"gray"}}}]
tellraw @a [{"text":"  [Eggs Collected]","color":"yellow","clickEvent":{"action":"run_command","value":"/trigger lb_eggs"},"hoverEvent":{"action":"show_text","contents":{"text":"/trigger lb_eggs","color":"gray"}}}]
tellraw @a [{"text":"  [Bread Baked]","color":"gold","clickEvent":{"action":"run_command","value":"/trigger lb_bread"},"hoverEvent":{"action":"show_text","contents":{"text":"/trigger lb_bread","color":"gray"}}}]
tellraw @a [{"text":"  [Hide Sidebar]","color":"dark_gray","clickEvent":{"action":"run_command","value":"/trigger lb_off"}}]
tellraw @a {"text":""}
execute as @a run function rewards:lb/enable_triggers