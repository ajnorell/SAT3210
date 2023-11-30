<?php
//SAT 3210
//Course Project Extra Credit
//Display Selected Movies
//ajnorell, ajurewic, ikgatti
//@mysqli @php

// Include the database connection file
include_once("config.php")
};
// Fetch contacts (in descending order)
if(isset($_POST['update']))
{	
    $locationErr = $monthErr = $dayErr = "";

	// Retrieve record values
	$location = mysqli_real_escape_string($mysqli, $_POST['location']);
	$month = mysqli_real_escape_string($mysqli, $_POST['month']);
	$day = mysqli_real_escape_string($mysqli, $_POST['day']);

    if(empty($location) || empty($month) || empty($day)) {	
		if(empty($location)) {
			$locationErr = "* required";
		}
		if(empty($month)) {
			$monthErr = "* required";
		}
		if(empty($day)) {
			$dayErr = "* required";
		}		
	} else {	
		// Execute UPDATE 
		$stmt = $mysqli->prepare("SELECT * FROM movies WHERE loc_id=? AND ");
		$stmt->bind_param("ssss", $name, $role, $loc_ID,$emp_ID);
		$stmt->execute();
	}
	
else if (isset($_POST['cancel'])) {
	// Redirect to home page (index.php)
	header("Location: index.php");
}
 
?><html>
<head>	
	<title>Concessions</title>
	<link rel="stylesheet" href="styles.css" />
</head>
<body>
	<table>
		<tr>
			<td>Type</td>
			<td>Item</td>
			<td>Price</td>
			<td><a class="button" href="add_con.php">Add Concesisons</a></td>
		</tr>
		<?php
		// Print contacts 
		while($res = mysqli_fetch_array($result)) { 		
			echo "<tr>";
			echo "<td>".$res['con_type']."</td>";
			echo "<td>".$res['item']."</td>";
			echo "<td>".$res['price']."</td>";	
			echo "<td><a href=\"edit_con.php?item=$res[item]\">Edit</a> | <a href=\"con_delete.php?item=$res[item]\" onClick=\"return confirm('Are you sure you want to delete this contact?')\">Delete</a></td>";		
		}
		?>
	</table>
</body>
<footer>
	<div style = "margin-left: 50%">
	<a class="button" href="index.php">Home</a></div>
</footer>
</html>