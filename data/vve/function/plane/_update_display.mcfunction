#vve:plane/_update_display
# 更新展示设置
# 输出entity @e[tag=result,limit=1]

scoreboard players operation w int = x_max int
scoreboard players operation w int -= x_min int
scoreboard players operation l int = z_max int
scoreboard players operation l int -= z_min int
scoreboard players operation x int = x_min int
scoreboard players operation stemp_d int = w int
scoreboard players operation stemp_d int /= 2 int
scoreboard players operation x int += stemp_d int
scoreboard players operation z int = z_min int
scoreboard players operation stemp_d int = l int
scoreboard players operation stemp_d int /= 2 int
scoreboard players operation z int += stemp_d int
scoreboard players set h int 0
scoreboard players set theta int 0
function vve:slope_display/_model
data modify storage vve:io input set from storage vve:io result
function vve:slope_display/_new