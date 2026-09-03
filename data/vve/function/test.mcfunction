#vve:test

execute store result entity @s Rotation[0] float -0.0000286478897565 run scoreboard players get quat_phi int
tellraw @a ["Rotation: ", {"nbt":"Rotation","entity":"@s"}]
scoreboard players operation quat_phi int %= 314159265 int
execute at @s positioned 0.0 0.0 0.0 rotated ~ 0.0 run tp @s ^ ^ ^1.0
data modify storage math:io xyz set from entity @s Pos
tellraw @a ["xyz: ", {"nbt":"xyz","storage":"math:io"}]
execute store result score cos int run data get storage math:io xyz[2] 10000
execute store result score sin int run data get storage math:io xyz[0] 10000