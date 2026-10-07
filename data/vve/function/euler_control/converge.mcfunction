#vve:euler_control/converge
# vve::euler_control/main_angular调用

scoreboard players operation quat_x int = quat_high_x int
scoreboard players operation quat_y int = quat_high_y int
scoreboard players operation quat_z int = quat_high_z int
scoreboard players operation quat_w int = quat_high_w int
scoreboard players operation quat_x int /= 10000 int
scoreboard players operation quat_y int /= 10000 int
scoreboard players operation quat_z int /= 10000 int
scoreboard players operation quat_w int /= 10000 int
scoreboard players set angular_x int 0
scoreboard players set angular_y int 0
scoreboard players set angular_z int 0
function vve:object/_set_angular
function math:quat/_touvw