#vve:object/_iter_ball_8
# 球体介质探测算法
# 需要传入世界实体为执行者

scoreboard players operation c_mass int = mass int

# 开始接收介质响应
function vve:couple/_clear
function vve:object/_clear_receiver

scoreboard players set ball_receiver_sx int 0
scoreboard players set ball_receiver_sy int 0
scoreboard players set ball_receiver_sz int 0
scoreboard players set ball_receiver_res int 0

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
execute if score sstemp_ix int matches ..-1 run scoreboard players add sstemp_ix int 9999
execute if score sstemp_iy int matches ..-1 run scoreboard players add sstemp_iy int 9999
execute if score sstemp_iz int matches ..-1 run scoreboard players add sstemp_iz int 9999
execute if score sstemp_jx int matches ..-1 run scoreboard players add sstemp_jx int 9999
execute if score sstemp_jy int matches ..-1 run scoreboard players add sstemp_jy int 9999
execute if score sstemp_jz int matches ..-1 run scoreboard players add sstemp_jz int 9999
execute if score sstemp_kx int matches ..-1 run scoreboard players add sstemp_kx int 9999
execute if score sstemp_ky int matches ..-1 run scoreboard players add sstemp_ky int 9999
execute if score sstemp_kz int matches ..-1 run scoreboard players add sstemp_kz int 9999
execute store result score sstemp_rx int run scoreboard players operation sstemp_ix int /= 10000 int
execute store result score sstemp_ry int run scoreboard players operation sstemp_iy int /= 10000 int
execute store result score sstemp_rz int run scoreboard players operation sstemp_iz int /= 10000 int
execute store result score sstemp_sx int run scoreboard players operation sstemp_jx int /= 10000 int
execute store result score sstemp_sy int run scoreboard players operation sstemp_jy int /= 10000 int
execute store result score sstemp_sz int run scoreboard players operation sstemp_jz int /= 10000 int
execute store result score sstemp_tx int run scoreboard players operation sstemp_kx int /= 10000 int
execute store result score sstemp_ty int run scoreboard players operation sstemp_ky int /= 10000 int
execute store result score sstemp_tz int run scoreboard players operation sstemp_kz int /= 10000 int

# 线速度叉乘计算
execute store result score sstempx int run compute default float vve:object/_liner_rx 10000
execute store result score sstempy int run compute default float vve:object/_liner_ry 10000
execute store result score sstemp_rz int run compute default float vve:object/_liner_rz 10000
scoreboard players operation sstemp_rx int = sstempx int
scoreboard players operation sstemp_ry int = sstempy int

execute store result score sstempx int run compute default float vve:object/_liner_sx 10000
execute store result score sstempy int run compute default float vve:object/_liner_sy 10000
execute store result score sstemp_sz int run compute default float vve:object/_liner_sz 10000
scoreboard players operation sstemp_sx int = sstempx int
scoreboard players operation sstemp_sy int = sstempy int

execute store result score sstempx int run compute default float vve:object/_liner_tx 10000
execute store result score sstempy int run compute default float vve:object/_liner_ty 10000
execute store result score sstemp_tz int run compute default float vve:object/_liner_tz 10000
scoreboard players operation sstemp_tx int = sstempx int
scoreboard players operation sstemp_ty int = sstempy int

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

scoreboard players operation sstemp_bvx int = vx int
scoreboard players operation sstemp_bvy int = vy int
scoreboard players operation sstemp_bvz int = vz int
scoreboard players operation sstemp_bvx int += sstemp_rx int
scoreboard players operation sstemp_bvy int += sstemp_ry int
scoreboard players operation sstemp_bvz int += sstemp_rz int
scoreboard players operation sstemp_bvx int += sstemp_sx int
scoreboard players operation sstemp_bvy int += sstemp_sy int
scoreboard players operation sstemp_bvz int += sstemp_sz int
scoreboard players operation sstemp_bvx int += sstemp_tx int
scoreboard players operation sstemp_bvy int += sstemp_ty int
scoreboard players operation sstemp_bvz int += sstemp_tz int

