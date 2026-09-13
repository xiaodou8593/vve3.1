#vve:ball_object/main_sync
# vve:ball_object/tick调用
# 实体对象运动同步主程序

function vve:ball_object/_get
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
function vve:ball_object/_store

# 坐标安全
execute unless score y int matches -640000..5120000 run function vve:ball_object/_del