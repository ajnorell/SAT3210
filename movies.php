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
    <a>
    <div style="margin-left:50%">
    <label for="location">Choose a location:</label>
    <select name="location" id="location" form="form1">
    <option value="1">Chicago</option>
    <option value="2">New York</option>
    <option value="3">Minneapolis</option>
    <option value="4">Seattle</option>
    <option value="5">Dallas</option>
    </select>
    <br>
    <br>
    <form name="form1" method="post" action="displaymovies.php">
        <label for="month">Month</label>
        <input type="text" name="month" id="month"><br>
        <label for="day">Day</label>
        <input type="text" name="day" id="day"><br>
        <input type="submit" value="Submit">
    </form>
</div>
</a>
</html>









