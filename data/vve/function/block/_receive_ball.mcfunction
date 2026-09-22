#vve:block/_receive_ball
# 接收介质响应
# 输入各模块介质响应信号
# 输入各模块介质响应

# 重新计算位移
function vve:object/_local_cpoint_center
execute store result score u int run compute default float math:uvw/_nvec_to_u -10000
execute store result score v int run compute default float math:uvw/_nvec_to_v -10000
execute store result score w int run compute default float math:uvw/_nvec_to_w -10000

scoreboard players set inp int 2147483647
execute if score u int matches 1.. run function vve:block/receive_ball/branch_0
execute if score u int matches ..-1 run function vve:block/receive_ball/branch_1
execute if score v int matches 1.. run function vve:block/receive_ball/branch_2
execute if score v int matches ..-1 run function vve:block/receive_ball/branch_3
execute if score w int matches 1.. run function vve:block/receive_ball/branch_4
execute if score w int matches ..-1 run function vve:block/receive_ball/branch_5

#tellraw @a ["inp: ", {"score":{"name":"inp","objective":"int"}}]
#function math:nvec/_print
#scoreboard players set test int 1

execute store result score sstemp_sx int run compute default float math:nvec/_scale_x 10000
execute store result score sstemp_sy int run compute default float math:nvec/_scale_y 10000
execute store result score sstemp_sz int run compute default float math:nvec/_scale_z 10000
#tellraw @a ["sstemp_s: ",{"score":{"name":"sstemp_sx","objective":"int"}},", ",{"score":{"name":"sstemp_sy","objective":"int"}},", ",{"score":{"name":"sstemp_sz","objective":"int"}}]

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

scoreboard players set ball_receiver_res int 1
execute if score bounce_layer_response int matches 1 run function vve:object/_receive_bounce_layer
execute if score grab_layer_response int matches 1 run function vve:object/_receive_grab_layer
scoreboard players operation friction_receiver_response int < friction_response int
#execute if score shift_response int matches 1 run function vve:object/_receive_shift
execute if score impulse_response int matches 1 run function vve:object/_dec_impulse

function vve:impulse/_model
data modify storage math:io list append from storage vve:io result