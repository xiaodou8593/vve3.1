#vve:plane/_calc_chunk_range
# 计算区块范围

scoreboard players operation chunk_x_min int = x_min int
scoreboard players operation chunk_z_min int = z_min int
scoreboard players operation chunk_x_max int = x_max int
scoreboard players operation chunk_z_max int = z_max int

scoreboard players operation chunk_x_min int /= 10000 int
scoreboard players operation chunk_x_max int /= 10000 int
scoreboard players operation chunk_z_min int /= 10000 int
scoreboard players operation chunk_z_max int /= 10000 int

scoreboard players operation chunk_x_min int /= 16 int
scoreboard players operation chunk_x_max int /= 16 int
scoreboard players operation chunk_z_min int /= 16 int
scoreboard players operation chunk_z_max int /= 16 int