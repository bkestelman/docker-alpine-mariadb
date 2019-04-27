import mysql.connector

con = mysql.connector.connect(user='root', password='root', host='172.17.0.4', database='test')
cur = con.cursor()
cur.execute('create table foo (id int)')
con.commit()
con.close()
