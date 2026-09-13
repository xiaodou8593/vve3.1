#vve:object/iter_ball/detect_block
# vve:object/_iter_ball调用

data modify storage vve:io temp set value {ppp:1b,ppn:1b,pnp:1b,pnn:1b,npp:1b,npn:1b,nnp:1b,nnn:1b}

execute if block ~0.5 ~0.5 ~0.5 #vve:pass run data modify storage vve:io temp.ppp set value 0b
execute if block ~0.5 ~0.5 ~-0.5 #vve:pass run data modify storage vve:io temp.ppn set value 0b
execute if block ~0.5 ~-0.5 ~0.5 #vve:pass run data modify storage vve:io temp.pnp set value 0b
execute if block ~0.5 ~-0.5 ~-0.5 #vve:pass run data modify storage vve:io temp.pnn set value 0b

execute if block ~-0.5 ~0.5 ~0.5 #vve:pass run data modify storage vve:io temp.npp set value 0b
execute if block ~-0.5 ~0.5 ~-0.5 #vve:pass run data modify storage vve:io temp.npn set value 0b
execute if block ~-0.5 ~-0.5 ~0.5 #vve:pass run data modify storage vve:io temp.nnp set value 0b
execute if block ~-0.5 ~-0.5 ~-0.5 #vve:pass run data modify storage vve:io temp.nnn set value 0b

function vve:object/iter_ball/search with storage vve:io temp