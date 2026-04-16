import sqlite3
from pathlib import Path

path = Path('db/development.sqlite3')
if not path.exists():
    print('NO_DB')
else:
    conn = sqlite3.connect(path)
    cur = conn.cursor()
    try:
        cur.execute('SELECT id, username, email FROM users')
        rows = cur.fetchall()
        if not rows:
            print('NO_USERS')
        else:
            for row in rows:
                print(row)
    except Exception as e:
        print('ERR', e)
    finally:
        conn.close()
