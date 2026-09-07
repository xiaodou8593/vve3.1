#vve:solid_box/_detect_ball
# 球体检测实心方块地形
# 输入vve:ball{...}
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

execute store result score sstemp_r int run compute default float math:r_cube/_dist 10000
scoreboard players operation sstemp_r int -= vve_ball_r int
scoreboard players operation sstemp_r int *= -1 int
execute if score sstemp_r int matches ..0 run return fail

# 计算法向量