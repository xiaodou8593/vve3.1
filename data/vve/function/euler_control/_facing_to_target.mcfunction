#vve:euler_control/_facing_to_target
# 执行朝向转目标欧拉角
# 输入执行朝向
# 传入世界实体为执行者

rotate @s ~ ~
data modify storage math:io rotation set from entity @s Rotation
scoreboard players set target_psi int 0
execute store result score target_theta int run data get storage math:io rotation[0] -10000
execute store result score target_phi int run data get storage math:io rotation[1] 10000