#vve:block/test/ball/main

execute if score test int matches 1 run return fail
scoreboard players set @s killtime 10

#tellraw @a "---"
#tellraw @a ["test_n: ", {"score":{"name":"test_n","objective":"int"}}]

#function vve:block/_get
#function vve:block/_model
#execute store result storage vve:io frame int 1 run scoreboard players get test_n int
#function vve:block/test/ball/store_frame with storage vve:io {}

execute if score test int matches -1 run data modify storage math:io list set value []
execute if score test int matches -1 run function vve:block/main_ball
execute store result score loop int run data get storage math:io list
execute if score loop int matches 1.. as 0-0-0-0-0 run function vve:block/test/ball/render_loop
#scoreboard players set inp int 7500
#execute if score test_n int matches 60..72 at @s positioned ~-1 ~0.5 ~ rotated -90.0 0.0 run function vve:block/_poke_here_i_as
#execute as 0-0-0-0-0 run function vve:impulse/_render

scoreboard players add test_n int 1
#scoreboard players set test int 0