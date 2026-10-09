#vve:euler_control/_print_as
# 打印实例数据

tellraw @a ["euler_control as: ", "{"]
tellraw @a ["    ", "control_active: ", {"score":{"name":"@s", "objective":"control_active"}}, ","]
tellraw @a ["    ", "damp_params: ", "[", {"score":{"name":"@s", "objective":"vve_euler_k"}}, ", " ,{"score":{"name":"@s", "objective":"vve_euler_b"}}, ", " ,{"score":{"name":"@s", "objective":"vve_euler_f"}}, ", " ,{"score":{"name":"@s", "objective":"vve_euler_max"}}, ", " ,{"score":{"name":"@s", "objective":"vve_euler_vmax"}}, "]", ","]
tellraw @a ["    ", "target_euler: ", "[", {"score":{"name":"@s", "objective":"target_theta"}}, ", " ,{"score":{"name":"@s", "objective":"target_phi"}}, ", " ,{"score":{"name":"@s", "objective":"target_psi"}}, "]"]
tellraw @a "}"