<?php
// Include database connection file
include_once("config.php");

if(isset($_POST['update']))
{	
	// Retrieve record values
	$emp_ID = mysqli_real_escape_string($mysqli, $_POST['emp_ID']);
	$name = mysqli_real_escape_string($mysqli, $_POST['name']);
	$role = mysqli_real_escape_string($mysqli, $_POST['role']);
	$loc_ID = mysqli_real_escape_string($mysqli, $_POST['loc_ID']);	

	$nameErr = $roleErr = $loc_IDErr ="";
	
	// Check for empty fields
	if(empty($name) || empty($role) || empty($loc_ID)) {	
		if(empty($name)) {
			$nameErr = "* required";
		}
		if(empty($role)) {
			$roleErr = "* required";
		}
		if(empty($loc_ID)) {
			$loc_IDErr = "* required";
		}		
	} else {	
		// Execute UPDATE 
		$stmt = $mysqli->prepare("UPDATE employees SET name=?, role=?, loc_ID=? WHERE emp_id= $emp_ID");
		$stmt->bind_param("sss", $name, $role, $loc_ID);
		$stmt->execute();

		// Redirect to home page (index.php)
		header("Location: index.php");
	}
}
else if (isset($_POST['cancel'])) {
	// Redirect to home page (index.php)
	header("Location: index.php");
}
?>
<?php
// Retrieve id value from querystring parameter
$emp_ID = $_GET['emp_ID'];

// Get contact by id
$result = mysqli_query($mysqli, "SELECT 'name', 'role', 'loc_ID' FROM 'employees' WHERE 'emp_ID'='$emp_ID"); 

if (!$result) {
    printf("Error: %s\n", mysqli_error($mysqli));
    exit();
}
else {
	while($res = mysqli_fetch_array($result))
	{
		$emp_ID = $res["emp_ID"];
		$name = $res['name'];
		$role = $res['role'];
		$loc_ID = $res['loc_ID'];
	}
}
?>
<html>
<head>	
	<title>Edit Employees</title>
	<link rel="stylesheet" href="styles.css" />
</head>
<body>
	<form name="form1" method="post" action="edit_emp.php?emp_ID=<?php echo $emp_ID ?>">
		<table>
			<tr> 
				<td>Name</td>
				<td>
					<input type="text" name="name" value="<?php echo $name;?>">
					<span class="error"><?php echo $nameErr;?></span>
				</td>
			</tr>
			<tr> 
				<td>Role</td>
				<td>
					<input type="text" name="role" value="<?php echo $role;?>">
					<span class="error"><?php echo $roleErr;?></span>
				</td>
			</tr>
			<tr> 
				<td>Location ID</td>
				<td>
					<input type="text" name="loc_ID" value="<?php echo $loc_ID;?>">
					<span class="error"><?php echo $loc_IDErr;?></span>
				</td>
			</tr>
			<tr>
				<td>
					<input class="cancel" type="submit" name="cancel" value="Cancel">
				</td>
				<td>
					<input type="submit" name="update" value="Update">
					<input type="hidden" name="emp_ID" value=<?php echo $_GET['emp_ID'];?>>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
