<?php
$servername = "db";
$username = "user";
$password = "admin";
$dbname = "bd1";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}
?>
