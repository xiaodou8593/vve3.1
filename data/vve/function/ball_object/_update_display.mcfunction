#vve:ball_object/_update_display
# 更新展示设置
# 传入ball_object实例为执行者

execute store result storage math:io scale[] float 0.0002 run scoreboard players get vve_ball_r int
data modify entity @s transformation.scale set from storage math:io scale