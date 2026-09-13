#vve:ball_object/init_operation
# vve:ball_object/init调用

# 默认不注册模块
return fail

# 初始化模块控制
scoreboard objectives add int dummy
execute unless score module_control_inited int matches 1 run function module_control:_init

# 注册本模块
data modify storage module_control:io input set value {prefix:"vve:ball_object/",namespace:"vve"}
function module_control:data/_reg
scoreboard players operation #vve:ball_object/ module_id = res int

# 实例获得以下命令
# scoreboard players operation @s module_id = #vve:ball_object/ module_id