#SAT3210
#Lab06
#Section 5
#ajnorell, ikgatti, ajurewic
#Mariadb


import mariadb
import sys
from prettytable import PrettyTable

global var
var ="F"

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
        print("[1] employees\n[2] concessions")
        sel = input("Which one would you like to update?: ")

        match sel:
            case "1":
                employees()

            case "2":
                concessions()

            case _:
                print("Option is not allowed. Please try again.")
                start()


    def employees():
        
        print("[1] location\n[2] role\n[3] name\n[4] salary\n[5] account number\n[6] routing number\n[7] address\n[8] training\n\n")
        sel = input("What aspect would you like to update?: ")

        show_emp()
        emp_num = input("please enter the ID of the employee you would like to update: ")

        
        while var == "F":
            match sel:
                case "1": # Location
                    usr = input
                    show_loc()
                    usr = input("What is the new location_ID of this employee?:")
                    usr = int(usr)

                    cursor.execute("SELECT loc_ID FROM theater")
                    rows = cursor.fetchall()
                    for i in rows:
                        global var
                        if var =="F":
                            for j, entry in enumerate(rows):
                                if usr == entry:
                                    var = "T"
                                    break
                        else:
                            break
                    if var =="F":
                        print("That is not a valid Location ID. Please Try again.")
                        break

                    cursor.execute("""
                        UPDATE employees 
                        SET loc_ID = ? 
                        WHERE emp_ID = ?
                    """,(usr,emp_num))
                    con.commit()

                case "2": # Role
                    print()

                case "3": # Name
                    print()

                case "4": # Salary
                    print()

                case "5": # Acct Num
                    print()

                case "6": # Rout Num
                    print()

                case "7": # Address
                    print()

                case "8": # Training
                    print()

                case _:
                    print("Option is not allowed. Please try again.")
                    employees()


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

    def show_loc():
        cursor.execute("SELECT location loc_id FROM theater",)
        if cursor.rowcount == 0:
            print("There are no locations :(")
        else:
            rows = cursor.fetchall()
            table = PrettyTable(["Location","Location ID"])
            for i in rows:
                table.add_row(i)
            print(table)


    cursor.close()
           	
except mariadb.Error as e:
    print(f"Error from mariaDB: {e}")
    sys.exit(1)