#SAT3210
#Lab06
#Section 5
#ajnorell, ikgatti, ajurewic
#Mariadb


import mariadb
import sys
from prettytable import PrettyTable

global var
global emp_num
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

        while var == "F":
            show_emp()
            global emp_num
            emp_num = input("please enter the ID of the employee you would like to update: ")

            cursor.execute("SELECT emp_ID FROM employees")
            rows = cursor.fetchall()
            for i in rows:
                global var
                if var =="F":
                    for j, entry in enumerate(rows):
                        if emp_num == entry:
                            var = "T"
                            break
                else:
                    break
            if var =="F":
                print("That is not a valid Location ID. Please Try again.")
                break
        
        var = "F"

        
        while var == "F":
            match sel:
                case "1": # Location
                    usr = input
                    show_loc()
                    usr = input("What is the new location ID of this employee?:")
                    usr = int(usr)

                    # Validate user input
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
                    
                    # Update the table
                    cursor.execute("""
                        UPDATE employees 
                        SET loc_ID = ? 
                        WHERE emp_ID = ?
                    """,
                    (usr,emp_num))
                    con.commit()

                case "2": # Role
                    usr = input
                    show_emp()
                    usr = input("What is the new Role of this employee?:")


                    # Validate user input
                    if len(usr) <= 10:
                        # Update the table
                        cursor.execute("""
                        UPDATE employees 
                        SET role = ? 
                        WHERE emp_ID = ?
                        """,
                        (usr,emp_num))
                        con.commit()
                        global var
                        var = "T"

                    else:
                        print("That is too many characters, Please reduce the number of characters to 50 or less.")
                
                case "3": # Name
                    usr = input
                    show_emp()
                    usr = input("What is the new Name of this employee?:")


                    # Validate user input
                    if len(usr) <= 50:
                        # Update the table
                        cursor.execute("""
                        UPDATE employees 
                        SET name = ? 
                        WHERE emp_ID = ?
                        """,
                        (usr,emp_num))
                        con.commit()
                        global var
                        var = "T"

                    else:
                        print("That is too many characters, Please reduce the number of characters to 10 or less.")
                

                case "4": # Salary
                    usr = input
                    show_pay(emp_num)
                    usr = input("What is the new Salary of this employee?:")
                    usr = float(usr)

                    # Validate user input
                    #TODO
                    
                    # Update the table
                    cursor.execute("""
                        UPDATE payroll 
                        SET salary = ? 
                        WHERE emp_ID = ?
                    """,
                    (usr,emp_num))
                    con.commit()

                case "5": # Acct Num
                    usr = input
                    show_pay(emp_num)
                    usr = input("What is the new account number for this employee?:")
                    

                    # Validate user input
                    if len(usr) <= 13:
                        usr = int(usr)
                        # Update the table
                        cursor.execute("""
                        UPDATE payroll 
                        SET acct_num = ? 
                        WHERE emp_ID = ?
                        """,
                        (usr,emp_num))
                        con.commit()
                        global var
                        var = "T"

                    else:
                        print("That is too many characters, Please reduce the number of characters to 13 or less.")
                
                case "6": # Rout Num
                    usr = input
                    show_pay(emp_num)
                    usr = input("What is the new routing number for this employee?:")
                    

                    # Validate user input
                    if len(usr) <= 13:
                        usr = int(usr)
                        # Update the table
                        cursor.execute("""
                        UPDATE payroll 
                        SET routing_num = ? 
                        WHERE emp_ID = ?
                        """,
                        (usr,emp_num))
                        con.commit()
                        global var
                        var = "T"

                    else:
                        print("That is too many characters, Please reduce the number of characters to 13 or less.")
                

                case "7": # Address
                    usr = input
                    show_pay(emp_num)
                    usr = input("What is the new address for this employee?:")


                    # Validate user input
                    if len(usr) <= 50:
                        # Update the table
                        cursor.execute("""
                        UPDATE payroll 
                        SET address = ? 
                        WHERE emp_ID = ?
                        """,
                        (usr,emp_num))
                        con.commit()
                        global var
                        var = "T"

                    else:
                        print("That is too many characters, Please reduce the number of characters to 50 or less.")
                

                case "8": # Training
                    print()
                    #TODO

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

    def show_pay(emp):
        cursor.execute("SELECT name, emp_ID, salary, acct_num, routing_num, address FROM payroll INNER JOIN employees ON emp_ID WHERE emp_ID == ?", (emp))
        rows = cursor.fetchall()
        table = PrettyTable(["Name", "Employee ID", "Salary", "Account Number", "Routing Number", "Address"])
        for i in rows:
            table.add_row(i)
        print(table)





    start()

    cursor.close()
           	
except mariadb.Error as e:
    print(f"Error from mariaDB: {e}")
    sys.exit(1)