#vve:object/_apply_couple
# 应用力偶矩响应
# 输入<inertia,int,100>
# 输入couple{...}
# 传入世界实体为执行者

# 输入力偶矩向量
scoreboard players operation vec_x int = couple_x int
scoreboard players operation vec_y int = couple_y int
scoreboard players operation vec_z int = couple_z int

# 改变角速度
execute store result score vec_x int run compute default float vve:object/_apply_couple_x 10000
execute store result score vec_y int run compute default float vve:object/_apply_couple_y 10000
execute store result score vec_z int run compute default float vve:object/_apply_couple_z 10000
scoreboard players operation angular_x int += vec_x int
scoreboard players operation angular_y int += vec_y int
scoreboard players operation angular_z int += vec_z int
function vve:object/_set_angular