#vve:object/_iter_motion
# 对临时对象运行一次运动学迭代
# 传入世界实体为执行者

# 速度迭代
scoreboard players operation x int += vx int
scoreboard players operation y int += vy int
scoreboard players operation z int += vz int

# 角速度迭代
# 旋转度数是弧度缩放90/pi
execute store result entity @s Rotation[0] float -0.0000286478897565 run scoreboard players operation quat_phi int += angular_len int
scoreboard players operation quat_phi int %= 314159265 int
execute at @s positioned 0.0 0.0 0.0 rotated ~ 0.0 run tp @s ^ ^ ^1.0
data modify storage math:io xyz set from entity @s Pos
execute store result score cos int run data get storage math:io xyz[2] 10000
execute store result score sin int run data get storage math:io xyz[0] 10000

execute store result score quat_x int run compute default float vve:object/_iter_motion_quat_x 10000
execute store result score quat_y int run compute default float vve:object/_iter_motion_quat_y 10000
execute store result score quat_z int run compute default float vve:object/_iter_motion_quat_z 10000
execute store result score quat_w int run compute default float vve:object/_iter_motion_quat_w 10000

# 四元数转局部坐标系
execute store result score ivec_x int run compute default float vve:object/_iter_motion_ix 10000
execute store result score ivec_y int run compute default float vve:object/_iter_motion_iy 10000
execute store result score ivec_z int run compute default float vve:object/_iter_motion_iz 10000

execute store result score jvec_x int run compute default float vve:object/_iter_motion_jx 10000
execute store result score jvec_y int run compute default float vve:object/_iter_motion_jy 10000
execute store result score jvec_z int run compute default float vve:object/_iter_motion_jz 10000

execute store result score kvec_x int run compute default float vve:object/_iter_motion_kx 10000
execute store result score kvec_y int run compute default float vve:object/_iter_motion_ky 10000
execute store result score kvec_z int run compute default float vve:object/_iter_motion_kz 10000