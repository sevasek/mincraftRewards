setblock ~ ~5 ~ minecraft:anvil
summon minecraft:armor_stand ~ ~5 ~ {Tags:["anvil_mrkr"],Invisible:1b,Marker:1b,NoGravity:1b,Small:1b}
title @s actionbar {"text":"Right-click the anvil to use it!","color":"yellow","bold":true}
schedule function rewards:anvil_cleanup 5s append