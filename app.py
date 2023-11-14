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
        database="prod"
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
        global var
        global emp_num
        print("[1] location\n[2] role\n[3] name\n[4] salary\n[5] account number\n[6] routing number\n[7] address\n[8] training\n\n")
        sel = input("What aspect would you like to update?: ")
#TODO fix validation
        show_emp()
        emp_num = input("please enter the ID of the employee you would like to update. Dont mess it up: ")

        #cursor.execute("SELECT emp_ID FROM employees")
        #rows = cursor.fetchall()
        #for i in rows:
        #    if var =="F":
        #        for j, entry in enumerate(rows):
        #            if entry == emp_num:
        #                var = "T"
        #                break
        #    else:
        #        break

        #if var =="F":
        #    print("That is not a valid Employee ID. Please Try again.")

        

        var = "F"

        
        while var == "F":
            match sel:
                case "1": # Location
#TODO Input Location vs Loc_ID
                    usr = input
                    show_loc()
                    usr = str(input("What is the new location ID of this employee?:"))

                    # Validate user input
                    cursor.execute("SELECT loc_ID FROM theater")
                    rows = cursor.fetchall()
                    for i in rows:
                        for j, entry in enumerate(i):
                            if entry == usr:
                                usr = int(usr)
                                # Update the table
                                cursor.execute("""
                                    UPDATE employees 
                                    SET loc_ID = ? 
                                    WHERE emp_ID = ?
                                """, (usr,emp_num))
                                con.commit()
                                show_emp()
                                var = "T"  

                    if var == "F":
                        print("Not a valid Location ID.")

                case "2": # Role
                    usr = input
                    show_emp()
                    usr = input("What is the new Role of this employee?:")


                    # Validate user input
                    if len(usr) <= 13:
                        # Update the table
                        cursor.execute("""
                        UPDATE employees 
                        SET role = ? 
                        WHERE emp_ID = ?
                        """,
                        (usr,emp_num))
                        con.commit()
                        var = "T"
                        show_emp()

                    else:
                        print("That is too many characters, Please reduce the number of characters to 13 or less.")
                
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
                        var = "T"
                        show_emp()

                    else:
                        print("That is too many characters, Please reduce the number of characters to 50 or less.")
                

                case "4": # Salary
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
                        var = "T"
                        show_pay(emp_num)

                    else:
                        print("That is too many characters, Please reduce the number of characters to 13 or less.")
                
                case "6": # Rout Num
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
                        var = "T"
                        show_pay(emp_num)

                    else:
                        print("That is too many characters, Please reduce the number of characters to 13 or less.")
                

                case "7": # Address
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
                        var = "T"
                        show_pay(emp_num)

                    else:
                        print("That is too many characters, Please reduce the number of characters to 50 or less.")
                

                case "8": # Training
