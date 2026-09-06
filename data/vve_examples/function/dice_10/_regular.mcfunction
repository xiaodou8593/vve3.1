#vve_examples:dice_10/_regular
# 规整化姿态，消除法向角速度
# 输入nvec{...}
# 输入receiver{...}
# 需要传入世界实体为执行者

function math:uvw/_nvec_to
scoreboard players set cos int -2147483648
# 设置各面法向量
scoreboard players set sstemp_n1_x int 8944
scoreboard players set sstemp_n1_y int 0
scoreboard players set sstemp_n1_z int 4472

scoreboard players set sstemp_n2_x int 7236
scoreboard players set sstemp_n2_y int -5257
scoreboard players set sstemp_n2_z int -4472

scoreboard players set sstemp_n3_x int -2764
scoreboard players set sstemp_n3_y int -8507
scoreboard players set sstemp_n3_z int -4472

scoreboard players set sstemp_n4_x int -7236
scoreboard players set sstemp_n4_y int -5257
scoreboard players set sstemp_n4_z int 4472

scoreboard players set sstemp_n5_x int 0
scoreboard players set sstemp_n5_y int 0
scoreboard players set sstemp_n5_z int 10000

scoreboard players set sstemp_n6_x int 2764
scoreboard players set sstemp_n6_y int 8507
scoreboard players set sstemp_n6_z int 4472

scoreboard players set sstemp_n7_x int 7236
scoreboard players set sstemp_n7_y int 5257
scoreboard players set sstemp_n7_z int -4472

scoreboard players set sstemp_n8_x int 0
scoreboard players set sstemp_n8_y int 0
scoreboard players set sstemp_n8_z int -10000

scoreboard players set sstemp_n9_x int -8944
scoreboard players set sstemp_n9_y int 0
scoreboard players set sstemp_n9_z int -4472

scoreboard players set sstemp_n10_x int -7236
scoreboard players set sstemp_n10_y int 5257
scoreboard players set sstemp_n10_z int 4472

# 与各面法向量点乘
execute store result score sstemp_d1 int run compute default float vve:object/regular/_dot_sstemp_n1 10000
scoreboard players operation cos int > sstemp_d1 int

execute store result score sstemp_d2 int run compute default float vve:object/regular/_dot_sstemp_n2 10000
scoreboard players operation cos int > sstemp_d2 int

execute store result score sstemp_d3 int run compute default float vve:object/regular/_dot_sstemp_n3 10000
scoreboard players operation cos int > sstemp_d3 int

execute store result score sstemp_d4 int run compute default float vve:object/regular/_dot_sstemp_n4 10000
scoreboard players operation cos int > sstemp_d4 int

execute store result score sstemp_d5 int run compute default float vve:object/regular/_dot_sstemp_n5 10000
scoreboard players operation cos int > sstemp_d5 int

execute store result score sstemp_d6 int run compute default float vve:object/regular/_dot_sstemp_n6 10000
scoreboard players operation cos int > sstemp_d6 int

execute store result score sstemp_d7 int run compute default float vve:object/regular/_dot_sstemp_n7 10000
scoreboard players operation cos int > sstemp_d7 int

execute store result score sstemp_d8 int run compute default float vve:object/regular/_dot_sstemp_n8 10000
scoreboard players operation cos int > sstemp_d8 int

execute store result score sstemp_d9 int run compute default float vve:object/regular/_dot_sstemp_n9 10000
scoreboard players operation cos int > sstemp_d9 int

execute store result score sstemp_d10 int run compute default float vve:object/regular/_dot_sstemp_n10 10000
scoreboard players operation cos int > sstemp_d10 int
# 选择贴合面
execute if score cos int = sstemp_d1 int run return run function vve:object/regular/surface_1
execute if score cos int = sstemp_d2 int run return run function vve:object/regular/surface_2
execute if score cos int = sstemp_d3 int run return run function vve:object/regular/surface_3
execute if score cos int = sstemp_d4 int run return run function vve:object/regular/surface_4
execute if score cos int = sstemp_d5 int run return run function vve:object/regular/surface_5
execute if score cos int = sstemp_d6 int run return run function vve:object/regular/surface_6
execute if score cos int = sstemp_d9 int run return run function vve:object/regular/surface_7
execute if score cos int = sstemp_d8 int run return run function vve:object/regular/surface_8
execute if score cos int = sstemp_d9 int run return run function vve:object/regular/surface_9
execute if score cos int = sstemp_d10 int run return run function vve:object/regular/surface_10