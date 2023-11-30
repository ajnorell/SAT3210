SAT 3210
Course Project Extra Credit
Delete Employees
ajnorell, ajurewic, ikgatti
@mysqli @php

<?php
// Include database connection file
include("config.php");

// Retrieve [id] value from querystring parameter
$emp_ID = $_GET['emp_ID'];

// Delete row for a specified id
$stmt = $mysqli->prepare("DELETE FROM employees WHERE emp_ID=?");
$stmt->bind_param("s", $emp_ID);
$stmt->execute();

// Redirect to home page (index.php)
header("Location:index.php");
?>
