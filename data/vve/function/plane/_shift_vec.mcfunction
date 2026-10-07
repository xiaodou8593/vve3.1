#vve:plane/_shift_vec
# 应用向量vec偏移
# 输入math:vec{<vec_x,int,1w>,<vec_y,int,1w>,<vec_z,int,1w>}

scoreboard players operation x_min int += vec_x int
scoreboard players operation x_max int += vec_x int
scoreboard players operation y int += vec_y int
scoreboard players operation z_min int += vec_z int
scoreboard players operation z_max int += vec_z int

function vve:plane/_calc_chunk_range