scoreboard players operation sstemp_ix int *= 2 int
scoreboard players operation sstemp_iy int *= 2 int
scoreboard players operation sstemp_iz int *= 2 int
scoreboard players operation sstemp_jx int *= 2 int
scoreboard players operation sstemp_jy int *= 2 int
scoreboard players operation sstemp_jz int *= 2 int
scoreboard players operation sstemp_kx int *= 2 int
scoreboard players operation sstemp_ky int *= 2 int
scoreboard players operation sstemp_kz int *= 2 int
scoreboard players operation sstemp_rx int *= 2 int
scoreboard players operation sstemp_ry int *= 2 int
scoreboard players operation sstemp_rz int *= 2 int
scoreboard players operation sstemp_sx int *= 2 int
scoreboard players operation sstemp_sy int *= 2 int
scoreboard players operation sstemp_sz int *= 2 int
scoreboard players operation sstemp_tx int *= 2 int
scoreboard players operation sstemp_ty int *= 2 int
scoreboard players operation sstemp_tz int *= 2 int

# 顶点1
execute if score test_n int matches 16 run tellraw @a "ball 1"
function vve:block/iter_ball/_norm_velocity
scoreboard players operation vve_ball_vx int = sstemp_bvx int
scoreboard players operation vve_ball_vy int = sstemp_bvy int
scoreboard players operation vve_ball_vz int = sstemp_bvz int
execute store result score stemp_x_mod int store result score stemp_x int run scoreboard players operation vve_ball_x int = sstemp_bx int
execute store result score stemp_y_mod int store result score stemp_y int run scoreboard players operation vve_ball_y int = sstemp_by int
execute store result score stemp_z_mod int store result score stemp_z int run scoreboard players operation vve_ball_z int = sstemp_bz int
scoreboard players operation vve_ball_x int -= sstemp_bvx int
scoreboard players operation vve_ball_y int -= sstemp_bvy int
scoreboard players operation vve_ball_z int -= sstemp_bvz int
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
#execute if score test_n int matches 16 run function vve:impulse/_print
#execute if score test_n int matches 16 run function vve:couple/_print

# 顶点2
execute if score test_n int matches 16 run tellraw @a "ball 2"
scoreboard players operation sstemp_bx int -= sstemp_ix int
scoreboard players operation sstemp_by int -= sstemp_iy int
scoreboard players operation sstemp_bz int -= sstemp_iz int
scoreboard players operation sstemp_bvx int -= sstemp_rx int
scoreboard players operation sstemp_bvy int -= sstemp_ry int
scoreboard players operation sstemp_bvz int -= sstemp_rz int
function vve:block/iter_ball/_norm_velocity
scoreboard players operation vve_ball_vx int = sstemp_bvx int
scoreboard players operation vve_ball_vy int = sstemp_bvy int
scoreboard players operation vve_ball_vz int = sstemp_bvz int
execute store result score stemp_x_mod int store result score stemp_x int run scoreboard players operation vve_ball_x int = sstemp_bx int
execute store result score stemp_y_mod int store result score stemp_y int run scoreboard players operation vve_ball_y int = sstemp_by int
execute store result score stemp_z_mod int store result score stemp_z int run scoreboard players operation vve_ball_z int = sstemp_bz int
scoreboard players operation vve_ball_x int -= sstemp_bvx int
scoreboard players operation vve_ball_y int -= sstemp_bvy int
scoreboard players operation vve_ball_z int -= sstemp_bvz int
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
#execute if score test_n int matches 16 run function vve:impulse/_print
#execute if score test_n int matches 16 run function vve:couple/_print

