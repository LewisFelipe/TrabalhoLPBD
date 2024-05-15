<?php
$username = $_POST["username"];
//$dataHora = $_POST["dataHora"];
date_default_timezone_set('America/Sao_Paulo');
$dataHora = date('d-m-Y H:i');

$link_id = mysqli_connect("localhost", "root", "", "lpbd");

$return = '';


$stmt = mysqli_prepare($link_id, sprintf("SELECT INSERT_PONTO('%s', '%s');", $link_id->real_escape_string($username), $link_id->real_escape_string($dataHora)));
mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);
mysqli_stmt_close($stmt);
mysqli_close($link_id);
$return = mysqli_fetch_row($result);

echo $return[0];
?>