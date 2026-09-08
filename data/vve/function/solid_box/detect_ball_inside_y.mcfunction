#vve:solid_box/detect_ball_inside_y
# vve:solid_box/detect_ball_inside调用

scoreboard players set grab_layer_response int 1
scoreboard players set nvec_x int 0
scoreboard players set nvec_z int 0

scoreboard players set nvec_y int 10000
execute if score sstemp_sy int matches ..-1 run scoreboard players set nvec_y int -10000

scoreboard players operation grab_depth int = vve_ball_r int
scoreboard players operation grab_depth int -= sstemp_dy int
execute if score grab_depth int matches ..-1 run scoreboard players operation grab_depth int *= -1 int