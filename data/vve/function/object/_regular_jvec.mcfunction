#vve:object/_regular_jvec
# 规整化姿态, 使得jvec与nvec对齐
# 输入nvec{...}
# 需要传入世界实体为执行者

function math:uvw/_nvec_to
# 设置各面法向量

scoreboard players set sstemp_n3_x int 0
scoreboard players set sstemp_n3_y int 10000
scoreboard players set sstemp_n3_z int 0

scoreboard players set sstemp_n4_x int 0
scoreboard players set sstemp_n4_y int -10000
scoreboard players set sstemp_n4_z int 0

# 与各面法向量点乘
execute store result score sstemp_d3 int run compute default float vve:object/regular/_dot_sstemp_n3 10000
execute store result score sstemp_d4 int run compute default float vve:object/regular/_dot_sstemp_n4 10000

# 选择贴合面
function vve:object/regular/surface_3
#function vve:object/regular/surface_4
function math:quat/_touvw