# 顶点3
execute if score test_n int matches 16 run tellraw @a "ball 3"
scoreboard players operation sstemp_bx int -= sstemp_kx int
scoreboard players operation sstemp_by int -= sstemp_ky int
scoreboard players operation sstemp_bz int -= sstemp_kz int
scoreboard players operation sstemp_bvx int -= sstemp_tx int
scoreboard players operation sstemp_bvy int -= sstemp_ty int
scoreboard players operation sstemp_bvz int -= sstemp_tz int
function vve:block/iter_ball/_norm_velocity
scoreboard players operation vve_ball_vx int = sstemp_bvx int
scoreboard players operation vve_ball_vy int = sstemp_bvy int
scoreboard players operation vve_ball_vz int = sstemp_bvz int
execute store result score stemp_x_mod int store result score stemp_x int run scoreboard players operation vve_ball_x int = sstemp_bx int
execute store result score stemp_y_mod int store result score stemp_y int run scoreboard players operation vve_ball_y int = sstemp_by int
execute store result score stemp_z_mod int store result score stemp_z int run scoreboard players operation vve_ball_z int = sstemp_bz int
scoreboard players operation vve_ball_x int -= sstemp_bvx int
scoreboard players operation vve_ball_y int -= sstemp_bvy int
scoreboard players operation vve_ball_z int -= sstemp_bvz int
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
#execute if score test_n int matches 16 run function vve:impulse/_print
#execute if score test_n int matches 16 run function vve:couple/_print

# 顶点4
execute if score test_n int matches 16 run tellraw @a "ball 4"
scoreboard players operation sstemp_bx int += sstemp_ix int
scoreboard players operation sstemp_by int += sstemp_iy int
scoreboard players operation sstemp_bz int += sstemp_iz int
scoreboard players operation sstemp_bvx int += sstemp_rx int
scoreboard players operation sstemp_bvy int += sstemp_ry int
scoreboard players operation sstemp_bvz int += sstemp_rz int
function vve:block/iter_ball/_norm_velocity
scoreboard players operation vve_ball_vx int = sstemp_bvx int
scoreboard players operation vve_ball_vy int = sstemp_bvy int
scoreboard players operation vve_ball_vz int = sstemp_bvz int
execute store result score stemp_x_mod int store result score stemp_x int run scoreboard players operation vve_ball_x int = sstemp_bx int
execute store result score stemp_y_mod int store result score stemp_y int run scoreboard players operation vve_ball_y int = sstemp_by int
execute store result score stemp_z_mod int store result score stemp_z int run scoreboard players operation vve_ball_z int = sstemp_bz int
scoreboard players operation vve_ball_x int -= sstemp_bvx int
scoreboard players operation vve_ball_y int -= sstemp_bvy int
scoreboard players operation vve_ball_z int -= sstemp_bvz int
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
#execute if score test_n int matches 16 run function vve:impulse/_print
#execute if score test_n int matches 16 run function vve:couple/_print

# 顶点5
execute if score test_n int matches 16 run tellraw @a "ball 5"
scoreboard players operation sstemp_bx int -= sstemp_jx int
scoreboard players operation sstemp_by int -= sstemp_jy int
scoreboard players operation sstemp_bz int -= sstemp_jz int
scoreboard players operation sstemp_bvx int -= sstemp_sx int
scoreboard players operation sstemp_bvy int -= sstemp_sy int
scoreboard players operation sstemp_bvz int -= sstemp_sz int
function vve:block/iter_ball/_norm_velocity
scoreboard players operation vve_ball_vx int = sstemp_bvx int
scoreboard players operation vve_ball_vy int = sstemp_bvy int
scoreboard players operation vve_ball_vz int = sstemp_bvz int
execute store result score stemp_x_mod int store result score stemp_x int run scoreboard players operation vve_ball_x int = sstemp_bx int
execute store result score stemp_y_mod int store result score stemp_y int run scoreboard players operation vve_ball_y int = sstemp_by int
execute store result score stemp_z_mod int store result score stemp_z int run scoreboard players operation vve_ball_z int = sstemp_bz int
scoreboard players operation vve_ball_x int -= sstemp_bvx int
scoreboard players operation vve_ball_y int -= sstemp_bvy int
scoreboard players operation vve_ball_z int -= sstemp_bvz int
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
#execute if score test_n int matches 16 run function vve:impulse/_print
#execute if score test_n int matches 16 run function vve:couple/_print

