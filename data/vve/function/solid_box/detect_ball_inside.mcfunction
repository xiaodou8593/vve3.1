#vve:solid_box/detect_ball_inside
# vve:solid_box/_detect_ball调用

execute store result score sstemp_dz int store result score sstemp_dy int run scoreboard players operation sstemp_dx int = vve_solid_box_l int

execute if score sstemp_sx int matches ..0 run scoreboard players operation sstemp_dx int += sstemp_sx int
execute if score sstemp_sx int matches 1.. run scoreboard players operation sstemp_dx int -= sstemp_sx int

execute if score sstemp_sy int matches ..0 run scoreboard players operation sstemp_dy int += sstemp_sy int
execute if score sstemp_sy int matches 1.. run scoreboard players operation sstemp_dy int -= sstemp_sy int

execute if score sstemp_sz int matches ..0 run scoreboard players operation sstemp_dz int += sstemp_sz int
execute if score sstemp_sz int matches 1.. run scoreboard players operation sstemp_dz int -= sstemp_sz int

execute if score sstemp_dx int <= sstemp_dy int if score sstemp_dx int <= sstemp_dz int run return run function vve:solid_box/detect_ball_inside_x
execute if score sstemp_dy int <= sstemp_dz int run return run function vve:solid_box/detect_ball_inside_y
function vve:solid_box/detect_ball_inside_z