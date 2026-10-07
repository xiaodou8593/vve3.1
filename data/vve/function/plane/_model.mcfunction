#vve:plane/_model
# 使用临时对象构建数据模板
# 输出数据模板storage vve:io result

data modify storage vve:io result set value {y:0, range:[0.0d, 0.0d, 0.0d, 0.0d], chunk_range:[0.0d, 0.0d, 0.0d, 0.0d], base_layer:0, nvec:[0.0d, 0.0d, 0.0d]}

execute store result storage vve:io result.y double 0.0001 run scoreboard players get y int
execute store result storage vve:io result.range[0] double 0.0001 run scoreboard players get x_min int
execute store result storage vve:io result.range[1] double 0.0001 run scoreboard players get z_min int
execute store result storage vve:io result.range[2] double 0.0001 run scoreboard players get x_max int
execute store result storage vve:io result.range[3] double 0.0001 run scoreboard players get z_max int
execute store result storage vve:io result.chunk_range[0] double 1 run scoreboard players get chunk_x_min int
execute store result storage vve:io result.chunk_range[1] double 1 run scoreboard players get chunk_z_min int
execute store result storage vve:io result.chunk_range[2] double 1 run scoreboard players get chunk_x_max int
execute store result storage vve:io result.chunk_range[3] double 1 run scoreboard players get chunk_z_max int
execute store result storage vve:io result.base_layer double 0.0001 run scoreboard players get base_layer int
execute store result storage vve:io result.nvec[0] double 0.0001 run scoreboard players get nvec_x int
execute store result storage vve:io result.nvec[1] double 0.0001 run scoreboard players get nvec_y int
execute store result storage vve:io result.nvec[2] double 0.0001 run scoreboard players get nvec_z int