#vve:test/np_norm_loop
# vve:test/np_norm调用

scoreboard players operation sloop int = stemp_min int
execute if score sloop int <= stemp_max int run function vve:test/np_norm_sloop

scoreboard players add loop int 1
execute if score loop int <= stemp_max int run function vve:test/np_norm_loop