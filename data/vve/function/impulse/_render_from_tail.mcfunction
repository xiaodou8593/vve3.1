#vve:impulse/_render_from_tail
# 从尾部开始渲染冲量
# 需要以世界实体为执行者
# 需要安装math3.1_gelib

# 按比例放大冲量
scoreboard players operation impulse_fx int *= 2 int
scoreboard players operation impulse_fy int *= 2 int
scoreboard players operation impulse_fz int *= 2 int

# 获取起始点
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players get impulse_x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players get impulse_y int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players get impulse_z int
data modify entity @s Pos set from storage math:io xyz

# 获取向量
scoreboard players operation vec_x int = impulse_fx int
scoreboard players operation vec_y int = impulse_fy int
scoreboard players operation vec_z int = impulse_fz int

# 设置渲染精细度和粒子
scoreboard players set vec_n int 50
data modify storage math:io render_command set from storage math:class particle_commands.red_dust

execute at @s run function math:vec/_render_debug

scoreboard players operation impulse_fx int /= 2 int
scoreboard players operation impulse_fy int /= 2 int
scoreboard players operation impulse_fz int /= 2 int