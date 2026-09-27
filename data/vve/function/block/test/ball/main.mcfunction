#vve:block/test/ball/main

execute if score test int matches 1 run return fail
scoreboard players set @s killtime 10

#execute if score test int matches -1 run tellraw @a "---"
#execute if score test int matches -1 run tellraw @a ["test_n: ", {"score":{"name":"test_n","objective":"int"}}]

#function vve:block/_get
#function vve:block/_model
#execute store result storage vve:io frame int 1 run scoreboard players get test_n int
#function vve:block/test/ball/store_frame with storage vve:io {}

execute if score test int matches -1 run data modify storage math:io list set value []
execute if score test int matches -1 run function vve:block/main_ball
execute if score test_n int matches 16 run scoreboard players set test int 1
execute store result score loop int run data get storage math:io list
execute if score loop int matches 1.. as 0-0-0-0-0 run function vve:block/test/ball/render_loop
scoreboard players set inp int 3500
execute if score test int matches -1 if score test_n int matches 105..125 at @s positioned ~-0.25 ~0.3 ~ rotated -90.0 0.0 run function vve:object/_poke_here_i_as
execute as 0-0-0-0-0 run function vve:impulse/_render

execute if score test int matches -1 run scoreboard players add test_n int 1
#scoreboard players set test int 0