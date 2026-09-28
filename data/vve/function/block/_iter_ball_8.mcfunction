#vve:object/_iter_ball_8
# 球体介质探测算法
# 需要传入世界实体为执行者

# 计算速度大小和方向
function vve:object/velocity/_norm
execute store result score stemp_len int run data get storage math:io sstemp_len

scoreboard players operation c_mass int = mass int

# 开始接收介质响应
function vve:couple/_clear
function vve:object/_clear_receiver

scoreboard players set ball_receiver_sx int 0
scoreboard players set ball_receiver_sy int 0
scoreboard players set ball_receiver_sz int 0
scoreboard players set ball_receiver_res int 0

scoreboard players operation vve_ball_vx int = vx int
scoreboard players operation vve_ball_vy int = vy int
scoreboard players operation vve_ball_vz int = vz int
scoreboard players operation vve_ball_r int = a int
scoreboard players operation vve_ball_r int < 5000 int

scoreboard players operation sstemp_a int = vve_ball_r int
scoreboard players operation sstemp_a int *= -1 int
scoreboard players operation sstemp_a int *= 209 int
scoreboard players operation sstemp_a int /= 362 int
scoreboard players operation sstemp_a int += a int

# 相对坐标组成部分
execute store result score sstemp_kx int store result score sstemp_ky int \
	store result score sstemp_kz int store result score sstemp_jx int \
	store result score sstemp_jy int store result score sstemp_jz int \
	store result score sstemp_ix int store result score sstemp_iy int \
	run scoreboard players operation sstemp_iz int = sstemp_a int
scoreboard players operation sstemp_ix int *= ivec_x int
scoreboard players operation sstemp_iy int *= ivec_y int
scoreboard players operation sstemp_iz int *= ivec_z int
scoreboard players operation sstemp_jx int *= jvec_x int
scoreboard players operation sstemp_jy int *= jvec_y int
scoreboard players operation sstemp_jz int *= jvec_z int
scoreboard players operation sstemp_kx int *= kvec_x int
scoreboard players operation sstemp_ky int *= kvec_y int
scoreboard players operation sstemp_kz int *= kvec_z int
scoreboard players operation sstemp_ix int /= 10000 int
scoreboard players operation sstemp_iy int /= 10000 int
scoreboard players operation sstemp_iz int /= 10000 int
scoreboard players operation sstemp_jx int /= 10000 int
scoreboard players operation sstemp_jy int /= 10000 int
scoreboard players operation sstemp_jz int /= 10000 int
scoreboard players operation sstemp_kx int /= 10000 int
scoreboard players operation sstemp_ky int /= 10000 int
scoreboard players operation sstemp_kz int /= 10000 int

scoreboard players operation sstemp_bx int = x int
scoreboard players operation sstemp_by int = y int
scoreboard players operation sstemp_bz int = z int
scoreboard players operation sstemp_bx int += sstemp_ix int
scoreboard players operation sstemp_by int += sstemp_iy int
scoreboard players operation sstemp_bz int += sstemp_iz int
scoreboard players operation sstemp_bx int += sstemp_jx int
scoreboard players operation sstemp_by int += sstemp_jy int
scoreboard players operation sstemp_bz int += sstemp_jz int
scoreboard players operation sstemp_bx int += sstemp_kx int
scoreboard players operation sstemp_by int += sstemp_ky int
scoreboard players operation sstemp_bz int += sstemp_kz int

scoreboard players operation sstemp_ix int *= 2 int
scoreboard players operation sstemp_iy int *= 2 int
scoreboard players operation sstemp_iz int *= 2 int
scoreboard players operation sstemp_jx int *= 2 int
scoreboard players operation sstemp_jy int *= 2 int
scoreboard players operation sstemp_jz int *= 2 int
scoreboard players operation sstemp_kx int *= 2 int
scoreboard players operation sstemp_ky int *= 2 int
scoreboard players operation sstemp_kz int *= 2 int

