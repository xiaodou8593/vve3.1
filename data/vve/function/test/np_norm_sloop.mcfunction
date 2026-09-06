#vve:test/np_norm_sloop
# vve:test/np_norm_loop调用

scoreboard players operation ssloop int = stemp_min int
execute if score ssloop int <= stemp_max int run function vve:test/np_norm_ssloop

scoreboard players add sloop int 1
execute if score sloop int <= stemp_max int run function vve:test/np_norm_sloop