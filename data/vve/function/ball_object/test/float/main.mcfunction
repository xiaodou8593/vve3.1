#vve:ball_object/test/float/main

execute unless score test int matches -1 run return fail
scoreboard players set @s killtime 10

#tellraw @a "---"
#tellraw @a ["test_n: ", {"score":{"name":"test_n","objective":"int"}}]

#function vve:ball_object/_get
#function vve:ball_object/_model
#execute store result storage vve:io frame int 1 run scoreboard players get test_n int
#function vve:ball_object/test/float/store_frame with storage vve:io {}

function vve:ball_object/main_l

scoreboard players add test_n int 1