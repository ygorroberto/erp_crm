<?php

//inclui na página o método de conexão
include_once('conexaoBD.php');

//inclui na página o método de conexão
$id = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);
$nome = filter_input(INPUT_GET, 'nome', FILTER_SANITIZE_STRING);

//efetivação da conexão e da chamada da procedure para desativar um registro, quando ativado
$sql = mysqli_query($conn, 'CALL desativar_status("' . $id . '", "' . $nome . '") ');

//direciona o usuário para a página index (principal)
header('Location: index.php');
