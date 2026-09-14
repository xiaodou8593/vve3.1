#vve:ball_object/test/fall/render_loop
# vve:ball_object/test/fall/main调用

data modify storage math:io input set from storage math:io list[0]
function math:box/_proj
scoreboard players set render_density int 20
data modify storage math:io render_command set from storage math:class particle_commands.red_dust_mid
function math:box/_render

data modify storage math:io list append from storage math:io list[0]
data remove storage math:io list[0]
scoreboard players remove loop int 1
execute if score loop int matches 1.. run function vve:ball_object/test/fall/render_loop