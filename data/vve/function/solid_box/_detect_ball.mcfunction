#vve:solid_box/_detect_ball
# 球体检测实心方块地形
# 输入vve:object.angular{...}
# 输入vve:ball{...}
# 输入速度大小<stemp_len,int,1w>
# 输入速度方向uvec{<uvec_x,int,1w>,<uvec_y,int,1w>,<uvec_z,int,1w>}
# 输出介质响应(各模块的临时对象)
# 输出<sstemp_s,int,1w>
# 输出<res,int>
# 传入世界实体为执行者

# 各模块响应信号重置
scoreboard players set shift_response int 0
scoreboard players set impulse_response int 0
scoreboard players set friction_response int 10000
scoreboard players set grab_layer_response int 0
scoreboard players set bounce_layer_response int 0
scoreboard players set material_response int 0
scoreboard players set surface_response int 0

scoreboard players operation sstemp_x int = vve_ball_x int
scoreboard players operation sstemp_y int = vve_ball_y int
scoreboard players operation sstemp_z int = vve_ball_z int
scoreboard players operation sstemp_x int -= vve_solid_box_x int
scoreboard players operation sstemp_y int -= vve_solid_box_y int
scoreboard players operation sstemp_z int -= vve_solid_box_z int

scoreboard players operation sstemp_a_1 int = a int
scoreboard players operation sstemp_r_1 int = r int
scoreboard players operation a int = vve_solid_box_l int
scoreboard players operation r int = vve_ball_r int

scoreboard players set sstemp_k0 int 0
scoreboard players set sstemp_k1 int 2147483647
scoreboard players set sstemp_k2 int 2147483647
scoreboard players set sstemp_k3 int 2147483647
scoreboard players set sstemp_k4 int 2147483647
scoreboard players set sstemp_k5 int 2147483647
scoreboard players set sstemp_k6 int 2147483647

# 计算初始k_i
execute unless score uvec_x int matches 0 run function math:r_cube/if_anchor/branch_8
execute unless score uvec_y int matches 0 run function math:r_cube/if_anchor/branch_9
execute unless score uvec_z int matches 0 run function math:r_cube/if_anchor/branch_10

# 手动冒泡排序
execute if score sstemp_k0 int > sstemp_k1 int run scoreboard players operation sstemp_k0 int >< sstemp_k1 int
execute if score sstemp_k1 int > sstemp_k2 int run scoreboard players operation sstemp_k1 int >< sstemp_k2 int
execute if score sstemp_k2 int > sstemp_k3 int run scoreboard players operation sstemp_k2 int >< sstemp_k3 int
execute if score sstemp_k3 int > sstemp_k4 int run scoreboard players operation sstemp_k3 int >< sstemp_k4 int
execute if score sstemp_k4 int > sstemp_k5 int run scoreboard players operation sstemp_k4 int >< sstemp_k5 int
execute if score sstemp_k5 int > sstemp_k6 int run scoreboard players operation sstemp_k5 int >< sstemp_k6 int
execute if score sstemp_k0 int > sstemp_k1 int run scoreboard players operation sstemp_k0 int >< sstemp_k1 int
execute if score sstemp_k1 int > sstemp_k2 int run scoreboard players operation sstemp_k1 int >< sstemp_k2 int
execute if score sstemp_k2 int > sstemp_k3 int run scoreboard players operation sstemp_k2 int >< sstemp_k3 int
execute if score sstemp_k3 int > sstemp_k4 int run scoreboard players operation sstemp_k3 int >< sstemp_k4 int
execute if score sstemp_k4 int > sstemp_k5 int run scoreboard players operation sstemp_k4 int >< sstemp_k5 int
execute if score sstemp_k0 int > sstemp_k1 int run scoreboard players operation sstemp_k0 int >< sstemp_k1 int
execute if score sstemp_k1 int > sstemp_k2 int run scoreboard players operation sstemp_k1 int >< sstemp_k2 int
execute if score sstemp_k2 int > sstemp_k3 int run scoreboard players operation sstemp_k2 int >< sstemp_k3 int
execute if score sstemp_k3 int > sstemp_k4 int run scoreboard players operation sstemp_k3 int >< sstemp_k4 int
execute if score sstemp_k0 int > sstemp_k1 int run scoreboard players operation sstemp_k0 int >< sstemp_k1 int
execute if score sstemp_k1 int > sstemp_k2 int run scoreboard players operation sstemp_k1 int >< sstemp_k2 int
execute if score sstemp_k2 int > sstemp_k3 int run scoreboard players operation sstemp_k2 int >< sstemp_k3 int
execute if score sstemp_k0 int > sstemp_k1 int run scoreboard players operation sstemp_k0 int >< sstemp_k1 int
execute if score sstemp_k1 int > sstemp_k2 int run scoreboard players operation sstemp_k1 int >< sstemp_k2 int
execute if score sstemp_k0 int > sstemp_k1 int run scoreboard players operation sstemp_k0 int >< sstemp_k1 int

