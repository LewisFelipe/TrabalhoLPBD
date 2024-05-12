<?php
//$id = $_POST["id"];
$operation = $_POST["operation"];
$username = $_POST["username"];
$password = hash('sha256', substr($username, 0, 3) . $_POST["password"]);

$link_id = mysqli_connect("localhost", "root", "", "lpbd");
$sql = '';

$return = '';

switch($operation)
{
    case 1:
        $sql = sprintf("SELECT UPDATE_LOGIN('%s', '%s') AS $return", $link_id->real_escape_string($username), $link_id->real_escape_string($password));
        break;
    case 2:
        $sql = sprintf("SELECT INSERT_LOGIN('%s', '%s') AS $return", $link_id->real_escape_string($username), $link_id->real_escape_string($password));
        break;
    default:
        break;
}

$result = mysqli_query($link_id, $sql);

echo $return;

mysqli_close($link_id);
?>