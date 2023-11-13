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

    while var == "F":
        usr = input("What is the new location ID of this employee?:")
        usr = int(usr)

        # Validate user input
        cursor.execute("SELECT loc_ID FROM theater")
        rows = cursor.fetchall()
        for i in rows:
            if var =="F":
                for j, entry in enumerate(rows):
                    if usr == entry:
                        var = "T"
                        print("Match Found")
                        break
            else:
                break
        if var =="F":
            print("That is not a valid Location ID. Please Try again.")
            break

        

except mariadb.Error as e:
    print(f"Error from mariaDB: {e}")
    sys.exit(1)