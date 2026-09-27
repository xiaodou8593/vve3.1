#vve:ball_object/iter_ball_step
# vve:ball_object/_iter_ball_step调用

execute store result score stemp_x_mod int store result score stemp_x int run compute default float vve:ball_object/_step_ball_x
execute store result score stemp_y_mod int store result score stemp_y int run compute default float vve:ball_object/_step_ball_y
execute store result score stemp_z_mod int store result score stemp_z int run compute default float vve:ball_object/_step_ball_z
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

execute if score ball_receiver_res int matches 1 run return fail

scoreboard players add loop int 1
execute if score loop int <= stemp_len_div int run function vve:ball_object/iter_ball_step