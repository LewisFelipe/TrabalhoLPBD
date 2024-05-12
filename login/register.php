<?php
//$id = $_POST["id"];
$operation = $_POST["operation"];
$username = $_POST["username"];
$password = hash('sha256', substr($username, 0, 3) . $_POST["password"]);

$link_id = mysqli_connect("localhost", "root", "", "lpbd");
/* $sql = ''; */

$stmt = '';
$return = '';

switch($operation)
{
    case 1:
        // $sql = sprintf("SELECT UPDATE_LOGIN('%s', '%s')", $link_id->real_escape_string($username), $link_id->real_escape_string($password));
        $stmt = mysqli_prepare($conn, sprintf("CALL VALIDATE_LOGIN('%s', '%s')", $link_id->real_escape_string($username), $link_id->real_escape_string($password)));
        break;
    case 2:
        // $sql = sprintf("SELECT UPDATE_LOGIN('%s', '%s')", $link_id->real_escape_string($username), $link_id->real_escape_string($password));
        $stmt = mysqli_prepare($conn, sprintf("CALL UPDATE_LOGIN('%s', '%s')", $link_id->real_escape_string($username), $link_id->real_escape_string($password)));
        break;
    default:
        break;
}

mysqli_stmt_execute($stmt);

$result = mysqli_stmt_get_result($stmt);

mysqli_stmt_close($stmt);
mysqli_close($conn);

$return = mysqli_fetch_row($result);

echo $return[0];

/* $result = mysqli_query($link_id, $sql);

echo $return;

mysqli_close($link_id); */
?>