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
        database="test2"
    )
    
    cursor = con.cursor()

    cursor.execute("""
        LOAD DATA LOCAL INFILE '/home/sat3210/SAT3210/theater.csv'
        REPLACE INTO TABLE theater
        FIELDS TERMINATED BY ','
        IGNORE 1 LINES
        """)
    con.commit()

    cursor.execute("""
        LOAD DATA LOCAL INFILE '/home/sat3210/SAT3210/employees.csv'
        REPLACE INTO TABLE employees
        FIELDS TERMINATED BY ','
        IGNORE 1 LINES
        """)
    con.commit()

    cursor.execute("""
        LOAD DATA LOCAL INFILE '/home/sat3210/SAT3210/concessions.csv'
        REPLACE INTO TABLE concessions
        FIELDS TERMINATED BY ','
        IGNORE 1 LINES
        """)
    con.commit()

    cursor.execute("""
        LOAD DATA LOCAL INFILE '/home/sat3210/SAT3210/time_slot.csv'
        REPLACE INTO TABLE time_)slot
        FIELDS TERMINATED BY ','
        IGNORE 1 LINES
        """)
    con.commit()

    cursor.execute("""
        LOAD DATA LOCAL INFILE '/home/sat3210/SAT3210/payroll.csv'
        REPLACE INTO TABLE payroll
        FIELDS TERMINATED BY ','
        IGNORE 1 LINES
        """)
    con.commit()

    cursor.execute("""
        LOAD DATA LOCAL INFILE '/home/sat3210/SAT3210/screens.csv'
        REPLACE INTO TABLE screens
        FIELDS TERMINATED BY ','
        IGNORE 1 LINES
        """)
    con.commit()

    cursor.execute("""
        LOAD DATA LOCAL INFILE '/home/sat3210/SAT3210/movies.csv'
        REPLACE INTO TABLE movies
        FIELDS TERMINATED BY ','
        IGNORE 1 LINES
        """)
    con.commit()

    cursor.execute("""
        LOAD DATA LOCAL INFILE '/home/sat3210/SAT3210/training.csv'
        REPLACE INTO TABLE training
        FIELDS TERMINATED BY ','
        IGNORE 1 LINES
        """)
    con.commit()

    cursor.close()

except mariadb.Error as e:
    print(f"Error from mariaDB: {e}")
    sys.exit(1)