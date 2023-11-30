<?php
//SAT 3210
//Course Project Extra Credit
//Display Selected Movies
//ajnorell, ajurewic, ikgatti
//@mysqli @php

// Include the database connection file
include_once("config.php");
?>

<?php
// Fetch contacts (in descending order)
$result = mysqli_query($mysqli, "SELECT * FROM movies ORDER BY "); 
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