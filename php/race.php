<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "car_race";

$Name = $_POST['name'];
$Email = $_POST['email'];

$phone = $_POST['phone'];
$address = $_POST['address'];


// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);
// Check connection
if (!$conn) {
die("Connection failed: " . mysqli_connect_error());
}
$sql = "INSERT INTO Registration (RegName,email,PNum)
VALUES ('$Name','$Email','$phone')";

if (mysqli_query($conn, $sql)) {
echo "New record created successfully";
} else {
echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}

mysqli_close($conn);
