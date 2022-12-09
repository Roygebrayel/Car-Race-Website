<?php

// Create connection

$conn = mysqli_connect($servername, $username, $password, $dbname);

// Check connection

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

//writing the sql quereus


$RD = "SELECT RD FROM table Racing_Driver";
$updateName = "UPDATE racing_driver SET fullName = '$fullName'
WHERE RD=$RD;";

//check quereus


if (mysqli_query($conn, $sql)) {
    echo "Record deleted successfully";
} else {
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}


//closing the connection


mysqli_close($conn);
