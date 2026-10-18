#vve::euler_control/main_angular
# 欧拉角控制主程序
# 输入vve:object{...}
# 输出vve:object.angular_vec{...}
# 输出vve:object{<angular_len,int,100w>,quaternion{...}}
# 占用<res,int>
# 需要传入世界实体为执行者

scoreboard players set res int 0
function math:uvw/_to_euler
scoreboard players operation stemp_theta int = target_theta int
scoreboard players operation stemp_phi int = target_phi int
scoreboard players operation stemp_psi int = target_psi int
execute if score target_theta int matches -2147483648 run scoreboard players operation stemp_theta int = theta int
execute if score target_phi int matches -2147483648 run scoreboard players operation stemp_phi int = phi int
execute if score target_psi int matches -2147483648 run scoreboard players operation stemp_psi int = psi int

scoreboard players operation stemp_div int = vve_euler_b int
scoreboard players operation stemp_theta int -= theta int
scoreboard players operation stemp_theta int %= 3600000 int
execute if score stemp_theta int matches 1800000.. run scoreboard players remove stemp_theta int 3600000
execute if score stemp_theta int matches -30000..30000 run scoreboard players set stemp_div int 6
execute if score stemp_theta int matches -3000..3000 run scoreboard players add res int 1
scoreboard players operation stemp_theta int /= stemp_div int
scoreboard players operation stemp_min int = vve_euler_vmax int
scoreboard players operation stemp_min int *= -1 int
scoreboard players operation stemp_theta int > stemp_min int
scoreboard players operation stemp_theta int < vve_euler_vmax int

scoreboard players operation stemp_div int = vve_euler_b int
scoreboard players operation stemp_phi int -= phi int
scoreboard players operation stemp_phi int %= 3600000 int
execute if score stemp_phi int matches 1800000.. run scoreboard players remove stemp_phi int 3600000
execute if score stemp_phi int matches -30000..30000 run scoreboard players set stemp_div int 6
execute if score stemp_phi int matches -3000..3000 run scoreboard players add res int 1
scoreboard players operation stemp_phi int /= stemp_div int
scoreboard players operation stemp_min int = vve_euler_vmax int
scoreboard players operation stemp_min int *= -1 int
scoreboard players operation stemp_phi int > stemp_min int
scoreboard players operation stemp_phi int < vve_euler_vmax int

scoreboard players operation stemp_div int = vve_euler_b int
scoreboard players operation stemp_psi int -= psi int
scoreboard players operation stemp_psi int %= 3600000 int
execute if score stemp_psi int matches 1800000.. run scoreboard players remove stemp_psi int 3600000
execute if score stemp_psi int matches -30000..30000 run scoreboard players set stemp_div int 6
execute if score stemp_psi int matches -3000..3000 run scoreboard players add res int 1
scoreboard players operation stemp_psi int /= stemp_div int
scoreboard players operation stemp_min int = vve_euler_vmax int
scoreboard players operation stemp_min int *= -1 int
scoreboard players operation stemp_psi int > stemp_min int
scoreboard players operation stemp_psi int < vve_euler_vmax int

scoreboard players operation theta int += stemp_theta int
scoreboard players operation phi int += stemp_phi int
scoreboard players operation psi int += stemp_psi int

function math:euler/_to_quat_high
execute if score res int matches 3 run return run function vve:euler_control/converge
function math:quat_high/_right_mul_by_quat_c
function vve:object/angular/_quat_high_to