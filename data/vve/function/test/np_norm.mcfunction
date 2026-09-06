#vve:test/np_norm

scoreboard players set min int 2147483647
scoreboard players set max int 0

scoreboard players set stemp_min int -100
scoreboard players set stemp_max int 100

scoreboard players operation loop int = stemp_min int
execute if score loop int <= stemp_max int run function vve:test/np_norm_loop

tellraw @a ["max: ", {"score":{"name":"max","objective":"int"}}]
tellraw @a ["min: ", {"score":{"name":"min","objective":"int"}}]