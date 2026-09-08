import os

def process_file(filepath):
    """读取文件，若包含旧内容则替换并写回，返回是否修改"""
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
    except UnicodeDecodeError:
        # 若UTF-8解码失败，尝试其他编码（如GBK）或跳过
        try:
            with open(filepath, 'r', encoding='gbk') as f:
                content = f.read()
        except Exception:
            print(f"跳过无法读取的文件: {filepath}")
            return False

    if OLD_CONTENT not in content:
        return False

    new_content = content.replace(OLD_CONTENT, NEW_CONTENT)
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(new_content)
    return True

def main():
    root_dir = os.getcwd()
    modified_count = 0

    for dirpath, _, filenames in os.walk(root_dir):
        for filename in filenames:
            if filename.endswith('.mcfi'):
                filepath = os.path.join(dirpath, filename)
                if process_file(filepath):
                    modified_count += 1
                    print(f"已修改: {filepath}")

    print(f"\n完成！共修改 {modified_count} 个文件。")


# 旧内容（严格按您提供的格式，保留原换行和缩进）
OLD_CONTENT = """# 计算沿法线反方向的速度
scoreboard players operation stemp_v int = c_vx int
scoreboard players operation stemp_v int *= nvec_x int
scoreboard players operation stemp_0 int = c_vy int
scoreboard players operation stemp_0 int *= nvec_y int
scoreboard players operation stemp_v int += stemp_0 int
scoreboard players operation stemp_0 int = c_vz int
scoreboard players operation stemp_0 int *= nvec_z int
scoreboard players operation stemp_v int += stemp_0 int
scoreboard players operation stemp_v int /= -10000 int"""

# 新内容
NEW_CONTENT = """# 计算沿法线反方向的速度
execute store result score stemp_v int run compute default float vve:object/_calc_stemp_v -10000"""
main()