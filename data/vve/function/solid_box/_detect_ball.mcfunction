#vve:solid_box/_detect_ball
# 球体检测实心方块地形
# 输入vve:ball{...}
# 输入速度vve:cpoint.velocity{<c_vx,int,1w>,<c_vy,int,1w>,<c_vz,int,1w>}
# 输入速度大小<stemp_len,int,1w>
# 输入速度方向uvec{<uvec_x,int,1w>,<uvec_y,int,1w>,<uvec_z,int,1w>}
# 输出介质响应(各模块的临时对象)
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

execute store result score sstemp_s int run compute default float vve:solid_box/_anchor_dot -10000
scoreboard players operation sstemp_s int > 0 int
scoreboard players operation sstemp_s int < stemp_len int
execute store result score sstemp_sx int run compute default float vve:solid_box/_scale_sx
execute store result score sstemp_sy int run compute default float vve:solid_box/_scale_sy
execute store result score sstemp_sz int run compute default float vve:solid_box/_scale_sz

data modify storage vve:io stemp set compute default float math:r_cube/_dist
execute store result score sstemp_r int run data get storage vve:io stemp 10000
execute if score sstemp_r int > vve_ball_r int run return fail

# 计算法向量
execute if score sstemp_r int matches 0 run function vve:solid_box/detect_ball_inside
execute if score sstemp_r int matches 1.. run function vve:solid_box/detect_ball_outside

# 计算沿法线反方向的速度
execute store result score stemp_v int run compute default float vve:object/_calc_stemp_v -10000
# 附着层响应
execute if score grab_depth int <= grab_depth_max int run return run function vve:grab_layer/response
function vve:bounce_layer/response