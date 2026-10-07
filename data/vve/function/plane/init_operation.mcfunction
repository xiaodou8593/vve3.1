#vve:plane/init_operation
# vve:plane/init调用

# 默认不注册模块
#return fail

# 初始化模块控制
scoreboard objectives add int dummy
execute unless score module_control_inited int matches 1 run function module_control:_init

# 注册本模块
data modify storage module_control:io input set value {prefix:"vve:plane/",namespace:"vve"}
function module_control:data/_reg
scoreboard players operation #vve:plane/ module_id = res int

# 实例获得以下命令
# scoreboard players operation @s module_id = #vve:plane/ module_id