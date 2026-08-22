tellraw @a {"text":""}
tellraw @a [{"text":"  ✦ ","color":"dark_gray"},{"text":"Leaderboard","color":"gold","bold":true},{"text":" — click a metric or type /trigger <name>","color":"gray"}]
tellraw @a [{"text":"  [Mob Kills]","color":"red","clickEvent":{"action":"run_command","value":"/trigger kills"},"hoverEvent":{"action":"show_text","contents":{"text":"/trigger kills","color":"gray"}}}]
tellraw @a [{"text":"  [Spear Kills]","color":"gold","clickEvent":{"action":"run_command","value":"/trigger spear"},"hoverEvent":{"action":"show_text","contents":{"text":"/trigger spear","color":"gray"}}}]
tellraw @a [{"text":"  [Mace Kills]","color":"yellow","clickEvent":{"action":"run_command","value":"/trigger mace"},"hoverEvent":{"action":"show_text","contents":{"text":"/trigger mace","color":"gray"}}}]
tellraw @a [{"text":"  [Logs Chopped]","color":"green","clickEvent":{"action":"run_command","value":"/trigger logs"},"hoverEvent":{"action":"show_text","contents":{"text":"/trigger logs","color":"gray"}}}]
tellraw @a [{"text":"  [Ores Mined]","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger ores"},"hoverEvent":{"action":"show_text","contents":{"text":"/trigger ores","color":"gray"}}}]
tellraw @a [{"text":"  [Damage Dealt]","color":"light_purple","clickEvent":{"action":"run_command","value":"/trigger damage"},"hoverEvent":{"action":"show_text","contents":{"text":"/trigger damage","color":"gray"}}}]
tellraw @a [{"text":"  [Dirt Moved]","color":"dark_green","clickEvent":{"action":"run_command","value":"/trigger dirt"},"hoverEvent":{"action":"show_text","contents":{"text":"/trigger dirt","color":"gray"}}}]
tellraw @a [{"text":"  [Enchants]","color":"light_purple","clickEvent":{"action":"run_command","value":"/trigger enchant"},"hoverEvent":{"action":"show_text","contents":{"text":"/trigger enchant","color":"gray"}}}]
tellraw @a [{"text":"  [Milk Collected]","color":"white","clickEvent":{"action":"run_command","value":"/trigger milk"},"hoverEvent":{"action":"show_text","contents":{"text":"/trigger milk","color":"gray"}}}]
tellraw @a [{"text":"  [Eggs Collected]","color":"yellow","clickEvent":{"action":"run_command","value":"/trigger eggs"},"hoverEvent":{"action":"show_text","contents":{"text":"/trigger eggs","color":"gray"}}}]
tellraw @a [{"text":"  [Bread Baked]","color":"gold","clickEvent":{"action":"run_command","value":"/trigger bread"},"hoverEvent":{"action":"show_text","contents":{"text":"/trigger bread","color":"gray"}}}]
tellraw @a [{"text":"  [Armour Trims]","color":"dark_aqua","clickEvent":{"action":"run_command","value":"/trigger trims"},"hoverEvent":{"action":"show_text","contents":{"text":"/trigger trims","color":"gray"}}}]
tellraw @a [{"text":"  [Hide Sidebar]","color":"dark_gray","clickEvent":{"action":"run_command","value":"/trigger off"}}]
tellraw @a {"text":""}
execute as @a run function rewards:lb/enable_triggers