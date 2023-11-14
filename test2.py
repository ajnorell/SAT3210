import mariadb
import sys
from prettytable import PrettyTable

try:
    con = mariadb.connect(
        user="root",
        password="P@ssw0rd",
        host="localhost",
        port=3306,
        database="prod"
    )


    cursor = con.cursor()
    cursor.execute("SELECT name, emp_ID, salary, acct_num, routing_num, address FROM payroll INNER JOIN employees USING (emp_ID)")
    rows = cursor.fetchall()
    table = PrettyTable(["Name", "Employee ID", "Salary", "Account Number", "Routing Number", "Address"])
    for i in rows:
        table.add_row(i)
    print(table)


        

except mariadb.Error as e:
    print(f"Error from mariaDB: {e}")
    sys.exit(1)