cnt_to_coord = [(-1,-1,-1),(-1,-1,1),(-1,1,-1),(-1,1,1),(1,-1,-1),(1,-1,1),(1,1,-1),(1,1,1)]

coord_solid = {}
not_vis_coords = []

def shift_coord(coord,shift):
    return tuple(coord[i]+shift[i] for i in range(3))

def adj_init(n):
    global coord_solid, not_vis_coords,cnt_to_coord
    coord_solid = {}
    not_vis_coords = []
    cnt = 0
    while cnt<8:
        if n%2==1:
            coord_solid[cnt_to_coord[cnt]] = True
            not_vis_coords.append(cnt_to_coord[cnt])
        else:
            coord_solid[cnt_to_coord[cnt]] = False
        n //= 2
        cnt += 1

def n_to_filename(n: int) -> str:
    """
    将 0~255 的整数转为 8 位二进制下划线分隔的字符串。
    例如：255 -> "1_1_1_1_1_1_1_1"
          1   -> "0_0_0_0_0_0_0_1"
    """
    # 格式化为8位二进制字符串，不足补0
    bits = f'{n:08b}'
    # 用下划线连接每个字符
    return '_'.join(bits)

for i in range(256):
    adj_init(i)
    filename = n_to_filename(i)+'.mcfunction'
    with open(filename, 'w', encoding='utf-8') as f:
        f.write(f"""vve:object/iter_ball/{n_to_filename(i)}
# vve:object/iter_ball/search调用
""")
    while not_vis_coords:
        coord = not_vis_coords.pop()
        pass