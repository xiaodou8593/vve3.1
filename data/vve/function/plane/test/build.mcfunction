#vve:plane/test/build

function vve:plane/init

scoreboard players set x int 2000000
scoreboard players set z int 500000

scoreboard players set y int -100000
scoreboard players set x_min int -320000
scoreboard players set x_max int 320000
scoreboard players set z_min int -320000
scoreboard players set z_max int 320000
scoreboard players operation x_min int += x int
scoreboard players operation x_max int += x int
scoreboard players operation z_min int += z int
scoreboard players operation z_max int += z int
scoreboard players set base_layer int 50000
function vve:plane/_calc_chunk_range
function vve:plane/_calc_nvec
function vve:plane/_model
data modify storage vve:io input set from storage vve:io result
function vve:plane/_new
execute as @e[tag=result,limit=1] run function vve:plane/_get
function vve:plane/_update_display
item replace entity @e[tag=result,limit=1] container.0 with glass