# 顶点1
execute store result score stemp_x_mod int store result score stemp_x int run scoreboard players operation vve_ball_x int = sstemp_bx int
execute store result score stemp_y_mod int store result score stemp_y int run scoreboard players operation vve_ball_y int = sstemp_by int
execute store result score stemp_z_mod int store result score stemp_z int run scoreboard players operation vve_ball_z int = sstemp_bz int
scoreboard players operation vve_ball_x int -= vx int
scoreboard players operation vve_ball_y int -= vy int
scoreboard players operation vve_ball_z int -= vz int
scoreboard players operation stemp_x_mod int %= 10000 int
scoreboard players operation stemp_y_mod int %= 10000 int
scoreboard players operation stemp_z_mod int %= 10000 int
execute if score stemp_x_mod int matches 5000.. run scoreboard players remove stemp_x_mod int 10000
execute if score stemp_y_mod int matches 5000.. run scoreboard players remove stemp_y_mod int 10000
execute if score stemp_z_mod int matches 5000.. run scoreboard players remove stemp_z_mod int 10000
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players operation stemp_x int -= stemp_x_mod int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players operation stemp_y int -= stemp_y_mod int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players operation stemp_z int -= stemp_z_mod int
data modify entity @s Pos set from storage math:io xyz
execute at @s run function vve:block/iter_ball/detect_block

# 顶点2
scoreboard players operation sstemp_bx int -= sstemp_ix int
scoreboard players operation sstemp_by int -= sstemp_iy int
scoreboard players operation sstemp_bz int -= sstemp_iz int
execute store result score stemp_x_mod int store result score stemp_x int run scoreboard players operation vve_ball_x int = sstemp_bx int
execute store result score stemp_y_mod int store result score stemp_y int run scoreboard players operation vve_ball_y int = sstemp_by int
execute store result score stemp_z_mod int store result score stemp_z int run scoreboard players operation vve_ball_z int = sstemp_bz int
scoreboard players operation vve_ball_x int -= vx int
scoreboard players operation vve_ball_y int -= vy int
scoreboard players operation vve_ball_z int -= vz int
scoreboard players operation stemp_x_mod int %= 10000 int
scoreboard players operation stemp_y_mod int %= 10000 int
scoreboard players operation stemp_z_mod int %= 10000 int
execute if score stemp_x_mod int matches 5000.. run scoreboard players remove stemp_x_mod int 10000
execute if score stemp_y_mod int matches 5000.. run scoreboard players remove stemp_y_mod int 10000
execute if score stemp_z_mod int matches 5000.. run scoreboard players remove stemp_z_mod int 10000
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players operation stemp_x int -= stemp_x_mod int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players operation stemp_y int -= stemp_y_mod int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players operation stemp_z int -= stemp_z_mod int
data modify entity @s Pos set from storage math:io xyz
execute at @s run function vve:block/iter_ball/detect_block

# 顶点3
scoreboard players operation sstemp_bx int -= sstemp_kx int
scoreboard players operation sstemp_by int -= sstemp_ky int
scoreboard players operation sstemp_bz int -= sstemp_kz int
execute store result score stemp_x_mod int store result score stemp_x int run scoreboard players operation vve_ball_x int = sstemp_bx int
execute store result score stemp_y_mod int store result score stemp_y int run scoreboard players operation vve_ball_y int = sstemp_by int
execute store result score stemp_z_mod int store result score stemp_z int run scoreboard players operation vve_ball_z int = sstemp_bz int
scoreboard players operation vve_ball_x int -= vx int
scoreboard players operation vve_ball_y int -= vy int
scoreboard players operation vve_ball_z int -= vz int
scoreboard players operation stemp_x_mod int %= 10000 int
scoreboard players operation stemp_y_mod int %= 10000 int
scoreboard players operation stemp_z_mod int %= 10000 int
execute if score stemp_x_mod int matches 5000.. run scoreboard players remove stemp_x_mod int 10000
execute if score stemp_y_mod int matches 5000.. run scoreboard players remove stemp_y_mod int 10000
execute if score stemp_z_mod int matches 5000.. run scoreboard players remove stemp_z_mod int 10000
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players operation stemp_x int -= stemp_x_mod int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players operation stemp_y int -= stemp_y_mod int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players operation stemp_z int -= stemp_z_mod int
data modify entity @s Pos set from storage math:io xyz
execute at @s run function vve:block/iter_ball/detect_block

