#vve:block/test/ball/render_loop
# vve:block/test/ball/main调用

data modify storage vve:io input set from storage math:io list[0]
function vve:impulse/_proj
scoreboard players operation impulse_fx int /= mass int
scoreboard players operation impulse_fy int /= mass int
scoreboard players operation impulse_fz int /= mass int
function vve:impulse/_render_from_tail

data modify storage math:io list append from storage math:io list[0]
data remove storage math:io list[0]
scoreboard players remove loop int 1
execute if score loop int matches 1.. run function vve:block/test/ball/render_loop