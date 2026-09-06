#vve:object/_apply_spin
# 施加spin
# 输入<inertia,int,100>
# 输入vve:spin{...}
# 传入世界实体为执行者

execute store result score vec_x int run compute default float vve:object/_apply_couple_x 10000
execute store result score vec_y int run compute default float vve:object/_apply_couple_y 10000
execute store result score vec_z int run compute default float vve:object/_apply_couple_z 10000

# 计算转轴和模长
function math:vec/_norm

scoreboard players operation theta int = vec_x int
execute if score vec_x int matches ..-1 run scoreboard players operation theta int *= -1 int
execute if score vec_y int matches 1.. run scoreboard players operation theta int += vec_y int
execute if score vec_y int matches ..-1 run scoreboard players operation theta int -= vec_y int
execute if score vec_z int matches 1.. run scoreboard players operation theta int += vec_z int
execute if score vec_z int matches ..-1 run scoreboard players operation theta int -= vec_z int

scoreboard players operation sstempd int = uvec_x int
execute if score uvec_x int matches ..-1 run scoreboard players operation sstempd int *= -1 int
execute if score uvec_y int matches 1.. run scoreboard players operation sstempd int += uvec_y int
execute if score uvec_y int matches ..-1 run scoreboard players operation sstempd int -= uvec_y int
execute if score uvec_z int matches 1.. run scoreboard players operation sstempd int += uvec_z int
execute if score uvec_z int matches ..-1 run scoreboard players operation sstempd int -= uvec_z int

scoreboard players operation sstemp_mod int = theta int
scoreboard players operation theta int /= sstempd int
scoreboard players operation sstemp_mod int %= sstempd int
scoreboard players operation sstemp_mod int *= 10000 int
scoreboard players operation sstemp_mod int /= sstempd int
scoreboard players operation theta int *= 10000 int

scoreboard players operation fvec_x int = spin_x int
scoreboard players operation fvec_y int = spin_y int
scoreboard players operation fvec_z int = spin_z int
scoreboard players operation fvec_x int -= x int
scoreboard players operation fvec_y int -= y int
scoreboard players operation fvec_z int -= z int

function math:uvec/_rot_fvec

scoreboard players operation fvec_x int += x int
scoreboard players operation fvec_y int += y int
scoreboard players operation fvec_z int += z int
scoreboard players operation fvec_x int -= spin_x int
scoreboard players operation fvec_y int -= spin_y int
scoreboard players operation fvec_z int -= spin_z int

# 叠加给速度
scoreboard players operation vx int += fvec_x int
scoreboard players operation vy int += fvec_y int
scoreboard players operation vz int += fvec_z int

# 更新角速度
function vve:object/_apply_couple