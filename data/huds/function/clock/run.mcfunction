execute as @a[tag=!huds.bossbars_ready] run function huds:create_bossbars/run
execute as @a[tag=!huds.bossbars_ready] run tag @s add huds.bossbars_ready

execute as @a unless score @s huds.clock_enabled matches 0..1 run scoreboard players set @s huds.clock_enabled 1
execute as @a run scoreboard players enable @s clock_hud
execute as @a[scores={clock_hud=1..}] run function huds:clock/toggle

execute as @a[scores={huds.clock_enabled=1..}] run function huds:clock/true/run
execute as @a[scores={huds.clock_enabled=..0}] run function huds:clock/false/run

execute as @e[type=#eden:item_frames,nbt={Item:{id:"minecraft:clock"}}] at @s unless entity @e[type=text_display,tag=eden.item_frame.clock,distance=..0.5] run function huds:clock/item_frame/add_overlay
execute as @e[type=text_display,tag=eden.item_frame.clock] unless score $time_format eden.technical matches 1.. run function huds:clock/item_frame/12_update_time with storage eden:calendar global
execute as @e[type=text_display,tag=eden.item_frame.clock] if score $time_format eden.technical matches 1.. run function huds:clock/item_frame/24_update_time with storage eden:calendar global
execute as @e[type=text_display,tag=eden.item_frame.clock] at @s unless entity @e[type=#eden:item_frames,nbt={Item:{id:"minecraft:clock"}},distance=..0.5] run kill @s

schedule function huds:clock/run 10t
