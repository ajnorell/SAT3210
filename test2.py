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

    show_loc()

    cursor.execute("SELECT location, loc_ID FROM theater",)
    rows = cursor.fetchall()
    usr = 1

    for i in rows:
        print(i)
            
        

        

except mariadb.Error as e:
    print(f"Error from mariaDB: {e}")
    sys.exit(1)