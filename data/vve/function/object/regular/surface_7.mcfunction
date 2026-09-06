#vve:object/regular/surface_7

function math:quat/_to_iquat

# 变换cos
scoreboard players operation inp int = cos int
scoreboard players add inp int 10000
scoreboard players operation inp int > 0 int
scoreboard players operation inp int *= 5000 int
execute store result score quat_w int run compute default float math:_sqrt

# 计算从sstemp_n7到uvw的旋转四元数
scoreboard players operation fvec_x int = u int
scoreboard players operation fvec_y int = v int
scoreboard players operation fvec_z int = w int
scoreboard players operation u int += sstemp_n7_x int
scoreboard players operation v int += sstemp_n7_y int
scoreboard players operation w int += sstemp_n7_z int
data modify storage math:io sstemp_len set compute default float math:uvw/_norm_uvw_len
execute store result score vec_x int run compute default float math:uvw/_norm_uvw_x 10000
execute store result score vec_y int run compute default float math:uvw/_norm_uvw_y 10000
execute store result score vec_z int run compute default float math:uvw/_norm_uvw_z 10000
execute store result score quat_x int run compute default float math:vec/_cross_fvec_x 10000
execute store result score quat_y int run compute default float math:vec/_cross_fvec_y 10000
execute store result score quat_z int run compute default float math:vec/_cross_fvec_z 10000

function math:quat/_mult
function math:rquat/_to_quat