import sqlite3


with open("query_1.sql", "r", encoding="utf-8") as f:
    sql = f.read()

with sqlite3.connect("students.db") as con:

    cur = con.cursor()

    cur.execute(sql)

    result = cur.fetchall()

    for row in result:
        print(row)
