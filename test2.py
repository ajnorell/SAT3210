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

    usr = "pop"


    cursor.execute("""
        DELETE FROM concessions
        WHERE item = ?
        """,(usr,))
    con.commit()
    
except mariadb.Error as e:
    print(f"Error from mariaDB: {e}")
    sys.exit(1)   