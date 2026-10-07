#vve:object/angular/_iquat_to
# 四元数转角速度
# 输入math:iquat{<iquat_x,int,1w>,<iquat_y,int,1w>,<iquat_z,int,1w>,<iquat_w,int,1w>}
# 占用math:uvec{<uvec_x,int,1w>,<uvec_y,int,1w>,<uvec_z,int,1w>}
# 占用<inp,int>
# 需要传入世界实体为执行者

# 单位化当前四元数
function math:quat/_norm_np

# 计算转角弧度
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players operation inp int = iquat_w int
scoreboard players operation inp int *= inp int
scoreboard players operation inp int *= -1 int
scoreboard players add inp int 100000000
execute store result storage math:io xyz[0] double 0.0001 run compute default float math:_sqrt
data modify entity @s Pos set from storage math:io xyz
execute positioned 0.0 0.0 0.0 facing entity @s feet run rotate @s ~ 0.0
execute store result score angular_len int run data get entity @s Rotation[0] -17453.292519943295769236907684886
scoreboard players operation angular_len int %= 3141592 int
execute if score angular_len int matches 1570796.. run scoreboard players remove angular_len int 3141592
scoreboard players set sstemp_sign int 1
execute if score angular_len int matches ..-1 run scoreboard players set sstemp_sign int -1
scoreboard players operation angular_len int *= sstemp_sign int

# 计算转轴
execute store result score sstemp_x int run compute default float math:iquat/_norm_vec 10000
scoreboard players operation sstemp_x int *= sstemp_sign int
scoreboard players operation uvec_x int = iquat_x int
scoreboard players operation uvec_y int = iquat_y int
scoreboard players operation uvec_z int = iquat_z int
scoreboard players operation uvec_x int *= sstemp_x int
scoreboard players operation uvec_y int *= sstemp_x int
scoreboard players operation uvec_z int *= sstemp_x int
scoreboard players operation uvec_x int /= 10000 int
scoreboard players operation uvec_y int /= 10000 int
scoreboard players operation uvec_z int /= 10000 int

# 计算角速度矢量
execute store result score angular_x int run compute default float vve:object/angular/_iquat_to_ax
execute store result score angular_y int run compute default float vve:object/angular/_iquat_to_ay
execute store result score angular_z int run compute default float vve:object/angular/_iquat_to_az

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