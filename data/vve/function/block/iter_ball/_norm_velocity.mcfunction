#vve:block/iter_ball/_norm_velocity
# 单位化速度向量
# 输入{<sstemp_bvx,int,1w>,<sstemp_bvy,int,1w>,<sstemp_bvz,int,1w>}
# 输出uvec{<uvec_x,int>,<uvec_y,int>,<uvec_z,int>}
# 输出storage math:io sstemp_len
# 输出<stemp_len,int,1w>

data modify storage math:io sstemp_len set compute default float vve:block/iter_ball/_norm_len
execute store result score uvec_x int run compute default float vve:block/iter_ball/_norm_ux 10000
execute store result score uvec_y int run compute default float vve:block/iter_ball/_norm_uy 10000
execute store result score uvec_z int run compute default float vve:block/iter_ball/_norm_uz 10000
execute if score uvec_x int matches 0 if score uvec_y int matches 0 if score uvec_z int matches 0 run scoreboard players set uvec_z int 10000
execute store result score stemp_len int run data get storage math:io sstemp_len