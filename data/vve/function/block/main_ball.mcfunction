#vve:block/main_ball
# vve:block/tick调用
# 实体对象主程序

function vve:block/_get
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
scoreboard players operation vve_ball_r int = a int
scoreboard players operation vve_ball_r int *= 362 int
scoreboard players operation vve_ball_r int /= 209 int
execute as 0-0-0-0-0 run function vve:block/_iter_ball
# 力学迭代
scoreboard players operation vy int -= vve_gravity int
# 介质响应
execute if score shift_response int matches 1 run function vve:object/_apply_shift
execute if score impulse_response int matches 1 run function vve:object/_apply_impulse_f
execute if score couple_response int matches 1 as 0-0-0-0-0 run function vve:object/_apply_couple
function vve:object/_apply_friction
# 姿态角速度修正
execute if score grab_layer_response int matches 3.. if score grab_layer_receiver_v_norm int < grab_layer_regular_v int as 0-0-0-0-0 run function vve:object/_regular
# 运动同步
function vve:object/_sync_motion
function vve:block/_store