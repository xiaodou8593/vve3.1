#vve:object/_iter_ball
# 球体介质探测算法
# 输入vve:ball{...}
# 需要传入世界实体为执行者

# 计算速度大小和方向
function vve:object/velocity/_norm
execute store result score stemp_len int run data get storage math:io sstemp_len 10000

# 输入碰撞点速度
scoreboard players operation c_vx int = vx int
scoreboard players operation c_vy int = vy int
scoreboard players operation c_vz int = vz int

# 计算上一刻的位置并获取方块检测中心
execute store result score stemp_x_mod int run scoreboard players operation stemp_x int = vve_ball_x int
execute store result score stemp_y_mod int run scoreboard players operation stemp_y int = vve_ball_y int
execute store result score stemp_z_mod int run scoreboard players operation stemp_z int = vve_ball_z int
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
execute at @s run function vve:object/iter_ball/detect_block