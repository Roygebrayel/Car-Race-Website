<?php
$servername = "localhost";
$username = "root";
$password = "NewPassword";
$dbname = "carrace";
$fullName = $_POST['fullName'];
$Rank = $_POST['Rank'];
$email = $_POST['email'];


// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);
// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
$sql = "INSERT INTO Racing_driver (fullName,Rank,Email)
VALUES ('$fullName','$lastName',$email)";


if (mysqli_query($conn, $sql)) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}

mysqli_close($conn);
