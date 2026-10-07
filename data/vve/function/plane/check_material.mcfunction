#vve:plane/check_material

scoreboard players set res int 0
execute if score c_x int >= @s x_min if score c_x int <= @s x_max \
	if score c_z int >= @s z_min if score c_z int <= @s z_max \
	run scoreboard players set res int 1
execute if score res int matches 0 run return fail

scoreboard players operation stemp_depth int = @s y
scoreboard players operation stemp_depth int -= c_y int

execute if score stemp_depth int < vve_slope_block_d int run scoreboard players set res int 0
execute if score stemp_depth int > @s base_layer run scoreboard players set res int 0

execute if score res int matches 1 run function vve:slope_xp/response