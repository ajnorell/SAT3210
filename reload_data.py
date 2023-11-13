#SAT3210
#Course Project
#Table Creation Script
#ajnorell, ajurewic, ikgatti
#Mariadb

import mariadb
import sys

try:
    con = mariadb.connect(
        user="root",
        password="P@ssw0rd",
        host="localhost",
        port=3306,
        database="test2" #TODO
    )
    
    cursor = con.cursor()

    cursor.execute("""
        LOAD DATA INFILE '~/SAT3210/theater.csv'
        REPLACE INTO TABLE theater
        FIELDS TERMINATED BY ','
        """)
    con.commit()

    cursor.close()

except mariadb.Error as e:
    print(f"Error from mariaDB: {e}")
    sys.exit(1)