<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "test";
$Race_id = $_POST['Race_id'];
$Name = $_POST['Name'];
$Email = $_POST['Email'];



// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);
// Check connection
if (!$conn) {
die("Connection failed: " . mysqli_connect_error());
}
$sql = "INSERT INTO Registration (R,RegName,email)
VALUES ('$Race_id','$Name','$Email')";

if (mysqli_query($conn, $sql)) {
echo "New record created successfully";
} else {
echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}

// if (mysqli_query($conn, $sql1)) {
//     echo "New record created successfully";
//     } else {
//     echo "Error: " . $sql1 . "<br>" . mysqli_error($conn);
//     }

mysqli_close($conn);
