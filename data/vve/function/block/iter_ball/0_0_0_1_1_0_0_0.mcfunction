#vve:block/iter_ball/0_0_0_1_1_0_0_0
# vve:block/iter_ball/search调用

# build_size_1:((1, -1, -1))
scoreboard players set vve_solid_box_l int 5000
scoreboard players set vve_solid_box_x int 5000
scoreboard players set vve_solid_box_y int -5000
scoreboard players set vve_solid_box_z int -5000
scoreboard players operation vve_solid_box_x int += stemp_x int
scoreboard players operation vve_solid_box_y int += stemp_y int
scoreboard players operation vve_solid_box_z int += stemp_z int
function vve:solid_box/_detect_ball
execute if score res int matches 1 if predicate vve:block/_cpoint_inside run function vve:block/_receive_ball

# build_size_1:((-1, 1, 1))
scoreboard players set vve_solid_box_l int 5000
scoreboard players set vve_solid_box_x int -5000
scoreboard players set vve_solid_box_y int 5000
scoreboard players set vve_solid_box_z int 5000
scoreboard players operation vve_solid_box_x int += stemp_x int
scoreboard players operation vve_solid_box_y int += stemp_y int
scoreboard players operation vve_solid_box_z int += stemp_z int
function vve:solid_box/_detect_ball
execute if score res int matches 1 if predicate vve:block/_cpoint_inside run function vve:block/_receive_ball
