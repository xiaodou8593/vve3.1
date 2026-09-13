#vve:object/_receive_ball_shift
# 接收球体连续碰撞检测位移
# 输入<stemp_len,int,1w>
# 输入<sstemp_s,int,1w>
# 输入math:uvec{...}
# 迭代{<ball_receiver_sx,int,1w>,<ball_receiver_sy,int,1w>,<ball_receiver_sz,int,1w>}

scoreboard players operation sstemp_len int = stemp_len int
scoreboard players operation sstemp_len int -= sstemp_s int
data modify storage vve:io stemp set compute default float vve:object/_receive_ball_shift_dot
execute store result score sstemp_sx int run compute default float vve:object/_receive_ball_shift_x
execute store result score sstemp_sy int run compute default float vve:object/_receive_ball_shift_y
execute store result score sstemp_sz int run compute default float vve:object/_receive_ball_shift_z

execute if score sstemp_sx int matches 1.. if score ball_receiver_sx int matches 0.. run \
	scoreboard players operation ball_receiver_sx int > sstemp_sx int
execute if score sstemp_sx int matches ..-1 if score ball_receiver_sx int matches ..0 run \
	scoreboard players operation ball_receiver_sx int < sstemp_sx int
execute if score sstemp_sx int matches 1.. if score ball_receiver_sx int matches ..0 run \
	scoreboard players operation ball_receiver_sx int += sstemp_sx int
execute if score sstemp_sx int matches ..-1 if score ball_receiver_sx int matches 0.. run \
	scoreboard players operation ball_receiver_sx int += sstemp_sx int

execute if score sstemp_sy int matches 1.. if score ball_receiver_sy int matches 0.. run \
	scoreboard players operation ball_receiver_sy int > sstemp_sy int
execute if score sstemp_sy int matches ..-1 if score ball_receiver_sy int matches ..0 run \
	scoreboard players operation ball_receiver_sy int < sstemp_sy int
execute if score sstemp_sy int matches 1.. if score ball_receiver_sy int matches ..0 run \
	scoreboard players operation ball_receiver_sy int += sstemp_sy int
execute if score sstemp_sy int matches ..-1 if score ball_receiver_sy int matches 0.. run \
	scoreboard players operation ball_receiver_sy int += sstemp_sy int

execute if score sstemp_sz int matches 1.. if score ball_receiver_sz int matches 0.. run \
	scoreboard players operation ball_receiver_sz int > sstemp_sz int
execute if score sstemp_sz int matches ..-1 if score ball_receiver_sz int matches ..0 run \
	scoreboard players operation ball_receiver_sz int < sstemp_sz int
execute if score sstemp_sz int matches 1.. if score ball_receiver_sz int matches ..0 run \
	scoreboard players operation ball_receiver_sz int += sstemp_sz int
execute if score sstemp_sz int matches ..-1 if score ball_receiver_sz int matches 0.. run \
	scoreboard players operation ball_receiver_sz int += sstemp_sz int