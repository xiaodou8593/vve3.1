#vve:ball_object/_iter_ball_step
# 分段球体介质探测算法
# 输入vve:ball{...}
# 需要传入世界实体为执行者

scoreboard players operation vve_ball_x int = x int
scoreboard players operation vve_ball_y int = y int
scoreboard players operation vve_ball_z int = z int
scoreboard players operation vve_ball_x int -= vx int
scoreboard players operation vve_ball_y int -= vy int
scoreboard players operation vve_ball_z int -= vz int
scoreboard players operation vve_ball_vx int = vx int
scoreboard players operation vve_ball_vy int = vy int
scoreboard players operation vve_ball_vz int = vz int

# 计算速度大小和方向
function vve:object/velocity/_norm
execute store result score stemp_len_div int store result score stemp_len_mod int store result score stemp_len int run data get storage math:io sstemp_len
scoreboard players operation stemp_len_div int /= 5000 int
scoreboard players operation stemp_len_mod int %= 5000 int

scoreboard players operation c_mass int = mass int

# 开始接收介质响应
function vve:couple/_clear
function vve:object/_clear_receiver

scoreboard players set ball_receiver_sx int 0
scoreboard players set ball_receiver_sy int 0
scoreboard players set ball_receiver_sz int 0
scoreboard players set ball_receiver_res int 0

# 0.5格步进
scoreboard players set loop int 1
execute if score loop int <= stemp_len_div int run function vve:ball_object/iter_ball_step
execute if score stemp_len_mod int matches 1.. if score ball_receiver_res int matches 0 run function vve:ball_object/iter_ball_step_mod

# 结束接受介质响应
function vve:object/_receive_over
function vve:couple/_add_over

# 位置回退
execute if score ball_receiver_res int matches 1 run function vve:object/iter_ball/move_back

# 区块安全
tp @s 0 0 0