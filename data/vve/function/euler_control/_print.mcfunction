#vve:euler_control/_print
# 打印临时对象数据

tellraw @a ["euler_control: ", "{"]
tellraw @a ["    ", "control_active: ", {"score":{"name":"control_active", "objective":"int"}}, ","]
tellraw @a ["    ", "damp_params: ", "[", {"score":{"name":"vve_euler_k", "objective":"int"}}, ", " ,{"score":{"name":"vve_euler_b", "objective":"int"}}, ", " ,{"score":{"name":"vve_euler_f", "objective":"int"}}, ", " ,{"score":{"name":"vve_euler_max", "objective":"int"}}, ", " ,{"score":{"name":"vve_euler_vmax", "objective":"int"}}, "]", ","]
tellraw @a ["    ", "target_euler: ", "[", {"score":{"name":"target_theta", "objective":"int"}}, ", " ,{"score":{"name":"target_phi", "objective":"int"}}, ", " ,{"score":{"name":"target_psi", "objective":"int"}}, "]"]
tellraw @a "}"