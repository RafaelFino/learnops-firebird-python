from firebird.driver import connect

print("Python simple Firebird DB  connector")
print(" Trying to connect...")
con = connect('/tmp/test.db', user='SYSDBA', password='1234')

cur = con.cursor()

print(" Executing query...")
cur.execute("select * from table1")

print("Result:")
print(cur.fetchall())

