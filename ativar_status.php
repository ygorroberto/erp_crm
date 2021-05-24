<?php

//inclui na página o método de conexão
include_once('conexaoBD.php');

//busca das variáveis através do método GET da página index.php, tag <a href>
$id = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);
$nome = filter_input(INPUT_GET, 'nome', FILTER_SANITIZE_STRING);

//efetivação da conexão e da chamada da procedure para ativar um registro, quando desativado
$sql = mysqli_query($conn, 'CALL ativar_status("' . $id . '", "' . $nome . '") ');

//direciona o usuário para a página index (principal)
header('Location: index.php');
