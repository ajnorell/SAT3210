<?php
//SAT 3210
//Course Project Extra Credit
//Add Employees
//ajnorell, ajurewic, ikgatti
//@mysqli @php
// Include database connection file
include_once("config.php");

$nameErr = $roleErr = $loc_IDErr = $emp_IDErr = "";

if(isset($_POST['update']))
{	
	// Retrieve record values
	$emp_ID = mysqli_real_escape_string($mysqli, $_POST['emp_ID']);
	$name = mysqli_real_escape_string($mysqli, $_POST['name']);
	$role = mysqli_real_escape_string($mysqli, $_POST['role']);
	$loc_ID = mysqli_real_escape_string($mysqli, $_POST['loc_ID']);	

	$nameErr = $roleErr = $loc_IDErr = $emp_IDErr = "";
	
	// Check for empty fields
	if(empty($name) || empty($role) || empty($loc_ID) || empty($emp_ID)) {	
		if(empty($name)) {
			$nameErr = "* required";
		}
		if(empty($role)) {
			$roleErr = "* required";
		}
		if(empty($loc_ID)) {
			$loc_IDErr = "* required";
		if(empty($emp_ID)) {
			$emp_IDErr = "* required";
		}		
	} else {	
		// Execute add 
		$stmt = $mysqli->prepare("INSERT INTO employees (emp_ID, loc_ID, role, name) VALUES (?,?,?,?)");
		$stmt->bind_param("ssss", $name, $role, $loc_ID,$emp_ID);
		$stmt->execute();

		// Redirect to home page (index.php)
		header("Location: index.php");
	}
}
else if (isset($_POST['cancel'])) {
	// Redirect to home page (index.php)
	header("Location: index.php");
}
}
?>
<html>
<head>	
	<title>Add Employees</title>
	<link rel="stylesheet" href="styles.css" />
</head>
<body>
	<form name="form1" method="post" action="add_emp.php?">
		<table>
			<tr> 
				<td>Employee ID</td>
				<td>
					<input type="text" name="emp_ID" value="<?php echo $emp_ID;?>">
					<span class="error"><?php echo $emp_IDErr;?></span>
				</td>
			</tr>
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
					<input type="submit" name="Add" value="update">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>