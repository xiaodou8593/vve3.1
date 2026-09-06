#vve:object/_regular_angular
# 消除法向角速度
# 输入nvec{...}
# 输入receiver{...}
# 需要传入世界实体为执行者

execute store result score inp int run compute default float vve:object/_angular_dot_nvec 10000
execute store result score angular_x int run compute default float math:nvec/_scale_x 1000000
execute store result score angular_y int run compute default float math:nvec/_scale_y 1000000
execute store result score angular_z int run compute default float math:nvec/_scale_z 1000000

function vve:object/_set_angular