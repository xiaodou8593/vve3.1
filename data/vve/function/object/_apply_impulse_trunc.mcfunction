#vve:object/_apply_impulse_trunc
# 应用冲量响应
# 输入<mass,int>
# 输入<inertia,int,100>
# 输入impulse{...}
# 传入世界实体为执行者

# 输入位矢向量
scoreboard players operation vec_x int = impulse_x int
scoreboard players operation vec_y int = impulse_y int
scoreboard players operation vec_z int = impulse_z int
scoreboard players operation vec_x int -= x int
scoreboard players operation vec_y int -= y int
scoreboard players operation vec_z int -= z int
# 输入冲量向量
scoreboard players operation fvec_x int = impulse_fx int
scoreboard players operation fvec_y int = impulse_fy int
scoreboard players operation fvec_z int = impulse_fz int
# 计算叉乘
function math:vec/_cross_fvec

# 改变角速度
execute store result score vec_x int run compute default float vve:object/_apply_couple_x 10000
execute store result score vec_y int run compute default float vve:object/_apply_couple_y 10000
execute store result score vec_z int run compute default float vve:object/_apply_couple_z 10000
scoreboard players operation angular_x int += vec_x int
scoreboard players operation angular_y int += vec_y int
scoreboard players operation angular_z int += vec_z int
function vve:object/_set_angular

# 改变速度
scoreboard players operation sstemp_0 int = mass int
scoreboard players remove sstemp_0 int 1
execute if score fvec_x int matches ..-1 run scoreboard players operation fvec_x int += sstemp_0 int
execute if score fvec_y int matches ..-1 run scoreboard players operation fvec_y int += sstemp_0 int
execute if score fvec_z int matches ..-1 run scoreboard players operation fvec_z int += sstemp_0 int
scoreboard players operation fvec_x int /= mass int
scoreboard players operation fvec_y int /= mass int
scoreboard players operation fvec_z int /= mass int
scoreboard players operation vx int += fvec_x int
scoreboard players operation vy int += fvec_y int
scoreboard players operation vz int += fvec_z int