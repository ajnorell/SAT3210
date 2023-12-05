<?php
//SAT 3210
//Course Project Extra Credit
//Display Selected Movies
//ajnorell, ajurewic, ikgatti
//@mysqli @php

// Include the database connection file
include_once("config.php");
// Fetch contacts (in descending order)
if(isset($_POST['update']))
{	
    $locationErr = $dateErr ="";

	// Retrieve record values
	$location = mysqli_real_escape_string($mysqli, $_POST['location']);
	$date = mysqli_real_escape_string($mysqli, $_POST['date']);

    if(empty($location) || empty($date)){	
		if(empty($location)) {
			$locationErr = "* required";
		}
		if(empty($date)) {
			$dateErr = "* required";
		}	
	} else {	
		// Execute select 
		$result = mysqli_query($mysqli, "SELECT movies.title, time_slot.day, time_slot.start_hr, time_slot.start_min, screens.screen_num, screens.seat_type, screens.screen_type, screens.capacity FROM time_slot INNER JOIN movies ON time_slot.slot_ID = movies.time_slot_ID INNER JOIN screens ON movies.screen_ID = screens.screen_ID WHERE $date BETWEEN movies.start_date AND movies.end_date AND movies.loc_ID = $location");
	}}

else if (isset($_POST['cancel'])) {
	// Redirect to home page (index.php)
	header("Location: index.php");
} ?>

<html>
<head>	
	<title>Movies</title>
	<link rel="stylesheet" href="styles.css" />
</head>
<body>
	<table>
		<tr>
			<td>Title</td>
			<td>Day</td>
			<td>Start Hr</td>
			<td>Start Min</td>
			<td>Screen Number</td>
			<td>Screen Type</td>
			<td>Seat Type</td>
			<td>Capactiy</td>
		</tr>
		<?php
		// Print contacts 
		while($res = mysqli_fetch_array($result)) { 		
			echo "<tr>";
			echo "<td>".$res['title']."</td>";
			echo "<td>".$res["day"]."</td>";
			echo "<td>".$res['start_hr']."</td>";
			echo "<td>".$res['start_min']."</td>";
			echo "<td>".$res['screen_num']."</td>";
			echo "<td>".$res['screen_type']."</td>";	
			echo "<td>".$res['seat_type']."</td>";	
			echo "<td>".$res['capacity']."</td>";	
		}
		?>
	</table>
</body>
<footer>
	<a class="buttoncenter" class="button" href="index.php">Home</a>
</footer>
</html>