#imports
import mariadb
import sys
from prettytable import PrettyTable
try:
    #build connection parameters 
    con = mariadb.connect(
    user="",
    password="",
    host="localhost",
    port=3306,
    database="school",
    )

    #estalbish connect to database by using connection parameter
    cursor = con.cursor()
    print("This program will allow for 3 different options, input the number which you would like to execute.")
    print("1 will find the number of stuendets with duplications, 2 will find duplicated students wiht in a department, 3 will find the gpa of students and ask if you will like to remove them.")
    #ask for user input for menu
    menu_num = input("Input a number 1-3 for the option you like to preform: ")

    if menu_num == "1":
        dup_num = input("Enter a number to see if there are student duplicates:")
        cursor.execute("SELECT name,ID FROM student GROUP BY name HAVING COUNT(ID)=?", (dup_num,))
        if cursor.rowcount == 0:
            print("No results from query")
        else:
            rows = cursor.fetchall()
            table = PrettyTable(["name","ID"])
            for i in rows:
                table.add_row(i)
            print(table)
    elif menu_num == "2":
        dept = input("Enter a department name: ")
        num = input("Enter a number to  see duplicateds: ")
        cursor.execute("SELECT ID, name, dept_name FROM student WHERE dept_name=? GROUP BY name HAVING COUNT(ID)=?", (dept,num,))
        if cursor.rowcount == 0:
            print("No results from QUERY")
        else:
            rows = cursor.fetchall()
            table = PrettyTable(["ID","Name","Department"])
            for i in rows:
                table.add_row(i)
            print(table)
    elif menu_num == "3":
        name = input("enter the name of the student: ")
        dept = input("enter the department of the student: ")
        cursor.execute("SELECT ID,name,dept_name,GPA FROM (SELECT student.ID,name,dept_name, SUM(CASE WHEN grade='A+' THEN 4.0 WHEN grade='A' THEN 4.0 WHEN grade='A-' THEN 3.7 WHEN grade='B+' THEN 3.3 WHEN grade='B' THEN 3.0 WHEN grade='B-' THEN 2.7 WHEN grade='C+' THEN 2.3 WHEN grade='C' THEN 2.0 WHEN grade='C-' THEN 1.7 WHEN grade='D+' THEN 1.3 WHEN grade='D' THEN 1.0 WHEN grade='F' THEN 0 ELSE 0 END)/COUNT(course_id) AS GPA FROM takes NATURAL JOIN student GROUP BY takes.ID ORDER BY GPA)AS t WHERE name = ? AND dept_name = ?",(name,dept,))
        if cursor.rowcount == 0:
            print("No results from QUERY")
        else:
            rows = cursor.fetchall()
            table = PrettyTable(["ID","Name","Department","GPA"])
            for i in rows:
                table.add_row(i)
            print(table)
        continue_del = input("Should student be deleted (type y for yes): ")
        if continue_del == 'y':
            
            continue_del = input("Should " +i[1]+"(ID = "+i[0]+") be deleted (type y for yes): ")
            cursor.execute("DELETE from student WHERE ID = ?", (i[0],))
            con.commit()
            print(table)
    
    cursor.close()
except mariadb.Error as e:
    print(f"Error from mariaDB: {e}")
    sys.exit(1)
