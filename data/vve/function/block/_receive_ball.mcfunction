#vve:block/_receive_ball
# 接收介质响应
# 输入各模块介质响应信号
# 输入各模块介质响应

scoreboard players set ball_receiver_res int 1
function vve:object/_receive_ball_shift
execute if score bounce_layer_response int matches 1 run function vve:object/_receive_bounce_layer
execute if score grab_layer_response int matches 1 run function vve:object/_receive_grab_layer
scoreboard players operation friction_receiver_response int < friction_response int
execute if score shift_response int matches 1 run function vve:object/_receive_shift
execute if score impulse_response int matches 1 run function vve:object/_dec_impulse