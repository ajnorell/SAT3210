<?php
// Include the database connection file
include_once("config.php");

// Fetch contacts (in descending order)
$result = mysqli_query($mysqli, "SELECT emp_ID, name, role, loc_ID, location FROM employees NATURAL JOIN theater ORDER BY emp_ID"); 
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
			<td>Location ID</td>
            <td>Location</td>
		</tr>
		<?php
		// Print employees
		while($res = mysqli_fetch_array($result)) { 		
			echo "<tr>";
			echo "<td>".$res['emp_ID']."</td>";
			echo "<td>".$res['name']."</td>";
			echo "<td>".$res['role']."</td>";	
			echo "<td>".$res['loc_ID']."</td>";
			echo "<td>".$res["location"]."</td>";
			echo "<td><a href=\"edit_emp.php?emp_ID=$res[emp_ID]\">Edit</a> | <a href=\"delete.php?emp_ID=$res[emp_ID]\" onClick=\"return confirm('Are you sure you want to delete this contact?')\">Delete</a></td>";		
		}
		?>
	</table>
</body>
</html>