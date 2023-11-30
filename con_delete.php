
// SAT 3210
// Course Project Extra Credit
// Table Creation Script
// ajnorell, ajurewic, ikgatti
// @mysqli @php

<?php
// Include database connection file
include("config.php");

// Retrieve [id] value from querystring parameter
$item = $_GET['item'];

// Delete row for a specified id
$stmt = $mysqli->prepare("DELETE FROM concessions WHERE item=?");
$stmt->bind_param("s", $item);
$stmt->execute();

// Redirect to home page (index.php)
header("Location:index.php");
?>
