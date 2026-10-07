#vve:point/_new
# 使用数据模板生成实体对象
# 输入数据模板storage vve:io input
# 输入执行位置
# 输出 @e[tag=result,limit=1]

tag @e[tag=result] remove result
summon item_display ~ ~ ~ {Tags:["vve_point", "result"],brightness:{sky:15,block:15},teleport_duration:1,interpolation_duration:1}
execute as @e[tag=result,limit=1] run function vve:point/set
execute as @e[tag=result,limit=1] run function vve:point/set_operation