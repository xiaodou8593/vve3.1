#vve:object/_set_angular
# 设置临时对象的角速度
# 输入_this:{<angular_x,int,100w>,<angular_y,int,100w>,<angular_z,int,100w>,quaternion.xyzw}
# 输出_this:{<angular_len,int,100w>,quaternion{...}}
# 传入世界实体为执行者

# 单位化当前四元数
function math:quat/_norm_np

# 计算角速度转轴和模长
execute store result score angular_len int run compute default float vve:object/_angular_len 1000000
execute store result score uvec_x int run compute default float vve:object/_angular_ux 10000
execute store result score uvec_y int run compute default float vve:object/_angular_uy 10000
execute store result score uvec_z int run compute default float vve:object/_angular_uz 10000

# 当前姿态设置为旋转初始姿态
scoreboard players operation quat_start_x int = quat_x int
scoreboard players operation quat_start_y int = quat_y int
scoreboard players operation quat_start_z int = quat_z int
scoreboard players operation quat_start_w int = quat_w int
scoreboard players set quat_phi int 0

# 计算正交四元数
execute store result score quat_orth_x int run compute default float vve:object/_set_angular_ox 10000
execute store result score quat_orth_y int run compute default float vve:object/_set_angular_oy 10000
execute store result score quat_orth_z int run compute default float vve:object/_set_angular_oz 10000
execute store result score quat_orth_w int run compute default float vve:object/_set_angular_ow 10000