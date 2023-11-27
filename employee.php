<?php
// Include the database connection file
include_once("config.php");

// Fetch contacts (in descending order)
$result = mysqli_query($mysqli, "SELECT 'emp_ID', 'name', 'role', 'location', FROM employees OUTER JOIN theater USING loc_ID"); 
?><html>
<head>	
	<title>Employee</title>
	<link rel="stylesheet" href="styles.css" />
</head>
<body>
	<table>
		<tr>
			<td>ID</td>
			<td>Name</td>
			<td>Role</td>
            <td>Location</td>
		</tr>
		<?php
		// Print contacts 
		while($res = mysqli_fetch_array($result)) { 		
			echo "<tr>";
			echo "<td>".$res['ID']."</td>";
			echo "<td>".$res['Name']."</td>";
			echo "<td>".$res['Role']."</td>";	
			echo "<td>".$res['Location']."</td>";
			echo "<td><a href=\"edit.php?id=$res[id]\">Edit</a> | <a href=\"delete.php?id=$res[id]\" onClick=\"return confirm('Are you sure you want to delete this contact?')\">Delete</a></td>";		
		}
		?>
	</table>
</body>
</html>