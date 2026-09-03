#vve:object/_apply_friction
# 接收摩擦响应
# 输入<friction_response,int,1w>

# 速度缩放
scoreboard players operation vx int *= friction_response int
scoreboard players operation vy int *= friction_response int
scoreboard players operation vz int *= friction_response int
execute if score vx int matches ..-1 run scoreboard players add vx int 9999
execute if score vy int matches ..-1 run scoreboard players add vy int 9999
execute if score vz int matches ..-1 run scoreboard players add vz int 9999
scoreboard players operation vx int /= 10000 int
scoreboard players operation vy int /= 10000 int
scoreboard players operation vz int /= 10000 int

# 角速度缩放
execute store result score angular_len int run compute default float vve:object/_apply_friction_al 1000000

# 角速度分量缩放
execute store result score angular_x int run compute default float vve:object/_apply_friction_ax 1000000
execute store result score angular_y int run compute default float vve:object/_apply_friction_ay 1000000
execute store result score angular_z int run compute default float vve:object/_apply_friction_az 1000000