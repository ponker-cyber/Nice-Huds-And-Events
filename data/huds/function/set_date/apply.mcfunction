scoreboard players operation $year huds.calendar = $date_year eden.technical
scoreboard players operation $month huds.calendar = $date_month eden.technical
scoreboard players operation $day huds.calendar = $date_day eden.technical

function huds:calendar/get_month_name
function huds:calendar/get_season
function huds:calendar/store_dates

tellraw @s [
{"text":"▊ ","color":"aqua","bold":false,"italic":false},
{"text":"Date set to ","color":"gray","bold":false,"italic":false},
{"score":{"name":"$year","objective":"huds.calendar"},"color":"gold","bold":false,"italic":false},
{"text":"-","color":"dark_gray","bold":false,"italic":false},
{"score":{"name":"$month","objective":"huds.calendar"},"color":"gold","bold":false,"italic":false},
{"text":"-","color":"dark_gray","bold":false,"italic":false},
{"score":{"name":"$day","objective":"huds.calendar"},"color":"gold","bold":false,"italic":false}
]

execute at @s run playsound minecraft:entity.chicken.egg neutral @s ~ ~ ~ .6 2
