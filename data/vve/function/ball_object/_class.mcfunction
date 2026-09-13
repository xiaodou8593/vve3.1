#vve:ball_object/_class
# 生成预设静态数据模板

function vve:ball_object/_zero
execute positioned 0.0 0.0 0.0 rotated 0.0 0.0 as 0-0-0-0-0 run function vve:object/_anchor_to
scoreboard players set vve_ball_r int 5000
scoreboard players set mass int 17
scoreboard players set inertia int 500
function vve:ball_object/_model
data modify storage vve:class ball_object_plate set from storage vve:io result