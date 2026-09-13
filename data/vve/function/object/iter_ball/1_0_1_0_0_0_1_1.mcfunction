#vve:object/iter_ball/1_0_1_0_0_0_1_1
# vve:object/iter_ball/search调用

# build_size_2:((1, 1, 1))
scoreboard players set vve_solid_box_l int 10000
scoreboard players set vve_solid_box_x int 10000
scoreboard players set vve_solid_box_y int 0
scoreboard players set vve_solid_box_z int 10000
scoreboard players operation vve_solid_box_x int += stemp_x int
scoreboard players operation vve_solid_box_y int += stemp_y int
scoreboard players operation vve_solid_box_z int += stemp_z int
function vve:solid_box/_detect_ball
scoreboard players operation ball_receiver_res int > res int
execute if score res int matches 1 run function vve:object/_receive_ball_shift
execute if score bounce_layer_response int matches 1 run function vve:object/_receive_bounce_layer
execute if score grab_layer_response int matches 1 run function vve:object/_receive_grab_layer
scoreboard players operation friction_receiver_response int < friction_response int
execute if score shift_response int matches 1 run function vve:object/_receive_shift
execute if score impulse_response int matches 1 run function vve:object/_dec_impulse

# build_size_2:((-1, -1, 1))
scoreboard players set vve_solid_box_l int 10000
scoreboard players set vve_solid_box_x int 0
scoreboard players set vve_solid_box_y int -10000
scoreboard players set vve_solid_box_z int 10000
scoreboard players operation vve_solid_box_x int += stemp_x int
scoreboard players operation vve_solid_box_y int += stemp_y int
scoreboard players operation vve_solid_box_z int += stemp_z int
function vve:solid_box/_detect_ball
scoreboard players operation ball_receiver_res int > res int
execute if score res int matches 1 run function vve:object/_receive_ball_shift
execute if score bounce_layer_response int matches 1 run function vve:object/_receive_bounce_layer
execute if score grab_layer_response int matches 1 run function vve:object/_receive_grab_layer
scoreboard players operation friction_receiver_response int < friction_response int
execute if score shift_response int matches 1 run function vve:object/_receive_shift
execute if score impulse_response int matches 1 run function vve:object/_dec_impulse

# build_size_2:((-1, -1, -1))
scoreboard players set vve_solid_box_l int 10000
scoreboard players set vve_solid_box_x int -10000
scoreboard players set vve_solid_box_y int -10000
scoreboard players set vve_solid_box_z int 0
scoreboard players operation vve_solid_box_x int += stemp_x int
scoreboard players operation vve_solid_box_y int += stemp_y int
scoreboard players operation vve_solid_box_z int += stemp_z int
function vve:solid_box/_detect_ball
scoreboard players operation ball_receiver_res int > res int
execute if score res int matches 1 run function vve:object/_receive_ball_shift
execute if score bounce_layer_response int matches 1 run function vve:object/_receive_bounce_layer
execute if score grab_layer_response int matches 1 run function vve:object/_receive_grab_layer
scoreboard players operation friction_receiver_response int < friction_response int
execute if score shift_response int matches 1 run function vve:object/_receive_shift
execute if score impulse_response int matches 1 run function vve:object/_dec_impulse
