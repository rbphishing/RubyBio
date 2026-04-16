import sqlite3
from pathlib import Path
path = Path('storage/development.sqlite3')
print('DBPATH', path.exists(), path)
if not path.exists():
    raise SystemExit('NO_DB')
conn = sqlite3.connect(path)
cur = conn.cursor()
cur.execute('SELECT id, username, email FROM users')
rows = cur.fetchall()
for row in rows:
    print(row)
conn.close()
