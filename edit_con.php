<?php
// Include database connection file
include_once("config.php");

if(isset($_POST['update']))
{	
	// Retrieve record values
	$con_type = mysqli_real_escape_string($mysqli, $_POST['con_type']);
	$name = mysqli_real_escape_string($mysqli, $_POST['name']);
	$price = mysqli_real_escape_string($mysqli, $_POST['price']);

	$con_typeErr = $priceErr = "";
	
	// Check for empty fields
	if(empty($con_type) || empty($price)) {	
		if(empty($con_type)) {
			$con_typeErr = "* required";
		}
		if(empty($price)) {
			$priceErr = "* required";
		}		
	} else {	
		// Execute UPDATE 
		$stmt = $mysqli->prepare("UPDATE concessions SET con_type=?, price=?,  WHERE name=?");
		$stmt->bind_param("ssds", $con_type, $price, $name);
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
$name = $_GET['name'];

// Get contact by id
$result = mysqli_query($mysqli, "SELECT * FROM concessions WHERE name=$name");

if (!$result) {
    printf("Error: %s\n", mysqli_error($mysqli));
    exit();
}
else {
	while($res = mysqli_fetch_array($result))
	{
		$name = $res['name'];
		$price = $res['price'];
		$con_type = $res['con_type'];
	}
}
?>
<html>
<head>	
	<title>Edit Contact</title>
	<link rel="stylesheet" href="styles.css" />
</head>
<body>
	<form name="form1" method="post" action="edit_con.php?id=<?php echo $name ?>">
		<table>
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
					<input type="text" name="email" value="<?php echo $con_type;?>">
					<span class="error"><?php echo $con_typeErr;?></span>
				</td>
			</tr>
			<tr>
				<td>
					<input class="cancel" type="submit" name="cancel" value="Cancel">
				</td>
				<td>
					<input type="submit" name="update" value="Update">
					<input type="hidden" name="id" value=<?php echo $_GET['name'];?>>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
