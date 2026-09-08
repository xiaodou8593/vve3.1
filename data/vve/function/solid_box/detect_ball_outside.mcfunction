#vve:solid_box/detect_ball_outside
# vve:solid_box/_detect_ball调用

scoreboard players set grab_layer_response int 1
execute store result score nvec_x int run compute default float vve:solid_box/_calc_nx 10000
execute store result score nvec_y int run compute default float vve:solid_box/_calc_ny 10000
execute store result score nvec_z int run compute default float vve:solid_box/_calc_nz 10000

scoreboard players operation grab_depth int = vve_ball_r int
scoreboard players operation grab_depth int -= sstemp_r int