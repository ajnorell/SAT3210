<?php
// Include database connection file
include_once("config.php");

$con_typeErr = $priceErr = "";

if(isset($_POST['update']))
{	
	// Retrieve record values
	$con_type = mysqli_real_escape_string($mysqli, $_POST['con_type']);
	$item = mysqli_real_escape_string($mysqli, $_POST['item']);
	$price = mysqli_real_escape_string($mysqli, $_POST['price']);
	$price = (float)$price;
	$item = "\"" . $item . "\"";
	$con_type = "\"" . $con_type . "\"";

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
		$stmt = $mysqli->prepare("UPDATE concessions SET con_type=?, price=? WHERE item=?");
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
<?php
// Retrieve id value from querystring parameter
$item = $_GET['item'];
$item = mysqli_escape_string($mysqli, $item);
$item = "\"" . $item . "\"";

// Get contact by id
$result = mysqli_query($mysqli, "SELECT * FROM concessions WHERE item = $item");
if (!$result) {
    printf("Error: %s\n", mysqli_error($mysqli));
    exit();
}
else {
	while($res = mysqli_fetch_array($result))
	{
		$item = $res['item'];
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
	<form item="form1" method="post" action="edit_con.php?item=<?php echo $item ?>">
		<table>
			<tr> 
				<td>Price</td>
				<td>
					<input type="text" item="price" value="<?php echo $price;?>">
					<span class="error"><?php echo $priceErr;?></span>
				</td>
			</tr>
			<tr> 
				<td>Type</td>
				<td>
					<input type="text" item="con_type" value="<?php echo $con_type;?>">
					<span class="error"><?php echo $con_typeErr;?></span>
				</td>
			</tr>
			<tr>
				<td>
					<input class="cancel" type="submit" item="cancel" value="Cancel">
				</td>
				<td>
					<input type="submit" item="update" value="Update">
					<input type="hidden" item="item" value=<?php echo $_GET['item'];?>>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
