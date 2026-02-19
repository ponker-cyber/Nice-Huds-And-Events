##default technical scoreboard
scoreboard objectives add eden.technical dummy

##additional scoreboards
scoreboard objectives add send_position trigger {"text": "Send Position"}
scoreboard objectives add get_date trigger {"text": "Get Date"}
scoreboard objectives add set_date trigger {"text": "Set Date (YYYYMMDD)"}
scoreboard objectives add clock_hud trigger {"text": "Toggle Clock HUD"}
scoreboard objectives add huds.calendar dummy
scoreboard objectives add huds.clock_enabled dummy
scoreboard objectives add huds.has_slept minecraft.custom:minecraft.sleep_in_bed
scoreboard players reset * huds.has_slept
scoreboard players reset $sleep_triggered eden.technical
scoreboard players reset $sleep_msg_scheduled eden.technical
scoreboard objectives add huds.days_lived.counter dummy
scoreboard objectives add huds.years_lived.counter dummy
scoreboard objectives setdisplay list huds.days_lived.counter
scoreboard objectives add huds.has_died_today deathCount

##scoreboard math entries
scoreboard players set $5 eden.technical 5
scoreboard players set $6 eden.technical 6
scoreboard players set $12 eden.technical 12
scoreboard players set $18 eden.technical 18
scoreboard players set $24 eden.technical 24
scoreboard players set $60 eden.technical 60
scoreboard players set $100 eden.technical 100
scoreboard players set $10000 eden.technical 10000
execute unless score $day huds.calendar matches 1.. run scoreboard players set $day huds.calendar 1
execute unless score $month huds.calendar matches 1.. run scoreboard players set $month huds.calendar 1
execute unless score $year huds.calendar matches 1.. run scoreboard players set $year huds.calendar 1
execute unless data storage eden:calendar global.weekday run data modify storage eden:calendar global.weekday set value "Monday"

##init schedules
schedule function huds:recovery_compass/run 10t
schedule function huds:recovery_compass/update/run 10s
schedule function huds:compass/run 10t
schedule function huds:clock/run 10t
schedule function huds:send_position/run 1s
schedule function huds:get_date/run 1s
schedule function huds:set_date/run 1s
schedule function huds:send_position/enable_trigger 60s
schedule function huds:calendar/run 1s

##remove temp storage
data remove storage eden:temp huds
scoreboard players set $trigger_events eden.technical 0