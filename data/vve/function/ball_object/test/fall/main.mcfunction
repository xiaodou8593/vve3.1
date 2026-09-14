#vve:ball_object/test/fall/main

execute if score test int matches 1 run return fail
scoreboard players set @s killtime 10

#tellraw @a "---"
#tellraw @a ["test_n: ", {"score":{"name":"test_n","objective":"int"}}]

#function vve:ball_object/_get
#function vve:ball_object/_model
#execute store result storage vve:io frame int 1 run scoreboard players get test_n int
#function vve:ball_object/test/fall/store_frame with storage vve:io {}

execute if score test int matches -1 run data modify storage math:io list set value []
execute if score test int matches -1 run function vve:ball_object/main_c
execute if score test int matches 0 run function vve:ball_object/main_sync
execute store result score loop int run data get storage math:io list
execute if score loop int matches 1.. as 0-0-0-0-0 run function vve:ball_object/test/fall/render_loop

execute if score test int matches -1 run scoreboard players add test_n int 1
#execute if score test int matches -1 run tellraw @a ["test_n: ", {"score":{"name":"test_n","objective":"int"}}]
#execute if score test int matches -1 run scoreboard players set test int 0