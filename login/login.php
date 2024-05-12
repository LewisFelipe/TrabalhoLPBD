<?php
$username = $_POST["username"];
$password = hash('sha256', substr($username, 0, 3) . $_POST["username"]);

$con = mysqli_connect("localhost", "root", "", "lpbd");

$return = '';

$sql = sprintf("SELECT VALIDATE_LOGIN('%s', '%s') AS $return", $link_id->real_escape_string($username), $link_id->real_escape_string($password));
$result = mysqli_query($con,$sql);

echo $return;

echo $csv;
?>