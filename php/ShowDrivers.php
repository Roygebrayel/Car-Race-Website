<?php

$servername = "localhost";
$username = "root";
$password = "NewPassword";
$dbname = "carrace";

// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);
// Check connection
if (!$conn) {
die("Connection failed: " . mysqli_connect_error());
}

$sql = "SELECT * FROM racing_driver";




$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
// output data of each row
while($row = mysqli_fetch_assoc($result)) {
echo "id : " . $row["RD"] . " - Name : " . $row["fullName"] . "-   Rank :  " . $row["rk"] . "-  Email :  " .  $row["email"] . "-  phone :  " .  $row["phone"]. "-  password :  " . $row["pass"]. "<br>" ."<br>";
}
} else {
echo "0 results";
}

mysqli_close($conn);