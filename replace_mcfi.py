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
OLD_CONTENT = """scoreboard players operation sstemp_x int = vec_x int
scoreboard players operation sstemp_y int = vec_y int
scoreboard players operation sstemp_z int = vec_z int
scoreboard players operation vec_x int /= inertia int
scoreboard players operation vec_y int /= inertia int
scoreboard players operation vec_z int /= inertia int
scoreboard players operation sstemp_x int %= inertia int
scoreboard players operation sstemp_y int %= inertia int
scoreboard players operation sstemp_z int %= inertia int
scoreboard players operation vec_x int *= 10000 int
scoreboard players operation vec_y int *= 10000 int
scoreboard players operation vec_z int *= 10000 int
scoreboard players operation sstemp_x int *= 10000 int
scoreboard players operation sstemp_y int *= 10000 int
scoreboard players operation sstemp_z int *= 10000 int
scoreboard players operation sstemp_x int /= inertia int
scoreboard players operation sstemp_y int /= inertia int
scoreboard players operation sstemp_z int /= inertia int
scoreboard players operation vec_x int += sstemp_x int
scoreboard players operation vec_y int += sstemp_y int
scoreboard players operation vec_z int += sstemp_z int
scoreboard players operation angular_x int += vec_x int
scoreboard players operation angular_y int += vec_y int
scoreboard players operation angular_z int += vec_z int"""

# 新内容
NEW_CONTENT = """execute store result score vec_x int run compute default float vve:object/_apply_couple_x 10000
execute store result score vec_y int run compute default float vve:object/_apply_couple_y 10000
execute store result score vec_z int run compute default float vve:object/_apply_couple_z 10000
scoreboard players operation angular_x int += vec_x int
scoreboard players operation angular_y int += vec_y int
scoreboard players operation angular_z int += vec_z int"""
main()