#vve:block/iter_ball/0_1_1_1_1_1_1_1
# vve:block/iter_ball/search调用

# build_size_2:((0, 0, -2))
scoreboard players set vve_solid_box_l int 10000
scoreboard players set vve_solid_box_x int 0
scoreboard players set vve_solid_box_y int 0
scoreboard players set vve_solid_box_z int -10000
scoreboard players operation vve_solid_box_x int += stemp_x int
scoreboard players operation vve_solid_box_y int += stemp_y int
scoreboard players operation vve_solid_box_z int += stemp_z int
function vve:solid_box/_detect_ball
execute if score res int matches 1 if predicate vve:block/_cpoint_inside run function vve:block/_receive_ball

# build_size_2:((0, -2, 0))
scoreboard players set vve_solid_box_l int 10000
scoreboard players set vve_solid_box_x int 0
scoreboard players set vve_solid_box_y int -10000
scoreboard players set vve_solid_box_z int 0
scoreboard players operation vve_solid_box_x int += stemp_x int
scoreboard players operation vve_solid_box_y int += stemp_y int
scoreboard players operation vve_solid_box_z int += stemp_z int
function vve:solid_box/_detect_ball
execute if score res int matches 1 if predicate vve:block/_cpoint_inside run function vve:block/_receive_ball

# build_size_2:((-2, 0, 0))
scoreboard players set vve_solid_box_l int 10000
scoreboard players set vve_solid_box_x int -10000
scoreboard players set vve_solid_box_y int 0
scoreboard players set vve_solid_box_z int 0
scoreboard players operation vve_solid_box_x int += stemp_x int
scoreboard players operation vve_solid_box_y int += stemp_y int
scoreboard players operation vve_solid_box_z int += stemp_z int
function vve:solid_box/_detect_ball
execute if score res int matches 1 if predicate vve:block/_cpoint_inside run function vve:block/_receive_ball
