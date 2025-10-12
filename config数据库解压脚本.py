# -*- coding: utf-8 -*-

import sqlite3
import os
import glob
import re

# --- 配置 ---
# 设置你的数据库文件所在的目录。'.' 代表当前目录。
SOURCE_DIRECTORY = '.' 
# 设置数据库文件的扩展名。脚本会查找所有以此结尾的文件。
DB_EXTENSION = '.db' 

def sanitize_filename(filename: str) -> str:
    """
    移除或替换掉文件名中非法的字符，以确保可以安全地创建文件。
    """
    # 移除非法字符: \ / : * ? " < > |
    sanitized = re.sub(r'[\\/*?:"<>|]', "", filename)
    # 替换掉可能引起问题的空格
    sanitized = sanitized.strip()
    return sanitized

def decode_data_to_json(encoded_bytes: bytes) -> str:
    """
    根据反汇编代码的逻辑，解密字节数据并将其转换为JSON字符串。
    (这个函数与我们之前创建的完全相同)
    """
    if not encoded_bytes:
        return "" # 如果数据为空，则返回空字符串
        
    key = 0x55
    decoded_data = bytearray(encoded_bytes)
    
    for i in range(len(decoded_data)):
        decoded_data[i] ^= key
        
    try:
        json_string = decoded_data.decode('utf-8')
        return json_string
    except UnicodeDecodeError:
        # 如果解码失败，可能意味着数据不是预期的格式或已损坏
        # 返回一个错误提示，而不是让整个程序崩溃
        return '{"error": "UnicodeDecodeError", "message": "Failed to decode bytes after XOR."}'

def process_database(db_path: str):
    """
    处理单个SQLite数据库文件。
    - 创建输出文件夹。
    - 连接数据库，提取数据。
    - 解密并保存为.json文件。
    """
    print(f"\n--- 正在处理数据库: {db_path} ---")
    
    # 1. 创建与数据库同名的输出文件夹
    db_filename = os.path.basename(db_path)
    dir_name, _ = os.path.splitext(db_filename)
    output_dir = os.path.join(SOURCE_DIRECTORY, dir_name)
    
    try:
        os.makedirs(output_dir, exist_ok=True)
        print(f"输出文件夹: '{output_dir}'")
    except OSError as e:
        print(f"错误：无法创建文件夹 '{output_dir}'. 原因: {e}")
        return

    # 2. 连接数据库并提取数据
    conn = None
    try:
        conn = sqlite3.connect(db_path)
        cursor = conn.cursor()
        
        # 从 DBObject 表中查询 id 和 jsonbytes
        cursor.execute('SELECT id, jsonbytes FROM DBObject')
        rows = cursor.fetchall()
        
        if not rows:
            print("警告: 在此数据库中未找到任何数据。")
            return
            
        print(f"发现 {len(rows)} 条记录，开始提取...")
        
        # 3. 遍历每一行数据
        for row in rows:
            file_id, blob_data = row
            
            # 解密 blob 数据
            json_content = decode_data_to_json(blob_data)
            
            # 清理id作为文件名
            safe_filename = sanitize_filename(file_id)
            if not safe_filename:
                print(f"警告: id '{file_id}' 无效，跳过此条记录。")
                continue

            output_filename = f"{safe_filename}.json"
            output_path = os.path.join(output_dir, output_filename)
            
            # 4. 将解密后的内容写入文件
            try:
                with open(output_path, 'w', encoding='utf-8') as f:
                    f.write(json_content)
                # print(f"  -> 已保存: {output_filename}") # 如果文件太多可以注释掉此行
            except IOError as e:
                print(f"错误: 无法写入文件 '{output_path}'. 原因: {e}")
                
        print(f"成功提取 {len(rows)} 个文件。")

    except sqlite3.Error as e:
        print(f"数据库错误: {e}")
    finally:
        if conn:
            conn.close()

def main():
    """
    主函数，查找并处理所有数据库文件。
    """
    print("开始执行JSON数据提取脚本...")
    # 查找指定目录下的所有匹配扩展名的数据库文件
    search_pattern = os.path.join(SOURCE_DIRECTORY, f'*{DB_EXTENSION}')
    db_files = glob.glob(search_pattern)
    
    if not db_files:
        print(f"在 '{SOURCE_DIRECTORY}' 目录中未找到任何 '{DB_EXTENSION}' 文件。")
        return
        
    print(f"共找到 {len(db_files)} 个数据库文件。")
    
    for db_file in db_files:
        process_database(db_file)
        
    print("\n--- 所有任务处理完毕 ---")

if __name__ == "__main__":
    main()