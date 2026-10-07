#vve:plane/_proj
# 把数据模板投射到临时对象
# 输入数据模板storage vve:io input

execute store result score y int run data get storage vve:io input.y 10000
execute store result score x_min int run data get storage vve:io input.range[0] 10000
execute store result score z_min int run data get storage vve:io input.range[1] 10000
execute store result score x_max int run data get storage vve:io input.range[2] 10000
execute store result score z_max int run data get storage vve:io input.range[3] 10000
execute store result score chunk_x_min int run data get storage vve:io input.chunk_range[0]
execute store result score chunk_z_min int run data get storage vve:io input.chunk_range[1]
execute store result score chunk_x_max int run data get storage vve:io input.chunk_range[2]
execute store result score chunk_z_max int run data get storage vve:io input.chunk_range[3]
execute store result score base_layer int run data get storage vve:io input.base_layer 10000
execute store result score nvec_x int run data get storage vve:io input.nvec[0] 10000
execute store result score nvec_y int run data get storage vve:io input.nvec[1] 10000
execute store result score nvec_z int run data get storage vve:io input.nvec[2] 10000