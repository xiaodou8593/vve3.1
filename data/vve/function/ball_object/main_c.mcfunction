#vve:ball_object/main_c
# vve:ball_object/tick调用
# 实体对象主程序

function vve:ball_object/_get
# 运动学迭代
execute as 0-0-0-0-0 run function vve:object/_iter_motion
# 介质探测
scoreboard players operation vve_ball_x int = x int
scoreboard players operation vve_ball_y int = y int
scoreboard players operation vve_ball_z int = z int
scoreboard players operation vve_ball_x int -= vx int
scoreboard players operation vve_ball_y int -= vy int
scoreboard players operation vve_ball_z int -= vz int
scoreboard players operation vve_ball_vx int = vx int
scoreboard players operation vve_ball_vy int = vy int
scoreboard players operation vve_ball_vz int = vz int
execute as 0-0-0-0-0 run function vve:object/_iter_ball
# 力学迭代
scoreboard players operation vy int -= vve_gravity int
# 介质响应
execute if score shift_response int matches 1 run function vve:object/_apply_shift
execute if score impulse_response int matches 1 run function vve:object/_apply_impulse_f
execute if score couple_response int matches 1 as 0-0-0-0-0 run function vve:object/_apply_couple
function vve:object/_apply_friction
# 姿态角速度修正
execute if score grab_layer_response int matches 1.. if score grab_layer_receiver_v_norm int < grab_layer_regular_v int as 0-0-0-0-0 run function vve:ball_object/_regular_angular
# 运动同步
#function vve:object/_sync_motion
# 渲染球面
scoreboard players set r int 0
scoreboard players set g int 255
scoreboard players set b int 0
function math:rgb/_to_list
data modify storage math:io duration set value 2
data modify storage math:io render_command set value "function math:rgb/_render_cache"
#data modify storage math:io render_command set from storage math:class particle_commands.green_dust
scoreboard players operation r int = vve_ball_r int
scoreboard players operation r int /= 10 int
scoreboard players set inp int 64
#execute as 0-0-0-0-0 run function math:sphere/_render_cnt
execute as 0-0-0-0-0 run function vve:ball_object/_render_cnt
function vve:ball_object/_store

# 坐标安全
execute unless score y int matches -640000..5120000 run function vve:ball_object/_del