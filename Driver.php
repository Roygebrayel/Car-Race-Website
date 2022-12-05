<?php
// defining variables of Racing Driver
$servername = "localhost";
$username = "root";
$password = "NewPassword";
$dbname = "carrace";
$fullName = $_POST['fullName'];
$Rank = $_POST['Rank'];
$email = $_POST['email'];
$pass = $_POST['pass'];
$phone = $_POST['phone'];

//defining variables of Racing Car

$VIN = $_POST['vin'];
$cartype = $_POST['cartype'];
$color = $_POST['color'];
$power = $_power['power'];


// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);
// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
$sql = "INSERT INTO Racing_Driver (fullName,rk,email,phone,pass)
VALUES ('$fullName','$Rank','$email','$phone','$pass')";

$sql2 = "INSERT INTO Racing_Car (fullName,rk,email,phone,pass)
VALUES ('$VIN','$cartype','$power','$color')";


if (mysqli_query($conn, $sql,$sql2)) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}

mysqli_close($conn);