# 顶点6
execute if score test_n int matches 16 run tellraw @a "ball 6"
scoreboard players operation sstemp_bx int += sstemp_kx int
scoreboard players operation sstemp_by int += sstemp_ky int
scoreboard players operation sstemp_bz int += sstemp_kz int
scoreboard players operation sstemp_bvx int += sstemp_tx int
scoreboard players operation sstemp_bvy int += sstemp_ty int
scoreboard players operation sstemp_bvz int += sstemp_tz int
function vve:block/iter_ball/_norm_velocity
scoreboard players operation vve_ball_vx int = sstemp_bvx int
scoreboard players operation vve_ball_vy int = sstemp_bvy int
scoreboard players operation vve_ball_vz int = sstemp_bvz int
execute store result score stemp_x_mod int store result score stemp_x int run scoreboard players operation vve_ball_x int = sstemp_bx int
execute store result score stemp_y_mod int store result score stemp_y int run scoreboard players operation vve_ball_y int = sstemp_by int
execute store result score stemp_z_mod int store result score stemp_z int run scoreboard players operation vve_ball_z int = sstemp_bz int
scoreboard players operation vve_ball_x int -= sstemp_bvx int
scoreboard players operation vve_ball_y int -= sstemp_bvy int
scoreboard players operation vve_ball_z int -= sstemp_bvz int
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
#execute if score test_n int matches 16 run function vve:impulse/_print
#execute if score test_n int matches 16 run function vve:couple/_print

# 顶点7
execute if score test_n int matches 16 run tellraw @a "ball 7"
scoreboard players operation sstemp_bx int -= sstemp_ix int
scoreboard players operation sstemp_by int -= sstemp_iy int
scoreboard players operation sstemp_bz int -= sstemp_iz int
scoreboard players operation sstemp_bvx int -= sstemp_rx int
scoreboard players operation sstemp_bvy int -= sstemp_ry int
scoreboard players operation sstemp_bvz int -= sstemp_rz int
function vve:block/iter_ball/_norm_velocity
scoreboard players operation vve_ball_vx int = sstemp_bvx int
scoreboard players operation vve_ball_vy int = sstemp_bvy int
scoreboard players operation vve_ball_vz int = sstemp_bvz int
execute store result score stemp_x_mod int store result score stemp_x int run scoreboard players operation vve_ball_x int = sstemp_bx int
execute store result score stemp_y_mod int store result score stemp_y int run scoreboard players operation vve_ball_y int = sstemp_by int
execute store result score stemp_z_mod int store result score stemp_z int run scoreboard players operation vve_ball_z int = sstemp_bz int
scoreboard players operation vve_ball_x int -= sstemp_bvx int
scoreboard players operation vve_ball_y int -= sstemp_bvy int
scoreboard players operation vve_ball_z int -= sstemp_bvz int
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
#execute if score test_n int matches 16 run function vve:impulse/_print
#execute if score test_n int matches 16 run function vve:couple/_print

# 顶点8
execute if score test_n int matches 16 run tellraw @a "ball 8"
scoreboard players operation sstemp_bx int -= sstemp_kx int
scoreboard players operation sstemp_by int -= sstemp_ky int
scoreboard players operation sstemp_bz int -= sstemp_kz int
scoreboard players operation sstemp_bvx int -= sstemp_tx int
scoreboard players operation sstemp_bvy int -= sstemp_ty int
scoreboard players operation sstemp_bvz int -= sstemp_tz int
function vve:block/iter_ball/_norm_velocity
scoreboard players operation vve_ball_vx int = sstemp_bvx int
scoreboard players operation vve_ball_vy int = sstemp_bvy int
scoreboard players operation vve_ball_vz int = sstemp_bvz int
execute store result score stemp_x_mod int store result score stemp_x int run scoreboard players operation vve_ball_x int = sstemp_bx int
execute store result score stemp_y_mod int store result score stemp_y int run scoreboard players operation vve_ball_y int = sstemp_by int
execute store result score stemp_z_mod int store result score stemp_z int run scoreboard players operation vve_ball_z int = sstemp_bz int
scoreboard players operation vve_ball_x int -= sstemp_bvx int
scoreboard players operation vve_ball_y int -= sstemp_bvy int
scoreboard players operation vve_ball_z int -= sstemp_bvz int
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
#execute if score test_n int matches 16 run function vve:impulse/_print
#execute if score test_n int matches 16 run function vve:couple/_print

# 结束接受介质响应
function vve:object/_receive_over
function vve:couple/_add_over

# 位置回退
execute if score ball_receiver_res int matches 1 run function vve:object/iter_ball/move_back

# 区块安全
tp @s 0 0 0