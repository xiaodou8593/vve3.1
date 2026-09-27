#vve:ball_object/iter_ball_step_mod
# vve:ball_object/_iter_ball_step调用

execute store result score stemp_x_mod int run scoreboard players operation stemp_x int = x int
execute store result score stemp_y_mod int run scoreboard players operation stemp_y int = y int
execute store result score stemp_z_mod int run scoreboard players operation stemp_z int = z int
scoreboard players operation stemp_x_mod int %= 10000 int
scoreboard players operation stemp_y_mod int %= 10000 int
scoreboard players operation stemp_z_mod int %= 10000 int
execute if score stemp_x_mod int matches 5000.. run scoreboard players remove stemp_x_mod int 10000
execute if score stemp_y_mod int matches 5000.. run scoreboard players remove stemp_y_mod int 10000
execute if score stemp_z_mod int matches 5000.. run scoreboard players remove stemp_z_mod int 10000
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players operation stemp_x int -= stemp_x_mod int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players operation stemp_y int -= stemp_y_mod int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players operation stemp_z int -= stemp_z_mod int
data modify entity @s Pos set from storage math:io xyz
execute at @s run function vve:object/iter_ball/detect_block