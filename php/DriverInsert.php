<?php


$servername = "localhost";
$username = "root";
$password = "NewPassword";
$dbname = "car_race";

// defining variables of Racing Driver

$fullName = $_POST['fullName'];
$Rank = $_POST['Rank'];
$email = $_POST['email'];
$pass = $_POST['pass'];
$phone = $_POST['phone'];


//defining variables of Racing Car

$VIN = $_POST['vin'];
$cartype = $_POST['cartype'];
$color = $_POST['color'];
$carpower = $_POST['carpower'];


// Create connection

$conn = mysqli_connect($servername, $username, $password, $dbname);

// Check connection

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

//writing the sql quereus

$sql = "INSERT INTO Racing_Driver (fullName,rk,email,phone,pass)
VALUES ('$fullName','$Rank','$email','$phone','$pass')";

$sql2 = "INSERT INTO Racing_Car (VIN,cartype,carpower,color)
VALUES ('$VIN','$cartype','$carpower','$color')";


// $RD ="SELECT RD FROM table Racing_Driver";
// $updateName = "UPDATE racing_driver SET fullName = '$fullName'
// WHERE RD=$RD;";




if (mysqli_query($conn, $sql)) {
    echo "New record in Racing Driver table created successfully";
} else {
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}

if (mysqli_query($conn, $sql2)) {
    echo "<br>" . "New record in Racing Car table created successfully";
} else {
    echo "Error: " . $sql2 . "<br>" . mysqli_error($conn);
}

//closing the connection


mysqli_close($conn);