# TODO Check boolean values are correct
                    show_train(emp_num)
                    

                    print("[1] Concessions Training\n[2] Tickets Training\n[3] Manager Training")
                    usr = input("Which training would you like to edit?: ")
                    usr2 = input("Would you like to add or remove the training?: ")
                    usr2 = usr2.lower()
                    
                    match usr:
                        case "1":
                            if usr2 == "add":
                                cursor.execute("""
                                    UPDATE training 
                                    SET con_training = 1 
                                    WHERE emp_ID == ?
                                """,(emp_num))
                                con.commmit()
                                var = "T"

                            elif usr2 == "remove":
                                cursor.execute("""
                                    UPDATE training 
                                    SET con_training = 0 
                                    WHERE emp_ID == ?
                                """,(emp_num))
                                con.commmit()
                                var = "T"

                            else:
                                print("Invalid add/remove. No data was changed")

                        case "2":
                            if usr2 == "add":
                                cursor.execute("""
                                    UPDATE training 
                                    SET tix_training = 1
                                    WHERE emp_ID == ?
                                """,(emp_num))
                                con.commmit()
                                var = "T"

                            elif usr2 == "remove":
                                cursor.execute("""
                                    UPDATE training 
                                    SET tix_training = 0 
                                    WHERE emp_ID == ?
                                """,(emp_num))
                                con.commmit()
                                var = "T"

                            else:
                                print("Invalid add/remove. No data was changed")


                        case "3":
                            if usr2 == "add":
                                cursor.execute("""
                                    UPDATE training 
                                    SET man_training = 1 
                                    WHERE emp_ID == ?
                                """,(emp_num))
                                con.commmit()
                                var = "T"

                            elif usr2 == "remove":
                                cursor.execute("""
                                    UPDATE training 
                                    SET man_training = 0 
                                    WHERE emp_ID == ?
                                """,(emp_num))
                                con.commmit()
                                var = "T"

                            else:
                                print("Invalid add/remove. No data was changed")

                        case _:
                            print("That is not  a valid option, Please try again.")

                    show_train(emp_num)

                case _:
                    print("Option is not allowed. Please try again.")
                    employees()


    def concessions():
        global var
        print("[1] Add concessions\n[2] remove concessions\n[3] update an item\n")
        sel = input("What would you like to update?: ")

        match sel:
            case "1":
                usr = input("Where is the type of item offered? (Basic, Full, Restaurant): ")
                usr2 = input("What is the name of the item?: ")
                usr3 = input("What is the price of the item?: ")

                cursor.execute("""
                INSERT INTO concessions 
                VALUES(?,?,?)
                """,(usr,usr2,usr3))
                con.commit()
                show_con()

            case "2":
                show_con()
                usr = input("What is the name of item to remove?:")
                cursor.execute("""
                DELETE FROM concessions
                WHERE item == ?
                """,(usr))
                con.commit()

            case "3":
                show_con()
                sel2 = input("What is the name of item you want to edit?: ")
                print("[1] Type\n[2] Item\n[3] Price\n")
                sel1 = input("What would you like to update?:" )


                match sel1:
                    case "1":
                        usr = input("Where is the type of item offered? (Basic, Full, Restaurant): ")
                        cursor.execute("""
                        UPDATE concessions
                        SET type = ?
                        WHERE item == ?
                        """,(usr, sel2))
                        con.commit()
                        show_con()
                    
                    case "2":
                        usr = input("What is the new name of the item?: ")
                        cursor.execute("""
                        UPDATE concessions
                        SET item = ?
                        WHERE item == ?
                        """,(usr, sel2))
                        con.commit()
                        show_con()

                    case "3":
                        usr = input("What is the new price of the item?: ")
                        cursor.execute("""
                        UPDATE concessions
                        SET price = ?
                        WHERE item == ?
                        """,(usr, sel2))
                        con.commit()
                        show_con()

                    case _:
                        print("Option is not allowed. Please try again.")
                        concessions()
                    
            case _:
                print("Option is not allowed. Please try again.")
                concessions()



    def show_emp():
#TODO Show location vs location ID
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
        cursor.execute("SELECT location, loc_ID FROM theater",)
        if cursor.rowcount == 0:
            print("There are no locations :(")
        else:
            rows = cursor.fetchall()
            table = PrettyTable(["Location","Location ID"])
            for i in rows:
                table.add_row(i)
            print(table)

#FIXME: TODO
    def show_pay(emp):
        cursor.execute("SELECT name, emp_ID, salary, acct_num, routing_num, address FROM payroll INNER JOIN employees USING (?)", (emp))
        rows = cursor.fetchall()
        table = PrettyTable(["Name", "Employee ID", "Salary", "Account Number", "Routing Number", "Address"])
        for i in rows:
            table.add_row(i)
        print(table)

#FIXME: TODO
    def show_train(emp):
# TODO Make boolean readable
        cursor.execute("SELECT * FROM training WHERE emp_ID == ?", (emp))
        rows = cursor.fetchall()
        table = PrettyTable(["Employee ID", "Concessions Training", "Ticket Training", "Manager Training"])
        for i in rows:
            table.add_row(i)
        print(table)



    try:
        show_train(1)
        show_pay(1)
        show_emp()
        show_con()
        show_loc()
    except:
        print("A error occured")

    cursor.close()
           	
except mariadb.Error as e:
    print(f"Error from mariaDB: {e}")
    sys.exit(1)