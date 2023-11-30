<?php
//SAT 3210
//Course Project Extra Credit
//Add Concessions
//ajnorell, ajurewic, ikgatti
//@mysqli @php

// Include database connection file
include_once("config.php");

$con_type = $price = $item = "";
$con_typeErr = $priceErr = $itemErr = "";

if(isset($_POST['update']))
{	
	// Retrieve record values
	$con_type = mysqli_real_escape_string($mysqli, $_POST['con_type']);
	$item = mysqli_real_escape_string($mysqli, $_POST['item']);
	$price = mysqli_real_escape_string($mysqli, $_POST['price']);

	$con_typeErr = $priceErr = $itemErr = "";
	
	// Check for empty fields
	if(empty($con_type) || empty($price) || empty($item)) {	
		if(empty($con_type)) {
			$con_typeErr = "* required";
		}
		if(empty($price)) {
			$priceErr = "* required";
		}		
		if(empty($item)) {
			$itemErr = "* required";
		}
	} else {	
		// Execute add 
		$stmt = $mysqli->prepare("INSERT INTO concessions (con_type, price, item) VALUES (?,?,?)");
		$stmt->bind_param("sds", $con_type, $price, $item);
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
<html>
<head>	
	<title>Add Concessions</title>
	<link rel="stylesheet" href="styles.css" />
</head>
<body>
	<form item="form1" method="post" action="add_con.php">
		<table>
			<tr> 
				<td>Item</td>
				<td>
					<input type="text" name="item" value="<?php echo $item;?>">
					<span class="error"><?php echo $itemErr;?></span>
				</td>
			</tr>
			<tr> 
				<td>Price</td>
				<td>
					<input type="text" name="price" value="<?php echo $price;?>">
					<span class="error"><?php echo $priceErr;?></span>
				</td>
			</tr>
			<tr> 
				<td>Type</td>
				<td>
					<input type="text" name="con_type" value="<?php echo $con_type;?>">
					<span class="error"><?php echo $con_typeErr;?></span>
				</td>
			</tr>
			<tr>
				<td>
					<input class="cancel" type="submit" item="cancel" value="Cancel">
				</td>
				<td>
					<input type="submit" name="update" value="Add">
				</td>
			</tr>
		</table>
	</form>
</body>
<footer>
	<a class="buttoncenter" class="button" href="index.php">Home</a>
</footer>
</html>
