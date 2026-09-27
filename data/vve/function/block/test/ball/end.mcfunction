#vve:block/test/ball/end

kill @e[tag=math_particle]
execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] run fill ~-3 ~-1 ~-3 ~3 ~-1 ~3 air
setblock 3 100 1 air

function vve:block/_del