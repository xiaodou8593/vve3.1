#vve:test/np_norm_ssloop
# vve:test/np_norm_sloop调用

scoreboard players operation angular_x int = loop int
scoreboard players operation angular_y int = sloop int
scoreboard players operation angular_z int = ssloop int
execute if score angular_x int matches 0 if score angular_y int matches 0 if score angular_z int matches 0 run scoreboard players set angular_z int 1
data modify storage vve:io sstemp_len set compute default float vve:object/_angular_len
execute store result score angular_len int run data get storage vve:io sstemp_len
execute store result score uvec_x int run compute default float vve:object/_angular_ux 10000
execute store result score uvec_y int run compute default float vve:object/_angular_uy 10000
execute store result score uvec_z int run compute default float vve:object/_angular_uz 10000
scoreboard players operation uvec_x int *= uvec_x int
scoreboard players operation uvec_y int *= uvec_y int
scoreboard players operation uvec_z int *= uvec_z int
scoreboard players operation uvec_x int += uvec_y int
scoreboard players operation uvec_x int += uvec_z int
scoreboard players operation max int > uvec_x int
scoreboard players operation min int < uvec_x int

scoreboard players add ssloop int 1
execute if score ssloop int <= stemp_max int run function vve:test/np_norm_ssloop