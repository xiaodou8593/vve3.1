#vve:bounce_layer/response
# 可复用

# 实心层反弹
scoreboard players set bounce_layer_response int 1
# 取消附着层响应
scoreboard players set grab_layer_response int 0

# 摩擦响应
scoreboard players operation friction_response int = vve_solid_friction int

# 位移至特定深度
scoreboard players set shift_response int 1
scoreboard players operation stemp_depth int = grab_depth int
scoreboard players operation stemp_depth int -= grab_depth_mid int
scoreboard players operation shift_x int = nvec_x int
scoreboard players operation shift_y int = nvec_y int
scoreboard players operation shift_z int = nvec_z int
scoreboard players operation shift_x int *= stemp_depth int
scoreboard players operation shift_y int *= stemp_depth int
scoreboard players operation shift_z int *= stemp_depth int
scoreboard players operation shift_x int /= 10000 int
scoreboard players operation shift_y int /= 10000 int
scoreboard players operation shift_z int /= 10000 int

# 脱离速度忽略
execute if score stemp_v int matches ..-1 run return fail

# 施加反弹冲量
scoreboard players set impulse_response int 1
scoreboard players operation impulse_x int = c_x int
scoreboard players operation impulse_y int = c_y int
scoreboard players operation impulse_z int = c_z int
scoreboard players operation sstemp_x int = nvec_x int
scoreboard players operation sstemp_y int = nvec_y int
scoreboard players operation sstemp_z int = nvec_z int
scoreboard players operation sstemp_x int *= stemp_v int
scoreboard players operation sstemp_y int *= stemp_v int
scoreboard players operation sstemp_z int *= stemp_v int
scoreboard players operation sstemp_x int /= vve_solid_bounce_inv int
scoreboard players operation sstemp_y int /= vve_solid_bounce_inv int
scoreboard players operation sstemp_z int /= vve_solid_bounce_inv int
scoreboard players operation sstemp_x int *= c_mass int
scoreboard players operation sstemp_y int *= c_mass int
scoreboard players operation sstemp_z int *= c_mass int

# 施加切向摩擦力
scoreboard players operation impulse_fx int = c_vx int
scoreboard players operation impulse_fy int = c_vy int
scoreboard players operation impulse_fz int = c_vz int
scoreboard players operation impulse_fx int *= nvec_x int
scoreboard players operation impulse_fy int *= nvec_y int
scoreboard players operation impulse_fz int *= nvec_z int
scoreboard players operation impulse_fz int += impulse_fx int
scoreboard players operation impulse_fz int += impulse_fy int
execute store result score impulse_fx int store result score impulse_fy int run scoreboard players operation impulse_fz int /= 10000 int
scoreboard players operation impulse_fx int *= nvec_x int
scoreboard players operation impulse_fy int *= nvec_y int
scoreboard players operation impulse_fz int *= nvec_z int
scoreboard players operation impulse_fx int /= -10000 int
scoreboard players operation impulse_fy int /= -10000 int
scoreboard players operation impulse_fz int /= -10000 int
scoreboard players operation impulse_fx int += c_vx int
scoreboard players operation impulse_fy int += c_vy int
scoreboard players operation impulse_fz int += c_vz int
scoreboard players operation sstemp_k int = vve_solid_friction_tan int
scoreboard players remove sstemp_k int 10000
scoreboard players operation impulse_fx int *= sstemp_k int
scoreboard players operation impulse_fy int *= sstemp_k int
scoreboard players operation impulse_fz int *= sstemp_k int
scoreboard players operation impulse_fx int /= 10000 int
scoreboard players operation impulse_fy int /= 10000 int
scoreboard players operation impulse_fz int /= 10000 int
scoreboard players operation impulse_fx int *= c_mass int
scoreboard players operation impulse_fy int *= c_mass int
scoreboard players operation impulse_fz int *= c_mass int

scoreboard players operation impulse_fx int += sstemp_x int
scoreboard players operation impulse_fy int += sstemp_y int
scoreboard players operation impulse_fz int += sstemp_z int