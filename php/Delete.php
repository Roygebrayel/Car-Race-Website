<?php

// php in the mysqli Object - oriented

$servername = "localhost";
$username = "root";
$password = "NewPassword";
$dbname = "car_race";

$email = $_POST['email'];
$pass = $_POST['pass'];

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// sql to delete a record
$sql =" DELETE FROM Racing_Driver where email = '$email' AND pass = '$pass'";

if ($conn->query($sql) === TRUE) {
    echo "Record deleted successfully";
} else {
    echo "Error deleting record: " . $conn->error;
}

$conn->close();
