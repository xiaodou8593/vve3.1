#vve:ball_object/test/fall/main

execute if score test int matches 1 run return fail
scoreboard players set @s killtime 10

#tellraw @a "---"
#tellraw @a ["test_n: ", {"score":{"name":"test_n","objective":"int"}}]

#function vve:ball_object/_get
#function vve:ball_object/_model
#execute store result storage vve:io frame int 1 run scoreboard players get test_n int
#function vve:ball_object/test/fall/store_frame with storage vve:io {}

execute if score test int matches -1 run function vve:ball_object/main_c
execute if score test int matches 0 run function vve:ball_object/main_sync

execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute if score test_n int matches 45 at @e[tag=math_marker,limit=1] run setblock ~ ~ ~ glass

execute if score test int matches -1 run scoreboard players add test_n int 1
#execute if score test int matches -1 run tellraw @a ["test_n: ", {"score":{"name":"test_n","objective":"int"}}]
#execute if score test int matches -1 run scoreboard players set test int 0