#vve:test/explode/_detect_large
# 介质探测
# 输入cpoint{...}
# 输出介质响应(各模块的临时对象)
# 传入世界实体为执行者(不保证Pos位于执行位置)

# 各模块响应信号重置
scoreboard players set shift_response int 0
scoreboard players set impulse_response int 0
scoreboard players set friction_response int 10000
scoreboard players set grab_layer_response int 0
scoreboard players set bounce_layer_response int 0
scoreboard players set material_response int 0
scoreboard players set surface_response int 0

# 检测不同介质

# 补充非方块介质
execute as @e[tag=vve_large_material] run function vve:call_material
execute if score material_response int matches 1.. run return fail

# 空气介质
scoreboard players operation friction_response int = vve_air_friction int