<?php
//$id = $_POST["id"];
// $operation = $_POST["operation"];
$username = $_POST["username"];
$password = hash('sha256', substr($username, 0, 3) . $_POST["password"]);
$nome = $_POST["nome"];
$cpf = $_POST["cpf"];

$link_id = mysqli_connect("localhost", "root", "", "lpbd");
// $sql = '';

// $sql = sprintf("SELECT UPDATE_LOGIN('%s', '%s')", $link_id->real_escape_string($username), $link_id->real_escape_string($password));
$stmt = mysqli_prepare($link_id, sprintf("SELECT INSERT_LOGIN('%s', '%s', '%s', '%s')", $link_id->real_escape_string($username), $link_id->real_escape_string($password), $link_id->real_escape_string($nome), $link_id->real_escape_string($cpf)));

mysqli_stmt_execute($stmt);

$result = mysqli_stmt_get_result($stmt);

mysqli_stmt_close($stmt);
mysqli_close($link_id);

$return = mysqli_fetch_row($result);

echo $return[0];
?>