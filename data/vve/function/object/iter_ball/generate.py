cnt_to_coord = [(-1,-1,-1),(-1,-1,1),(-1,1,-1),(-1,1,1),(1,-1,-1),(1,-1,1),(1,1,-1),(1,1,1)]

coord_solid = {}
not_vis_coords = []

def shift_coord(coord, shift):
    return tuple(coord[i] + shift[i] for i in range(3))

def adj_init(n):
    global coord_solid, not_vis_coords, cnt_to_coord
    coord_solid = {}
    not_vis_coords = []
    cnt = 0
    while cnt < 8:
        if n % 2 == 1:
            coord_solid[cnt_to_coord[cnt]] = True
            not_vis_coords.append(cnt_to_coord[cnt])
        else:
            coord_solid[cnt_to_coord[cnt]] = False
        n //= 2
        cnt += 1

def n_to_filename(n: int) -> str:
    bits = f'{n:08b}'
    return '_'.join(bits)

# ---------- 新增的两个占位函数（用户自行实现） ----------
def build_size_1(coord):
    """在单个方块中心执行的逻辑"""
    global filename, index
    with open(filename, 'a', encoding='utf-8') as f:
        f.write(f"""
# build_size_1:({coord})
scoreboard players set vve_solid_box_l int 5000
scoreboard players set vve_solid_box_x int {coord[0]*5000}
scoreboard players set vve_solid_box_y int {coord[1]*5000}
scoreboard players set vve_solid_box_z int {coord[2]*5000}
scoreboard players operation vve_solid_box_x int += stemp_x int
scoreboard players operation vve_solid_box_y int += stemp_y int
scoreboard players operation vve_solid_box_z int += stemp_z int
function vve:solid_box/_detect_ball
scoreboard players operation ball_receiver_res int > res int
execute if score res int matches 1 run function vve:object/_receive_ball_shift
execute if score bounce_layer_response int matches 1 run function vve:object/_receive_bounce_layer
execute if score grab_layer_response int matches 1 run function vve:object/_receive_grab_layer
scoreboard players operation friction_receiver_response int < friction_response int
execute if score shift_response int matches 1 run function vve:object/_receive_shift
execute if score impulse_response int matches 1 run function vve:object/_dec_impulse
""")

def build_size_2(center):
    """在2×2×2大方块中心执行的逻辑"""
    global filename, index
    with open(filename, 'a', encoding='utf-8') as f:
        f.write(f"""
# build_size_2:({center})
scoreboard players set vve_solid_box_l int 10000
scoreboard players set vve_solid_box_x int {center[0]*5000}
scoreboard players set vve_solid_box_y int {center[1]*5000}
scoreboard players set vve_solid_box_z int {center[2]*5000}
scoreboard players operation vve_solid_box_x int += stemp_x int
scoreboard players operation vve_solid_box_y int += stemp_y int
scoreboard players operation vve_solid_box_z int += stemp_z int
function vve:solid_box/_detect_ball
scoreboard players operation ball_receiver_res int > res int
execute if score res int matches 1 run function vve:object/_receive_ball_shift
execute if score bounce_layer_response int matches 1 run function vve:object/_receive_bounce_layer
execute if score grab_layer_response int matches 1 run function vve:object/_receive_grab_layer
scoreboard players operation friction_receiver_response int < friction_response int
execute if score shift_response int matches 1 run function vve:object/_receive_shift
execute if score impulse_response int matches 1 run function vve:object/_dec_impulse
""")
# -------------------------------------------------------

for index in range(256):
    adj_init(index)
    filename = n_to_filename(index) + '.mcfunction'
    with open(filename, 'w', encoding='utf-8') as f:
        f.write(f"""#vve:object/iter_ball/{n_to_filename(index)}
# vve:object/iter_ball/search调用
""")
    
    # ---------- 替换原有的 while 循环内容 ----------
    while not_vis_coords:
        coord = not_vis_coords.pop()
        
        best_d = None
        best_count = -1
        
        # 枚举 8 种可能的方向组合（每个轴取 +2 或 -2）
        for dx in (2, -2):
            for dy in (2, -2):
                for dz in (2, -2):
                    count = 0
                    count_inner = 0
                    # 计算该候选立方体的 8 个角坐标
                    for i in (0, 1):
                        for j in (0, 1):
                            for k in (0, 1):
                                pos = (coord[0] + i * dx,
                                       coord[1] + j * dy,
                                       coord[2] + k * dz)
                                # 只统计 coord_solid 中明确标记为 True 的方块
                                if coord_solid.get(pos, True):
                                    count += 1
                                if pos in coord_solid:
                                    count_inner += 1
                    if count < 8: continue
                    # 更新最佳候选
                    if count_inner > best_count:
                        best_count = count_inner
                        best_d = (dx, dy, dz)
        
        # 决策：是否使用 size2
        if best_count >= 2:
            dx, dy, dz = best_d
            # 计算大方块的中心坐标
            center = (coord[0] + dx // 2,
                      coord[1] + dy // 2,
                      coord[2] + dz // 2)
            
            # 从 not_vis_coords 中移除该大方块涉及的其他实心方块
            for i in (0, 1):
                for j in (0, 1):
                    for k in (0, 1):
                        pos = (coord[0] + i * dx,
                               coord[1] + j * dy,
                               coord[2] + k * dz)
                        if pos != coord and pos in not_vis_coords:
                            not_vis_coords.remove(pos)
            
            build_size_2(center)
        else:
            build_size_1(coord)
    # -------------------------------------------------