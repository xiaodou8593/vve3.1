#vve:ball_object/test/cp/main

execute unless score test int matches -1 run return fail
scoreboard players set @s killtime 10

#tellraw @a "---"
#tellraw @a ["test_n: ", {"score":{"name":"test_n","objective":"int"}}]

#function vve:ball_object/_get
#function vve:ball_object/_model
#execute store result storage vve:io frame int 1 run scoreboard players get test_n int
#function vve:ball_object/test/cp/store_frame with storage vve:io {}

function vve:ball_object/_get
# 运动学迭代
execute as 0-0-0-0-0 run function vve:object/_iter_motion
# 渲染球面
scoreboard players set r int 0
scoreboard players set g int 255
scoreboard players set b int 0
function math:rgb/_to_list
data modify storage math:io duration set value 2
data modify storage math:io render_command set value "function math:rgb/_render_cache"
#data modify storage math:io render_command set from storage math:class particle_commands.green_dust
scoreboard players operation r int = vve_ball_r int
scoreboard players operation r int /= 10 int
scoreboard players set inp int 64
#execute as 0-0-0-0-0 run function math:sphere/_render_cnt
execute as 0-0-0-0-0 run function vve:ball_object/_render_cnt
# 运动同步
function vve:ball_object/_store

scoreboard players add test_n int 1