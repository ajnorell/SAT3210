<?php
//SAT 3210
//Course Project Extra Credit
//Database Conncetion 
//ajnorell, ajurewic, ikgatti
//@mysqli @php

// Basic connection settings
$databaseHost = '127.0.0.1';
$databaseUsername = 'root';
$databasePassword = 'P@ssw0rd';
$databaseName = 'movies';

// Connect to the database
$mysqli = mysqli_connect($databaseHost, $databaseUsername, $databasePassword, $databaseName); 
?>
