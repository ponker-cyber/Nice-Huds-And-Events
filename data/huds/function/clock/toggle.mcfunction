execute if score @s huds.clock_enabled matches 1.. run scoreboard players set @s huds.clock_enabled 0
execute unless score @s huds.clock_enabled matches 1.. run scoreboard players set @s huds.clock_enabled 1

execute if score @s huds.clock_enabled matches 1.. run tellraw @s [{"text":"▊ ","color":"aqua","bold":false,"italic":false},{"text":"Clock bossbar enabled.","color":"gray","bold":false,"italic":false}]
execute unless score @s huds.clock_enabled matches 1.. run tellraw @s [{"text":"▊ ","color":"aqua","bold":false,"italic":false},{"text":"Clock bossbar disabled.","color":"gray","bold":false,"italic":false}]

scoreboard players set @s clock_hud 0
