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


    # Validate user input
    cursor.execute("SELECT loc_ID FROM theater")
    rows = cursor.fetchall()
    for i in rows:
        print(i)
            
        

        

except mariadb.Error as e:
    print(f"Error from mariaDB: {e}")
    sys.exit(1)