<?php
$username = $_POST["username"];

$link_id = mysqli_connect("localhost", "root", "", "lpbd");

$sql = sprintf("SELECT users.cpf, pontos.dataHora
        FROM users LEFT JOIN pontos ON users.id = pontos.id_user WHERE users.username = '%s';", $link_id->real_escape_string($username));

$result = mysqli_query($link_id, $sql);
mysqli_close($link_id);

/**
 * @TODO: lista csv entregando apenas esses valores
 */

echo $result;
?>