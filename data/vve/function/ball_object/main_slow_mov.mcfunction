#vve:ball_object/main_slow_mov
# vve:ball_object/tick调用
# 实体对象慢速主程序
# 输入<inv_dt,int>

function vve:ball_object/_get
# 运动学迭代
execute as 0-0-0-0-0 run function vve:object/_iter_motion_slow_mov
function vve:ball_object/_store