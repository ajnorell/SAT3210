#SAT3210
#Lab06
#Section 5
#ajnorell
#Mariadb
#
#
import mariadb
import sys
from prettytable import prettyTable

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
        print("")
        sel = input("Select from the above menu(1-5):")

    def dups():
        cursor.execute("""
            SELECT count(name) AS c
            FROM student
            WHERE c>2
                       
                       
                       
                       
        """)
    
    
    def dept_dups():
        print()
    
    
    def lookup_stu():
        print()
        

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