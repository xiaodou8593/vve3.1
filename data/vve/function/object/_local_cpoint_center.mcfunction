#vve:object/_local_cpoint_center
# 将cpoint中心转为局部坐标
# 输入vve:cpoint.center{...}
# 输出math:vec{...}

execute store result score vec_x int run compute default float vve:object/_local_cpoint_center_u 10000
execute store result score vec_y int run compute default float vve:object/_local_cpoint_center_v 10000
execute store result score vec_z int run compute default float vve:object/_local_cpoint_center_w 10000