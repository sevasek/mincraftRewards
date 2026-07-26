# Re-enable triggers for all players each second
execute as @a run scoreboard players enable @s lb_kills
execute as @a run scoreboard players enable @s lb_spear
execute as @a run scoreboard players enable @s lb_mace
execute as @a run scoreboard players enable @s lb_logs
execute as @a run scoreboard players enable @s lb_ores
execute as @a run scoreboard players enable @s lb_damage
execute as @a run scoreboard players enable @s lb_dirt
execute as @a run scoreboard players enable @s lb_enchant
execute as @a run scoreboard players enable @s lb_milk
execute as @a run scoreboard players enable @s lb_eggs
execute as @a run scoreboard players enable @s lb_bread
execute as @a run scoreboard players enable @s lb_off
execute as @a run scoreboard players enable @s lb_help
# Dispatch activations
execute as @a[scores={lb_kills=1..}] run function rewards:lb/show_kills
execute as @a[scores={lb_spear=1..}] run function rewards:lb/show_spear
execute as @a[scores={lb_mace=1..}] run function rewards:lb/show_mace
execute as @a[scores={lb_logs=1..}] run function rewards:lb/show_logs
execute as @a[scores={lb_ores=1..}] run function rewards:lb/show_ores
execute as @a[scores={lb_damage=1..}] run function rewards:lb/show_damage
execute as @a[scores={lb_dirt=1..}] run function rewards:lb/show_dirt
execute as @a[scores={lb_enchant=1..}] run function rewards:lb/show_enchant
execute as @a[scores={lb_milk=1..}] run function rewards:lb/show_milk
execute as @a[scores={lb_eggs=1..}] run function rewards:lb/show_eggs
execute as @a[scores={lb_bread=1..}] run function rewards:lb/show_bread
execute as @a[scores={lb_off=1..}] run function rewards:lb/show_off
execute as @a[scores={lb_help=1..}] run function rewards:lb/help