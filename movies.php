<?php
//SAT 3210
//Course Project Extra Credit
//Movies
//ajnorell, ajurewic, ikgatti
//@mysqli @php

// Include the database connection file
include_once("config.php");
?>
<html>
<head>	
	<title>Select Movies</title>
	<link rel="stylesheet" href="styles.css" />
</head>
<body>
    <table>
        <tr><td>
        <form name="form1" method="post" action="displaymovies.php">
            <label for="location">Choose a location:</label>
                <select name="location" id="location">
                <option value="1">Chicago</option>
                <option value="2">New York</option>
                <option value="3">Minneapolis</option>
                <option value="4">Seattle</option>
                <option value="5">Dallas</option>
                </select>
            <br>
            <label for="date">Date </label>
                <input type="date" name="date" id="date"><br>
                
            <input type="submit" name="canacel" value="Cancel">
            <input type="submit" name="update" value="Search">
            
        </form>
        </td></tr>
    </table>
</body>
<footer>
	<a class="buttoncenter" class="button" href="index.php">Home</a>
</footer>
</html>









