from firebird.driver import connect

con = connect('/tmp/test.db', user='SYSDBA', password='1234')

cur = con.cursor()
cur.execute("select * from table1")
print(cur.fetchall())

