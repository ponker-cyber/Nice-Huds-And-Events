scoreboard players enable @a set_date
execute as @a[scores={set_date=1..}] run function huds:set_date/parse

schedule function huds:set_date/run 1s
