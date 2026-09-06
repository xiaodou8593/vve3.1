#vve:vehicle/_regular
# 规整化姿态，消除法向角速度
# 输入nvec{...}
# 输入storage vve:io result
# 输入receiver{...}
# 需要传入世界实体为执行者

# 补充列表
execute store result score temp_surface int if data storage vve:io shift_points[2]
data modify storage vve:io shift_points append from storage vve:io not_shift_points[]
data modify storage vve:io shift_origins append from storage vve:io not_shift_origins[]

# 第一个碰撞点转局部坐标
execute store result score vec_x int run data get storage vve:io shift_origins[0][0] 10000
execute store result score vec_y int run data get storage vve:io shift_origins[0][1] 10000
execute store result score vec_z int run data get storage vve:io shift_origins[0][2] 10000
function math:uvw/_vecto
scoreboard players operation stemp_u int = u int
scoreboard players operation stemp_v int = v int
scoreboard players operation stemp_w int = w int

# 叉乘计算表面法向量
execute store result score stemp_x int run data get storage vve:io shift_points[1][0] 10000
execute store result score stemp_y int run data get storage vve:io shift_points[1][1] 10000
execute store result score stemp_z int run data get storage vve:io shift_points[1][2] 10000
execute store result score vec_x int run data get storage vve:io shift_points[0][0] 10000
execute store result score vec_y int run data get storage vve:io shift_points[0][1] 10000
execute store result score vec_z int run data get storage vve:io shift_points[0][2] 10000
execute store result score fvec_x int run data get storage vve:io shift_points[2][0] 10000
execute store result score fvec_y int run data get storage vve:io shift_points[2][1] 10000
execute store result score fvec_z int run data get storage vve:io shift_points[2][2] 10000
scoreboard players operation vec_x int -= stemp_x int
scoreboard players operation vec_y int -= stemp_y int
scoreboard players operation vec_z int -= stemp_z int
scoreboard players operation fvec_x int -= stemp_x int
scoreboard players operation fvec_y int -= stemp_y int
scoreboard players operation fvec_z int -= stemp_z int
function math:vec/_cross_fvec
data modify storage math:io sstemp_len set compute default float math:vec/_norm_len
execute store result score vec_x int run compute default float math:vec/_norm_ux 10000
execute store result score vec_y int run compute default float math:vec/_norm_uy 10000
execute store result score vec_z int run compute default float math:vec/_norm_uz 10000
execute if score vec_x int matches 0 if score vec_y int matches 0 if score vec_z int matches 0 run scoreboard players set vec_z int 10000
scoreboard players operation nvec_x int *= vec_x int
scoreboard players operation nvec_y int *= vec_y int
scoreboard players operation nvec_z int *= vec_z int
scoreboard players operation nvec_x int += nvec_y int
scoreboard players operation nvec_x int += nvec_z int
scoreboard players set stemp_s int 1
execute if score nvec_x int matches ..-1 run scoreboard players set stemp_s int -1
scoreboard players operation nvec_x int = vec_x int
scoreboard players operation nvec_y int = vec_y int
scoreboard players operation nvec_z int = vec_z int
scoreboard players operation nvec_x int *= stemp_s int
scoreboard players operation nvec_y int *= stemp_s int
scoreboard players operation nvec_z int *= stemp_s int

function math:uvw/_nvec_to
scoreboard players set cos int -2147483648
# 设置各面法向量
scoreboard players set sstemp_n1_x int 10000
scoreboard players set sstemp_n1_y int 0
scoreboard players set sstemp_n1_z int 0

scoreboard players set sstemp_n2_x int -10000
scoreboard players set sstemp_n2_y int 0
scoreboard players set sstemp_n2_z int 0

scoreboard players set sstemp_n3_x int 0
scoreboard players set sstemp_n3_y int 10000
scoreboard players set sstemp_n3_z int 0

scoreboard players set sstemp_n4_x int 0
scoreboard players set sstemp_n4_y int -10000
scoreboard players set sstemp_n4_z int 0

scoreboard players set sstemp_n5_x int 0
scoreboard players set sstemp_n5_y int 0
scoreboard players set sstemp_n5_z int 10000

scoreboard players set sstemp_n6_x int 0
scoreboard players set sstemp_n6_y int 0
scoreboard players set sstemp_n6_z int -10000

# 与各面法向量点乘
execute store result score sstemp_d1 int run compute default float vve:object/regular/_dot_sstemp_n1 10000
execute store result score sstemp_d2 int run compute default float vve:object/regular/_dot_sstemp_n2 10000
execute store result score sstemp_d3 int run compute default float vve:object/regular/_dot_sstemp_n3 10000
execute store result score sstemp_d4 int run compute default float vve:object/regular/_dot_sstemp_n4 10000
execute store result score sstemp_d5 int run compute default float vve:object/regular/_dot_sstemp_n5 10000
execute store result score sstemp_d6 int run compute default float vve:object/regular/_dot_sstemp_n6 10000
scoreboard players operation cos int > sstemp_d1 int
scoreboard players operation cos int > sstemp_d2 int
scoreboard players operation cos int > sstemp_d3 int
scoreboard players operation cos int > sstemp_d4 int
scoreboard players operation cos int > sstemp_d5 int
scoreboard players operation cos int > sstemp_d6 int

# 选择贴合面
function vve:object/regular/branch_6

# 将旋转后的碰撞点对齐
scoreboard players operation u int = stemp_u int
scoreboard players operation v int = stemp_v int
scoreboard players operation w int = stemp_w int
function math:uvw/_tovec
execute store result score fvec_x int run data get storage vve:io shift_points[0][0] 10000
execute store result score fvec_y int run data get storage vve:io shift_points[0][1] 10000
execute store result score fvec_z int run data get storage vve:io shift_points[0][2] 10000
scoreboard players operation vec_x int -= fvec_x int
scoreboard players operation vec_y int -= fvec_y int
scoreboard players operation vec_z int -= fvec_z int
scoreboard players operation x int -= vec_x int
scoreboard players operation y int -= vec_y int
scoreboard players operation z int -= vec_z int

# 消除nvec方向的位移并施加
execute store result score inp int run compute default float vve:vehicle/_shift_dot_nvec 10000
execute store result score shift_x int run compute default float math:nvec/_scale_x 1000000
execute store result score shift_y int run compute default float math:nvec/_scale_y 1000000
execute store result score shift_z int run compute default float math:nvec/_scale_z 1000000
scoreboard players operation x int += shift_x int
scoreboard players operation y int += shift_y int
scoreboard players operation z int += shift_z int

# 消除角速度
execute if score temp_surface int matches 0 run return fail

function vve:object/_regular_angular