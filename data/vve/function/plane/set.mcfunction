#vve:plane/set
# vve:plane/_new调用

execute store result score @s y run data get storage vve:io input.y 10000
execute store result score @s x_min run data get storage vve:io input.range[0] 10000
execute store result score @s z_min run data get storage vve:io input.range[1] 10000
execute store result score @s x_max run data get storage vve:io input.range[2] 10000
execute store result score @s z_max run data get storage vve:io input.range[3] 10000
execute store result score @s chunk_x_min run data get storage vve:io input.chunk_range[0]
execute store result score @s chunk_z_min run data get storage vve:io input.chunk_range[1]
execute store result score @s chunk_x_max run data get storage vve:io input.chunk_range[2]
execute store result score @s chunk_z_max run data get storage vve:io input.chunk_range[3]
execute store result score @s base_layer run data get storage vve:io input.base_layer 10000
execute store result score @s nvec_x run data get storage vve:io input.nvec[0] 10000
execute store result score @s nvec_y run data get storage vve:io input.nvec[1] 10000
execute store result score @s nvec_z run data get storage vve:io input.nvec[2] 10000