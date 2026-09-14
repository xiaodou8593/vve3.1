#vve:object/_iter_ball
# 球体介质探测算法
# 输入vve:ball{...}
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

# 计算上一刻的位置并获取方块检测中心
scoreboard players operation stemp_x int = vve_ball_x int
scoreboard players operation stemp_y int = vve_ball_y int
scoreboard players operation stemp_z int = vve_ball_z int
execute store result score stemp_x_mod int run scoreboard players operation stemp_x int += vx int
execute store result score stemp_y_mod int run scoreboard players operation stemp_y int += vy int
execute store result score stemp_z_mod int run scoreboard players operation stemp_z int += vz int
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

# 结束接受介质响应
function vve:object/_receive_over
function vve:couple/_add_over

# 位置回退
execute if score ball_receiver_res int matches 1 run function vve:object/iter_ball/move_back

# 区块安全
tp @s 0 0 0