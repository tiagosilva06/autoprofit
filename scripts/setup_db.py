import sqlite3
import os

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DB_PATH = os.path.join(BASE_DIR, 'data', 'autoprofit.db')
SQL_DIR = os.path.join(BASE_DIR, 'sql')

def run_sql_file(cursor, filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        sql = f.read()
    cursor.executescript(sql)

def setup():
    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()

    run_sql_file(cursor, os.path.join(SQL_DIR, 'schema.sql'))
    run_sql_file(cursor, os.path.join(SQL_DIR, 'seed.sql'))

    conn.commit()
    conn.close()
    print('Database created successfully!')

if __name__ == '__main__':
    setup()