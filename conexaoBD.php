<?php

//cria a variável de conexão
$conn = mysqli_connect('localhost', 'root', '', 'erp_crm');

//verifica se a conexão foi realizada com sucesso
if (!$conn) {
    echo 'Conexão não está funcionando';
    return false;
} else {
    return true;
}

