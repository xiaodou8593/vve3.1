#vve:object/_iter_motion_slow_key
# 对临时对象运行一次慢倍速运动学迭代
# 输入<inv_dt,int>
# 传入世界实体为执行者

# 速度迭代
scoreboard players operation stemp_vx int = vx int
scoreboard players operation stemp_vy int = vy int
scoreboard players operation stemp_vz int = vz int

scoreboard players operation stemp_vx int /= inv_dt int
scoreboard players operation stemp_mod int = vx int
scoreboard players operation stemp_mod int %= inv_dt int
scoreboard players operation stemp_vx int += stemp_mod int

scoreboard players operation stemp_vy int /= inv_dt int
scoreboard players operation stemp_mod int = vy int
scoreboard players operation stemp_mod int %= inv_dt int
scoreboard players operation stemp_vy int += stemp_mod int

scoreboard players operation stemp_vz int /= inv_dt int
scoreboard players operation stemp_mod int = vz int
scoreboard players operation stemp_mod int %= inv_dt int
scoreboard players operation stemp_vz int += stemp_mod int

scoreboard players operation x int += stemp_vx int
scoreboard players operation y int += stemp_vy int
scoreboard players operation z int += stemp_vz int

# 角速度迭代
# 旋转度数是弧度缩放90/pi
scoreboard players operation stemp_len int = angular_len int
scoreboard players operation stemp_len int /= inv_dt int
scoreboard players operation stemp_mod int = angular_len int
scoreboard players operation stemp_mod int %= inv_dt int
scoreboard players operation stemp_len int += stemp_mod int
scoreboard players operation quat_phi int += stemp_len int
scoreboard players operation quat_phi int %= 314159265 int
execute store result score cos int run compute default float vve:object/_cos_phi 10000
execute store result score sin int run compute default float vve:object/_sin_phi 10000

execute store result score quat_x int run compute default float vve:object/_iter_motion_quat_x 10000
execute store result score quat_y int run compute default float vve:object/_iter_motion_quat_y 10000
execute store result score quat_z int run compute default float vve:object/_iter_motion_quat_z 10000
execute store result score quat_w int run compute default float vve:object/_iter_motion_quat_w 10000

# 四元数转局部坐标系
execute store result score ivec_x int run compute default float math:quat/_touvw_ix 10000
execute store result score ivec_y int run compute default float math:quat/_touvw_iy 10000
execute store result score ivec_z int run compute default float math:quat/_touvw_iz 10000

execute store result score jvec_x int run compute default float math:quat/_touvw_jx 10000
execute store result score jvec_y int run compute default float math:quat/_touvw_jy 10000
execute store result score jvec_z int run compute default float math:quat/_touvw_jz 10000

execute store result score kvec_x int run compute default float math:quat/_touvw_kx 10000
execute store result score kvec_y int run compute default float math:quat/_touvw_ky 10000
execute store result score kvec_z int run compute default float math:quat/_touvw_kz 10000