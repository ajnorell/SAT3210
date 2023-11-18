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
        local_infile=1
    )
    
    cursor = con.cursor()

    cursor.execute("""
        DROP DATABASE IF EXISTS test
    """)
    con.commit()

    cursor.execute("""
        CREATE DATABASE test
    """)
    con.commit()

    cursor.execute("""
        USE test
    """)
    con.commit()

    cursor.execute("""
        CREATE TABLE theater (
        loc_ID varchar(5) NOT NULL PRIMARY KEY,
        location varchar(20) NOT NULL,
        num_screens int(2) NOT NULL,
        con_type varchar(10)
        )   
    """)
    con.commit()

    cursor.execute("""
        CREATE TABLE employees(
        emp_ID varchar(5) PRIMARY KEY,
        loc_ID varchar(5),
        role varchar(10),
        name varchar(50) NOT NULL,
        FOREIGN KEY (loc_ID) REFERENCES theater (loc_ID)
        )
    """)
    con.commit()

    cursor.execute("""
        CREATE TABLE concessions(
        con_type varchar(10),
        item varchar(50) PRIMARY KEY,
        price decimal(4,2) NOT NULL
        )
    """)
    con.commit()

    cursor.execute("""
        CREATE TABLE time_slot(
        slot_ID varchar(4) PRIMARY KEY,
        day varchar(1),
        start_hr decimal(2,0),
        start_min decimal(2,0)
        )
    """)
    con.commit()

    cursor.execute("""
        CREATE TABLE payroll(
        emp_ID varchar(5) PRIMARY KEY,
        salary decimal(4,2) NOT NULL DEFAULT(10.00),
        SSN varchar(9) NOT NULL,
        acct_num varchar(13),
        routing_num varchar(13),
        address varchar(50),
        FOREIGN KEY (emp_ID) REFERENCES employees (emp_ID)
        )               
    """)
    con.commit()

    cursor.execute("""
        CREATE TABLE screens(
        screen_ID varchar(4) PRIMARY KEY,
        loc_ID varchar(5) NOT NULL,
        screen_num varchar(2) NOT NULL,
        seat_type varchar(10),
        screen_type varchar(10),
        capacity decimal(3,0) NOT NULL,
        FOREIGN KEY (loc_ID) REFERENCES theater (loc_ID)
       )            
    """)
    con.commit()

    cursor.execute("""
        CREATE TABLE movies(
        now_showing boolean NOT NULL,
        showing_ID varchar(4) PRIMARY KEY,
        title varchar(50) NOT NULL,
        time_slot_ID varchar(4) NOT NULL,
        loc_ID varchar(5) NOT NULL,
        screen_ID varchar(4) NOT NULL,
        start_date decimal(2,0) NOT NULL,
        start_month decimal(2,0) NOT NULL,
        end_date decimal(2,0) NOT NULL,
        end_month decimal(2,0) NOT NULL,
        FOREIGN KEY (time_slot_ID) REFERENCES time_slot (slot_ID),
        FOREIGN KEY (loc_ID) REFERENCES theater (loc_ID),
        FOREIGN KEY (screen_ID) REFERENCES screens (screen_ID)
        )            
    """)
    con.commit()

    cursor.execute("""
        CREATE TABLE training(
        emp_ID varchar(5) PRIMARY KEY,
        con_training boolean,
        tix_training boolean,
        man_training boolean,
        FOREIGN KEY (emp_ID) REFERENCES employees (emp_ID)
        )
    """)
    con.commit()

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