scoreboard players set sstemp_min int 2147483647
scoreboard players set sstemp_max int -2147483648

scoreboard players operation sstemp_left int = sstemp_k0 int
scoreboard players operation sstemp_right int = sstemp_k1 int
function math:r_cube/if_anchor_iter

scoreboard players operation sstemp_left int = sstemp_k1 int
scoreboard players operation sstemp_right int = sstemp_k2 int
function math:r_cube/if_anchor_iter

scoreboard players operation sstemp_left int = sstemp_k2 int
scoreboard players operation sstemp_right int = sstemp_k3 int
function math:r_cube/if_anchor_iter

scoreboard players operation sstemp_left int = sstemp_k3 int
scoreboard players operation sstemp_right int = sstemp_k4 int
function math:r_cube/if_anchor_iter

scoreboard players operation sstemp_left int = sstemp_k4 int
scoreboard players operation sstemp_right int = sstemp_k5 int
function math:r_cube/if_anchor_iter

scoreboard players operation sstemp_left int = sstemp_k5 int
scoreboard players operation sstemp_right int = sstemp_k6 int
function math:r_cube/if_anchor_iter

scoreboard players operation sstemp_left int = sstemp_k6 int
scoreboard players set sstemp_right int 2147483647
function math:r_cube/if_anchor_iter

scoreboard players operation a int = sstemp_a_1 int
scoreboard players operation r int = sstemp_r_1 int

scoreboard players set res int 1
execute if score sstemp_min int > sstemp_max int run return run scoreboard players set res int 0
execute if score sstemp_min int > stemp_len int run return run scoreboard players set res int 0

# 入射点k输出到sstemp_s
scoreboard players operation sstemp_s int = sstemp_min int

execute store result score sstemp_sx int run compute default float vve:solid_box/_scale_sx
execute store result score sstemp_sy int run compute default float vve:solid_box/_scale_sy
execute store result score sstemp_sz int run compute default float vve:solid_box/_scale_sz
data modify storage vve:io stemp set compute default float vve:solid_box/_dist
execute store result score sstemp_r int run data get storage vve:io stemp 10000

# 计算法向量
execute if score sstemp_r int matches 0 run function vve:solid_box/detect_ball_inside
execute if score sstemp_r int matches 1.. run function vve:solid_box/detect_ball_outside

# 计算作用点和线速度
scoreboard players operation c_x int = sstemp_sx int
scoreboard players operation c_y int = sstemp_sy int
scoreboard players operation c_z int = sstemp_sz int
execute store result score sstemp_nx int run compute default float vve:solid_box/_scale_nx
execute store result score sstemp_ny int run compute default float vve:solid_box/_scale_ny
execute store result score sstemp_nz int run compute default float vve:solid_box/_scale_nz
scoreboard players operation c_x int -= sstemp_nx int
scoreboard players operation c_y int -= sstemp_ny int
scoreboard players operation c_z int -= sstemp_nz int
scoreboard players operation c_x int += vve_solid_box_x int
scoreboard players operation c_y int += vve_solid_box_y int
scoreboard players operation c_z int += vve_solid_box_z int
scoreboard players operation c_x int -= vve_ball_x int
scoreboard players operation c_y int -= vve_ball_y int
scoreboard players operation c_z int -= vve_ball_z int
execute store result score c_vx int run compute default float vve:solid_box/_calc_cx 10000
execute store result score c_vy int run compute default float vve:solid_box/_calc_cy 10000
execute store result score c_vz int run compute default float vve:solid_box/_calc_cz 10000
scoreboard players operation c_vx int += vve_ball_vx int
scoreboard players operation c_vy int += vve_ball_vy int
scoreboard players operation c_vz int += vve_ball_vz int
scoreboard players operation c_x int += vve_ball_x int
scoreboard players operation c_y int += vve_ball_y int
scoreboard players operation c_z int += vve_ball_z int

# 计算沿法线反方向的速度
execute store result score stemp_v int run compute default float vve:object/_calc_stemp_v -10000
execute if score stemp_v int matches ..-1 run return run \
	execute store result score res int run \
	scoreboard players set grab_layer_response int 0
# 附着层响应
execute if score grab_depth int <= grab_depth_max int if score stemp_v int <= grab_layer_v int run return run function vve:grab_layer/response
function vve:bounce_layer/response