#SAT3210
#Lab06
#Section 5
#ajnorell
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
       
    def location():
        emp_num = input("please enter an emp_ID you would like to update location: ")

        cursor.execute("UPDATE loc_ID from employee")
           
    def role():
         print()

    def name():
        print()


	#menu for updating case

    print('Would you like to update employees[1] or concessions[2]?')
    
    usr = input('1 or 2: ')

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