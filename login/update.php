<?php
$username = $_POST["username"];
$password = hash('sha256', substr($username, 0, 3) . $_POST["password"]);

$link_id = mysqli_connect("localhost", "root", "", "lpbd");

// $sql = sprintf("SELECT UPDATE_LOGIN('%s', '%s')", $link_id->real_escape_string($username), $link_id->real_escape_string($password));
$stmt = mysqli_prepare($link_id, sprintf("SELECT UPDATE_LOGIN('%s', '%s')", $link_id->real_escape_string($username), $link_id->real_escape_string($password)));

mysqli_stmt_execute($stmt);

$result = mysqli_stmt_get_result($stmt);

mysqli_stmt_close($stmt);
mysqli_close($link_id);

$return = mysqli_fetch_row($result);

echo $return[0];
?>