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
    global var
    var = "F"

    emp_num = input("please enter the ID of the employee you would like to update: ")

    cursor.execute("SELECT emp_ID FROM employees")
    rows = cursor.fetchall()
    for i in rows:
        if var =="F":
            for j, entry in enumerate(rows):
                print(entry)
                if entry == emp_num:
                    var = "T"
                    
                    break
        else:
            break

    if var =="F":
        print("That is not a valid Employee ID. Please Try again.")


        

except mariadb.Error as e:
    print(f"Error from mariaDB: {e}")
    sys.exit(1)