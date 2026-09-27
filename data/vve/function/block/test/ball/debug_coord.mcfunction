#vve:block/test/ball/debug_coord
# vve:object/_iter_ball_8调用

execute store result storage math:io xyz[0] double 0.0001 run scoreboard players get impulse_x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players get impulse_y int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players get impulse_z int
data modify entity @s Pos set from storage math:io xyz
execute at @s run function math:particle/_new_macro {render_command:"particle flame"}

execute store result storage math:io xyz[0] double 0.0001 run scoreboard players get sstemp_bx int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players get sstemp_by int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players get sstemp_bz int
data modify entity @s Pos set from storage math:io xyz
execute at @s run function math:particle/_new_macro {render_command:"particle soul_fire_flame"}
#data modify storage math:io input set value {}
#data modify storage math:io input.render_command set from storage math:class particle_commands.green_dust_tiny
#execute at @s run function math:particle/_new