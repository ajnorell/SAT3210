#SAT3210
#Lab06
#Section 5
#ajnorell, ikgatti, ajurewic
#Mariadb


import mariadb
import sys
from prettytable import PrettyTable

try:
    con = mariadb.connect(
        user="root",
        password="P@ssw0rd",
        host="localhost",
        port=3306,
        database="school"
    )

    cursor = con.cursor()
       
    def start():
        sel = input('Would you like to update employees[1] or concessions[2]?')

        match sel:
            case "1":
                employees()

            case "2":
                concessions()

            case _:
                print("Option is not allowed. Please try again.")
                start()


    def employees():
        global emp_num
        emp_num = input("please enter the ID of the employee you would like to update location: ")

    def concessions():
        print()

    def show_emp():
        cursor.execute("SELECT * FROM employees",)
        if cursor.rowcount == 0:
            print("There is no one employed :(")
        else:
            rows = cursor.fetchall()
            table = PrettyTable(["ID","Location ID","Role", "Name"])
            for i in rows:
                table.add_row(i)
            print(table)
    
    def show_con():
        cursor.execute("SELECT * FROM concessions",)
        if cursor.rowcount == 0:
            print("There is no food :(")
        else:
            rows = cursor.fetchall()
            table = PrettyTable(["Type","Item","Price"])
            for i in rows:
                table.add_row(i)
            print(table)

    def location():
        show_emp()
        cursor.execute("UPDATE loc_ID from employee")
           
    def role():
         print()

    def name():
        print()


    
    

    if usr == '1':
    	print("[a] employees (location, role, name), [b] payroll(salary, acct num, routing num, address), [c] training (con, tix, man)")
        usr = input('a,b or c?')
    	 
        match usr:
         	case  "a":

            case ”b”:
            case “c”: 
            
    cursor.close()
           	
except mariadb.Error as e:
    print(f"Error from mariaDB: {e}")
    sys.exit(1)