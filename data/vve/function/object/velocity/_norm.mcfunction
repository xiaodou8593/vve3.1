#vve:object/velocity/_norm
# 单位化速度向量
# 输出uvec{<uvec_x,int>,<uvec_y,int>,<uvec_z,int>}
# 输出storage math:io sstemp_len

data modify storage math:io sstemp_len set compute default float vve:object/velocity/_norm_len
execute store result score uvec_x int run compute default float vve:object/velocity/_norm_ux 10000
execute store result score uvec_y int run compute default float vve:object/velocity/_norm_uy 10000
execute store result score uvec_z int run compute default float vve:object/velocity/_norm_uz 10000
execute if score uvec_x int matches 0 if score uvec_y int matches 0 if score uvec_z int matches 0 run scoreboard players set uvec_z int 10000