Our Website and databsae is on the VM titled "SAT3210 Course Project 2" IP address:192.168.4.224
Username SAT3210; Password "P@ssw0rd"

The website is hosted via php development server on port 5000 (localhost:5000)
If the website cant be accessed you can run the command "new" to reload the website files and start the web server
The command to start the server without reloading is "php -S localhost:5000" from inside the ~/SAT3210 Folder

All the files are contained in the SAT3210 folder under /home/sat3210/SAT3210

if you need to refresh the database with new data you can run the createandload.py script which will drop the database, and recreate with the data from the .csv s
the create.py will only work if the database does not exist
the load_data.py script will only work if the database and schema exist but there is no existing data in the database.

app.py is our application for the actual project and has no bearing on the website

If the VM crashes, it has a habit of doing so. Turn the VM off, turn it back on and restore to the snapshot titled Submission. The database will be in a fresh state with the website loaded and pulled up.

The final video is call FINAL.mkv

The report is called Report.pdf

The slides are called Slides.pdf

See above for info about create & load scripts as well as the application.

The database backup is called backup.sql and can be restored using "mariadb -u root -p movies < backup.sql" and supplying the password "P@ssw0rd" when prompted