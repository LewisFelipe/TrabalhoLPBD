<?php
$username = $_POST["username"];
$cid = $_POST["cid"];
$data = $_POST["data"];
$dias = $_POST["dias"];
$crm = $_POST["crm"];
$nomeMedico = $_POST["nomeMedico"];
$obs = $_POST["obs"];

date_default_timezone_set('America/Sao_Paulo');
$dataHora = date('d-m-Y H:i');

$link_id = mysqli_connect("localhost", "root", "", "lpbd");
$return = '';

/**
 * @TODO: Corrigir o erro das datas poderem ser vazias
 * */

$stmt = mysqli_prepare($link_id, sprintf("SELECT INSERT_ATESTADO('%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s');",
                        $link_id->real_escape_string($username), $link_id->real_escape_string($cid),
                        $link_id->real_escape_string($data), $link_id->real_escape_string($dias),
                        $link_id->real_escape_string($crm), $link_id->real_escape_string($nomeMedico),
                        $link_id->real_escape_string($obs), $link_id->real_escape_string($dataHora)));
mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);
mysqli_stmt_close($stmt);
mysqli_close($link_id);
$return = mysqli_fetch_row($result);

echo $return[0];
?>