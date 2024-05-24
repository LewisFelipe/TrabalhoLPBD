<?php
$username = $_POST["username"];

$link_id = mysqli_connect("localhost", "root", "", "lpbd");

$sql = sprintf("SELECT users.nome, users.cpf, atestados.qtd_dias, atestados.data, atestados.data_envio, atestados.crm, atestados.nome_medico, atestados.obs
        FROM users LEFT JOIN atestados ON users.id = atestados.id_user WHERE users.username = '%s';", $link_id->real_escape_string($username));

$result = mysqli_query($link_id, $sql);
mysqli_close($link_id);

/**
 * @TODO: lista csv entregando apenas esses valores
 */

echo $result;
?>