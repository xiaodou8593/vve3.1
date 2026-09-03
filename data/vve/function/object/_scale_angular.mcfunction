#vve:object/_scale_angular
# 按倍率缩放临时对象角速度
# 输入<inp,int,1w>
# 输入_this:{<angular_x,int,100w>,<angular_y,int,100w>,<angular_z,int,100w>,<angular_len,int,100w>}
# 输出_this:{<angular_x,int,100w>,<angular_y,int,100w>,<angular_z,int,100w>,<angular_len,int,100w>}

# 角速度缩放
execute store result score angular_len int run compute default float vve:object/_scale_angular_len 1000000

# 角速度分量缩放
execute store result score angular_x int run compute default float vve:object/_scale_angular_x 1000000
execute store result score angular_y int run compute default float vve:object/_scale_angular_y 1000000
execute store result score angular_z int run compute default float vve:object/_scale_angular_z 1000000