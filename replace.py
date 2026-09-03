import os

# 旧内容（严格按您提供的格式，保留原换行和缩进）
OLD_CONTENT = """scoreboard players operation sstempx int = sstemp_tx int
scoreboard players operation sstemp_tx int = sstemp_ay int
scoreboard players operation sstemp_tx int *= sstemp_tz int
scoreboard players operation sstemp0 int = sstemp_ty int
scoreboard players operation sstemp0 int *= sstemp_az int
scoreboard players operation sstemp_tx int -= sstemp0 int
scoreboard players operation sstemp_tx int /= 10000 int
scoreboard players operation sstempy int = sstemp_ty int
scoreboard players operation sstemp_ty int = sstemp_az int
scoreboard players operation sstemp_ty int *= sstemp_tx int
scoreboard players operation sstemp0 int = sstemp_tz int
scoreboard players operation sstemp0 int *= sstemp_ax int
scoreboard players operation sstemp_ty int -= sstemp0 int
scoreboard players operation sstemp_ty int /= 10000 int
scoreboard players operation sstemp_tz int = sstempy int
scoreboard players operation sstemp_tz int *= sstemp_ax int
scoreboard players operation sstemp0 int = sstemp_ay int
scoreboard players operation sstemp0 int *= sstempx int
scoreboard players operation sstemp_tz int -= sstemp0 int
scoreboard players operation sstemp_tz int /= 10000 int"""

# 新内容
NEW_CONTENT = """execute store result score sstempx int run compute default float vve:object/_liner_tx 10000
execute store result score sstempy int run compute default float vve:object/_liner_ty 10000
execute store result score sstemp_tz int run compute default float vve:object/_liner_tz 10000
scoreboard players operation sstemp_tx int = sstempx int
scoreboard players operation sstemp_ty int = sstempy int"""

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
            if filename.endswith('.mcfunction'):
                filepath = os.path.join(dirpath, filename)
                if process_file(filepath):
                    modified_count += 1
                    print(f"已修改: {filepath}")

    print(f"\n完成！共修改 {modified_count} 个文件。")

if __name__ == "__main__":
    main()