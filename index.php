<?php

//inclui na página o método de conexão e do arquivo de funções
include_once('conexaoBD.php');
include_once('funcoes.php');

//variável para a consulta no BD com os dados pertinentes
$sql = mysqli_query($conn, 'SELECT c.* FROM (SELECT * FROM tbl_crm_contatos AS a UNION ALL SELECT * FROM tbl_erp_contatos AS b) AS c ORDER BY c.id');
?>
<html>
    <head>
        <title>Sistema ERP/CRM</title>
        <link rel="stylesheet" href="bootstrap/bootstrap.min.css">
    </head>
    <body>
        <h2>Sistema ERP/CRM</h2>
        <table class="table table-responsive-md table-hover">
            <thead>
                <tr>
                    <th>#ID</th>
                    <th>Nome</th>
                    <th>Estado</th>
                    <th>Cidade</th>
                    <th>E-Mail</th>
                    <th>Create Date</th>
                    <th>Status</th>
                    <th>Ação</th>
                </tr>
            </thead>
            <!-- faz um looping na variável criada acima para pegar todos os registros e mostrar na tabela -->
            <?php while ($row = mysqli_fetch_array($sql)) { 
                if (!valida_email($row['email'])) { //se o e-mail não estiver válido, pula o registro
                } else {
                ?>
                <tbody>
                    <tr>
                        <td><?= $row['id']; ?></td>
                        <td><?= $row['nome']; ?></td>
                        <td><?= $row['estado']; ?></td>
                        <td><?= $row['cidade']; ?></td>
                        <td><?= $row['email']; ?></td>
                        <td><?= $row['create_date']; ?></td>
                        <td><?= $row['status'] == 0 ? 'Desativado' : 'Ativo'; ?></td>
                        <?php
                        //se o status for 0 (desativado), mostra uma célula para ativar, caso contrário mostra uma célula para desativar
                        if ($row['status'] == 0) {
                            ?><td><a href="ativar_status.php?id=<?= $row['id'] ?>&nome=<?= $row['nome'] ?>">Ativar</a></td>
                            <?php
                        } else {
                            ?><td><a href = "desativar_status.php?id=<?= $row['id'] ?>&nome=<?= $row['nome'] ?>">Desativar</a></td>
                            <?php
                        }
                        ?>

                    </tr>
                </tbody>
            <?php } } ?>
        </table>
    </body>
</html>
