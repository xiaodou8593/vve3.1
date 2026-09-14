#vve:ball_object/test/push/end

execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] run fill ~-2 ~-1 ~-2 ~9 ~-1 ~2 air
execute at @e[tag=math_marker,limit=1] run fill ~-2 ~ ~-2 ~5 ~ ~2 air
execute at @e[tag=math_marker,limit=1] run fill ~-2 ~1 ~-2 ~4 ~1 ~2 air

function vve:ball_object/_del