# 顶点4
scoreboard players operation sstemp_bx int += sstemp_ix int
scoreboard players operation sstemp_by int += sstemp_iy int
scoreboard players operation sstemp_bz int += sstemp_iz int
execute store result score stemp_x_mod int store result score stemp_x int run scoreboard players operation vve_ball_x int = sstemp_bx int
execute store result score stemp_y_mod int store result score stemp_y int run scoreboard players operation vve_ball_y int = sstemp_by int
execute store result score stemp_z_mod int store result score stemp_z int run scoreboard players operation vve_ball_z int = sstemp_bz int
scoreboard players operation vve_ball_x int -= vx int
scoreboard players operation vve_ball_y int -= vy int
scoreboard players operation vve_ball_z int -= vz int
scoreboard players operation stemp_x_mod int %= 10000 int
scoreboard players operation stemp_y_mod int %= 10000 int
scoreboard players operation stemp_z_mod int %= 10000 int
execute if score stemp_x_mod int matches 5000.. run scoreboard players remove stemp_x_mod int 10000
execute if score stemp_y_mod int matches 5000.. run scoreboard players remove stemp_y_mod int 10000
execute if score stemp_z_mod int matches 5000.. run scoreboard players remove stemp_z_mod int 10000
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players operation stemp_x int -= stemp_x_mod int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players operation stemp_y int -= stemp_y_mod int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players operation stemp_z int -= stemp_z_mod int
data modify entity @s Pos set from storage math:io xyz
execute at @s run function vve:block/iter_ball/detect_block

# 顶点5
scoreboard players operation sstemp_bx int -= sstemp_jx int
scoreboard players operation sstemp_by int -= sstemp_jy int
scoreboard players operation sstemp_bz int -= sstemp_jz int
execute store result score stemp_x_mod int store result score stemp_x int run scoreboard players operation vve_ball_x int = sstemp_bx int
execute store result score stemp_y_mod int store result score stemp_y int run scoreboard players operation vve_ball_y int = sstemp_by int
execute store result score stemp_z_mod int store result score stemp_z int run scoreboard players operation vve_ball_z int = sstemp_bz int
scoreboard players operation vve_ball_x int -= vx int
scoreboard players operation vve_ball_y int -= vy int
scoreboard players operation vve_ball_z int -= vz int
scoreboard players operation stemp_x_mod int %= 10000 int
scoreboard players operation stemp_y_mod int %= 10000 int
scoreboard players operation stemp_z_mod int %= 10000 int
execute if score stemp_x_mod int matches 5000.. run scoreboard players remove stemp_x_mod int 10000
execute if score stemp_y_mod int matches 5000.. run scoreboard players remove stemp_y_mod int 10000
execute if score stemp_z_mod int matches 5000.. run scoreboard players remove stemp_z_mod int 10000
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players operation stemp_x int -= stemp_x_mod int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players operation stemp_y int -= stemp_y_mod int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players operation stemp_z int -= stemp_z_mod int
data modify entity @s Pos set from storage math:io xyz
execute at @s run function vve:block/iter_ball/detect_block

# 顶点6
scoreboard players operation sstemp_bx int += sstemp_kx int
scoreboard players operation sstemp_by int += sstemp_ky int
scoreboard players operation sstemp_bz int += sstemp_kz int
execute store result score stemp_x_mod int store result score stemp_x int run scoreboard players operation vve_ball_x int = sstemp_bx int
execute store result score stemp_y_mod int store result score stemp_y int run scoreboard players operation vve_ball_y int = sstemp_by int
execute store result score stemp_z_mod int store result score stemp_z int run scoreboard players operation vve_ball_z int = sstemp_bz int
scoreboard players operation vve_ball_x int -= vx int
scoreboard players operation vve_ball_y int -= vy int
scoreboard players operation vve_ball_z int -= vz int
scoreboard players operation stemp_x_mod int %= 10000 int
scoreboard players operation stemp_y_mod int %= 10000 int
scoreboard players operation stemp_z_mod int %= 10000 int
execute if score stemp_x_mod int matches 5000.. run scoreboard players remove stemp_x_mod int 10000
execute if score stemp_y_mod int matches 5000.. run scoreboard players remove stemp_y_mod int 10000
execute if score stemp_z_mod int matches 5000.. run scoreboard players remove stemp_z_mod int 10000
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players operation stemp_x int -= stemp_x_mod int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players operation stemp_y int -= stemp_y_mod int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players operation stemp_z int -= stemp_z_mod int
data modify entity @s Pos set from storage math:io xyz
execute at @s run function vve:block/iter_ball/detect_block

