scoreboard players operation $set_date_input eden.technical = @s set_date

scoreboard players operation $date_year eden.technical = $set_date_input eden.technical
scoreboard players operation $date_year eden.technical /= $10000 eden.technical

scoreboard players operation $date_month eden.technical = $set_date_input eden.technical
scoreboard players operation $date_month eden.technical /= $100 eden.technical
scoreboard players operation $date_month eden.technical %= $100 eden.technical

scoreboard players operation $date_day eden.technical = $set_date_input eden.technical
scoreboard players operation $date_day eden.technical %= $100 eden.technical

scoreboard players set $date_has_8_digits eden.technical 0
execute if score $set_date_input eden.technical matches 10000101..99991231 run scoreboard players set $date_has_8_digits eden.technical 1

scoreboard players set $date_is_valid eden.technical 0
execute if score $date_month eden.technical matches 1 if score $date_day eden.technical matches 1..31 run scoreboard players set $date_is_valid eden.technical 1
execute if score $date_month eden.technical matches 2 if score $date_day eden.technical matches 1..28 run scoreboard players set $date_is_valid eden.technical 1
execute if score $date_month eden.technical matches 3 if score $date_day eden.technical matches 1..31 run scoreboard players set $date_is_valid eden.technical 1
execute if score $date_month eden.technical matches 4 if score $date_day eden.technical matches 1..30 run scoreboard players set $date_is_valid eden.technical 1
execute if score $date_month eden.technical matches 5 if score $date_day eden.technical matches 1..31 run scoreboard players set $date_is_valid eden.technical 1
execute if score $date_month eden.technical matches 6 if score $date_day eden.technical matches 1..30 run scoreboard players set $date_is_valid eden.technical 1
execute if score $date_month eden.technical matches 7 if score $date_day eden.technical matches 1..31 run scoreboard players set $date_is_valid eden.technical 1
execute if score $date_month eden.technical matches 8 if score $date_day eden.technical matches 1..31 run scoreboard players set $date_is_valid eden.technical 1
execute if score $date_month eden.technical matches 9 if score $date_day eden.technical matches 1..30 run scoreboard players set $date_is_valid eden.technical 1
execute if score $date_month eden.technical matches 10 if score $date_day eden.technical matches 1..31 run scoreboard players set $date_is_valid eden.technical 1
execute if score $date_month eden.technical matches 11 if score $date_day eden.technical matches 1..30 run scoreboard players set $date_is_valid eden.technical 1
execute if score $date_month eden.technical matches 12 if score $date_day eden.technical matches 1..31 run scoreboard players set $date_is_valid eden.technical 1

execute if score $date_has_8_digits eden.technical matches 1 if score $date_year eden.technical matches 1000..9999 if score $date_is_valid eden.technical matches 1 run function huds:set_date/apply
execute unless score $date_has_8_digits eden.technical matches 1 run function huds:set_date/invalid
execute if score $date_has_8_digits eden.technical matches 1 unless score $date_year eden.technical matches 1000..9999 run function huds:set_date/invalid
execute if score $date_has_8_digits eden.technical matches 1 if score $date_year eden.technical matches 1000..9999 unless score $date_is_valid eden.technical matches 1 run function huds:set_date/invalid

scoreboard players set @s set_date 0
