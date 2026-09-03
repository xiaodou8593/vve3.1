import os

# 旧内容（严格按您提供的格式，保留原换行和缩进）
OLD_CONTENT = """scoreboard players operation sstemp_ax int = angular_x int
scoreboard players operation sstemp_ay int = angular_y int
scoreboard players operation sstemp_az int = angular_z int
scoreboard players operation sstemp_ax int /= 100 int
scoreboard players operation sstemp_ay int /= 100 int
scoreboard players operation sstemp_az int /= 100 int

# 线速度组成部分"""

# 新内容
NEW_CONTENT = """# 线速度叉乘计算"""

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

if __name__ == "__main__":
    main()