# 顶点7
scoreboard players operation sstemp_bx int -= sstemp_ix int
scoreboard players operation sstemp_by int -= sstemp_iy int
scoreboard players operation sstemp_bz int -= sstemp_iz int
execute store result score stemp_x_mod int store result score stemp_x int run scoreboard players operation vve_ball_x int = sstemp_bx int
execute store result score stemp_y_mod int store result score stemp_y int run scoreboard players operation vve_ball_y int = sstemp_by int
execute store result score stemp_z_mod int store result score stemp_z int run scoreboard players operation vve_ball_z int = sstemp_bz int
scoreboard players operation vve_ball_x int -= vx int
scoreboard players operation vve_ball_y int -= vy int
scoreboard players operation vve_ball_z int -= vz int
scoreboard players operation stemp_x_mod int %= 10000 int
scoreboard players operation stemp_y_mod int %= 10000 int
scoreboard players operation stemp_z_mod int %= 10000 int
execute if score stemp_x_mod int matches 5000.. run scoreboard players remove stemp_x_mod int 10000
execute if score stemp_y_mod int matches 5000.. run scoreboard players remove stemp_y_mod int 10000
execute if score stemp_z_mod int matches 5000.. run scoreboard players remove stemp_z_mod int 10000
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players operation stemp_x int -= stemp_x_mod int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players operation stemp_y int -= stemp_y_mod int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players operation stemp_z int -= stemp_z_mod int
data modify entity @s Pos set from storage math:io xyz
execute at @s run function vve:block/iter_ball/detect_block

# 顶点8
scoreboard players operation sstemp_bx int -= sstemp_kx int
scoreboard players operation sstemp_by int -= sstemp_ky int
scoreboard players operation sstemp_bz int -= sstemp_kz int
execute store result score stemp_x_mod int store result score stemp_x int run scoreboard players operation vve_ball_x int = sstemp_bx int
execute store result score stemp_y_mod int store result score stemp_y int run scoreboard players operation vve_ball_y int = sstemp_by int
execute store result score stemp_z_mod int store result score stemp_z int run scoreboard players operation vve_ball_z int = sstemp_bz int
scoreboard players operation vve_ball_x int -= vx int
scoreboard players operation vve_ball_y int -= vy int
scoreboard players operation vve_ball_z int -= vz int
scoreboard players operation stemp_x_mod int %= 10000 int
scoreboard players operation stemp_y_mod int %= 10000 int
scoreboard players operation stemp_z_mod int %= 10000 int
execute if score stemp_x_mod int matches 5000.. run scoreboard players remove stemp_x_mod int 10000
execute if score stemp_y_mod int matches 5000.. run scoreboard players remove stemp_y_mod int 10000
execute if score stemp_z_mod int matches 5000.. run scoreboard players remove stemp_z_mod int 10000
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players operation stemp_x int -= stemp_x_mod int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players operation stemp_y int -= stemp_y_mod int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players operation stemp_z int -= stemp_z_mod int
data modify entity @s Pos set from storage math:io xyz
execute at @s run function vve:block/iter_ball/detect_block

# 结束接受介质响应
function vve:object/_receive_over
function vve:couple/_add_over

# 位置回退
execute if score ball_receiver_res int matches 1 run function vve:object/iter_ball/move_back

# 区块安全
tp @s 0 0 0