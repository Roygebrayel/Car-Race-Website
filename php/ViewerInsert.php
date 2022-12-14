<?php
$servername = "localhost";
$username = "root";
$password = "NewPassword";
$dbname = "car_race";

// defining variables of registration



$Name = $_POST['name'];
$Email = $_POST['email'];
$Phone = $_POST['phone'];
$Address = $_POST['address'];


// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);
// Check connection
if (!$conn) {
die("Connection failed: " . mysqli_connect_error());
}
$sql = "INSERT INTO Registration (RegName,email,PNum,Reg_Address)
VALUES ('$Name','$Email','$Phone','$Address')";


if (mysqli_query($conn, $sql)) {
echo "New record created successfully";
} else {
echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}

mysqli_close($conn);
