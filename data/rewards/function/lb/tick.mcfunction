# Re-enable triggers for all players each second
execute as @a run scoreboard players enable @s kills
execute as @a run scoreboard players enable @s spear
execute as @a run scoreboard players enable @s mace
execute as @a run scoreboard players enable @s logs
execute as @a run scoreboard players enable @s ores
execute as @a run scoreboard players enable @s damage
execute as @a run scoreboard players enable @s dirt
execute as @a run scoreboard players enable @s enchant
execute as @a run scoreboard players enable @s milk
execute as @a run scoreboard players enable @s eggs
execute as @a run scoreboard players enable @s bread
execute as @a run scoreboard players enable @s off
execute as @a run scoreboard players enable @s metric
execute as @a run scoreboard players enable @s anvil
execute as @a run scoreboard players enable @s smite_sevasek
execute as @a run scoreboard players enable @s smite_sevact
execute as @a run scoreboard players enable @s smite_catmodo
execute as @a run scoreboard players enable @s immortal_sevasek
execute as @a run scoreboard players enable @s immortal_sevact
execute as @a run scoreboard players enable @s immortal_catmodo
execute as @a run scoreboard players enable @s mortal_sevasek
execute as @a run scoreboard players enable @s mortal_sevact
execute as @a run scoreboard players enable @s mortal_catmodo
# Dispatch activations
execute as @a[scores={kills=1..}] run function rewards:lb/show_kills
execute as @a[scores={spear=1..}] run function rewards:lb/show_spear
execute as @a[scores={mace=1..}] run function rewards:lb/show_mace
execute as @a[scores={logs=1..}] run function rewards:lb/show_logs
execute as @a[scores={ores=1..}] run function rewards:lb/show_ores
execute as @a[scores={damage=1..}] run function rewards:lb/show_damage
execute as @a[scores={dirt=1..}] run function rewards:lb/show_dirt
execute as @a[scores={enchant=1..}] run function rewards:lb/show_enchant
execute as @a[scores={milk=1..}] run function rewards:lb/show_milk
execute as @a[scores={eggs=1..}] run function rewards:lb/show_eggs
execute as @a[scores={bread=1..}] run function rewards:lb/show_bread
execute as @a[scores={off=1..}] run function rewards:lb/show_off
execute as @a[scores={metric=1..}] run function rewards:lb/help
execute as @a[scores={anvil=1..}] at @s run function rewards:anvil_open
execute as @a[scores={smite_sevasek=1..}] run function rewards:smite/sevasek
execute as @a[scores={smite_sevact=1..}] run function rewards:smite/sevact
execute as @a[scores={smite_catmodo=1..}] run function rewards:smite/catmodo
execute as @a[scores={immortal_sevasek=1..}] run function rewards:immortal/sevasek
execute as @a[scores={immortal_sevact=1..}] run function rewards:immortal/sevact
execute as @a[scores={immortal_catmodo=1..}] run function rewards:immortal/catmodo
execute as @a[scores={mortal_sevasek=1..}] run function rewards:mortal/sevasek
execute as @a[scores={mortal_sevact=1..}] run function rewards:mortal/sevact
execute as @a[scores={mortal_catmodo=1..}] run function rewards:mortal/catmodo
# Reset all trigger scores to 0 to prevent re-firing next tick
execute as @a run scoreboard players set @s kills 0
execute as @a run scoreboard players set @s spear 0
execute as @a run scoreboard players set @s mace 0
execute as @a run scoreboard players set @s logs 0
execute as @a run scoreboard players set @s ores 0
execute as @a run scoreboard players set @s damage 0
execute as @a run scoreboard players set @s dirt 0
execute as @a run scoreboard players set @s enchant 0
execute as @a run scoreboard players set @s milk 0
execute as @a run scoreboard players set @s eggs 0
execute as @a run scoreboard players set @s bread 0
execute as @a run scoreboard players set @s off 0
execute as @a run scoreboard players set @s metric 0
execute as @a run scoreboard players set @s anvil 0
execute as @a run scoreboard players set @s smite_sevasek 0
execute as @a run scoreboard players set @s smite_sevact 0
execute as @a run scoreboard players set @s smite_catmodo 0
execute as @a run scoreboard players set @s immortal_sevasek 0
execute as @a run scoreboard players set @s immortal_sevact 0
execute as @a run scoreboard players set @s immortal_catmodo 0
execute as @a run scoreboard players set @s mortal_sevasek 0
execute as @a run scoreboard players set @s mortal_sevact 0
execute as @a run scoreboard players set @s mortal_catmodo 0