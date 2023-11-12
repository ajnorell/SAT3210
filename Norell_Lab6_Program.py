#SAT3210
#Lab06
#Section 5
#ajnorell
#Mariadb
#
#
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

    def menu():
        global sel
        print("1: Select Duplicates\n2: Select Duplicates From Department\n3: Search Students and Delete")
        sel = input("Select from the above menu(1-5):")

    def dups():

        usr = input("What Number of users who have the matching name want to see?:")
        
        cursor.execute("""
            SELECT name, ID
            FROM student
            WHERE name
            IN(
            SELECT name
            FROM student
            GROUP BY name
            HAVING count(*) = ?
            )
            ORDER BY name
            """,(usr))
        
        if cursor.rowcount == 0:
            print("No results from Query")
        else:
            rows = cursor.fetchall()
            table = PrettyTable(["Name", "ID"])
            for i in rows:
                table.add_row(i)
            print(table)
    
    def dept_dups():

        usr = input("What Number of users who have the matching name want to see?:")
        usr2 = input("From what department?:")

        cursor.execute("""
            SELECT name, ID, dept_name
            FROM student
            WHERE dept_name = ?
            AND name IN(
            SELECT name, dept_name
            FROM student
            WHERE dept_name = ?
            GROUP BY name
            HAVING count(*) = ?
            )
            ORDER BY name
            """,(usr2, usr2, usr))
        
        if cursor.rowcount == 0:
            print("No results from Query")

        else:
            rows = cursor.fetchall()
            table = PrettyTable(["Name", "ID", "Department"])
            for i in rows:
                table.add_row(i)

            print(table)
    
    
    def lookup_stu():

        usr = input("What Number of users who have the matching name want to see?:")
        usr2 = input("From what department?:")

        cursor.execute("""
            SELECT name, ID, dept_name
            FROM student
            WHERE dept_name = ?
            AND name IN(
            SELECT name, dept_name
            FROM student
            WHERE dept_name = ?
            GROUP BY name
            HAVING count(*) = ?
            )
            ORDER BY name
            """,(usr2, usr2, usr))
        
        if cursor.rowcount == 0:
            print("No results from Query")

        else:
            rows = cursor.fetchall()
            table = PrettyTable(["Name", "ID", "Department"])
            for i in rows:
                table.add_row(i)

            print(table)
            usr3 = input("Would you like to Delete a student?(yes/no):")
            
            if usr == "yes":
                usr = input("Enter the ID number of the student to delete:")
                cursor.execute("""
                    DELETE FROM student WHERE ID = ?
                    """,(usr3))
                con.commit()
                cursor.execute("""
                    SELECT name, ID, dept_name
                    FROM student
                    WHERE dept_name = ?
                    AND name IN(
                    SELECT name, dept_name
                    FROM student
                    WHERE dept_name = ?
                    GROUP BY name
                    HAVING count(*) = ?
                    )
                    ORDER BY name
                    """,(usr2, usr2, usr))
        
                if cursor.rowcount == 0:
                    print("No results from Query")

                else:
                    rows = cursor.fetchall()
                    table = PrettyTable(["Name", "ID", "Department"])
                    for i in rows:
                        table.add_row(i)
                    print(table)
                
    menu()
    
    match sel:
        case "1":
            dups()

        case "2":
            dept_dups()

        case "3":
            lookup_stu()

        case _:
            print("Option not allowed. Please try again")
            menu()

    cursor.close()

except mariadb.Error as e:
    print(f"Error from mariaDB: {e}")
    sys.exit(1)