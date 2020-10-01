<?php
include('conexao.php');


?>
<head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <link href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css" rel="stylesheet" />
        <script src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Pesquisa De Fornecedores</title>

</head> 



<?php
$sql = "SELECT *  FROM fornecedores";
$query = mysqli_query($conexao, $sql);
$qtde = mysqli_num_rows($query);
?>


<nav class="navbar navbar-dark bg-dark justify-content-center">
<div class="topodapagina">

    <a href="painel.php" class="btn btn-secondary">Voltar a Pagina Principal </a>
    <a href="pesquisaclientes.php" class="btn btn-secondary">Pesquisa de Clientes</a>
    <a href="pesquisafornecedores.php" class="btn btn-secondary">Pesquisa de Fornecedores</a>
    <a href="pesquisaprodutos.php" class="btn btn-secondary">Pesquisa de Produtos</a>


</div>
</nav>

<nav class="navbar navbar-dark justify-content-center">
<div class="dropdown">
    <h2>Pesquisa De Fornecedores</h2>
</div>
 
</nav>
<table id="example" class="display" style="width:100%">
        <thead>
            <tr>
                <th>ID</th> 
                <th>Nome</th> 
                <th>Email</th>
                <th>Endereço</th>
                <th>Cnpj</th>
                <th>Cidade</th>
                <th>Estado</th>
                <th>Telefone</th>
                <th>Cep</th>

            </tr>
        </thead>
        <tbody>
        
   
            <?php
             while($linha = mysqli_fetch_array($query))
             {
               echo '<tr>';
               echo '<td>' .$linha['codigo'] . '</td>';
               echo '<td>' .$linha['nome'] . '</td>';
               echo '<td>'.$linha['email'] . '</td>' ;
               echo '<td>'.$linha['endereco'] . '</td>';
               echo '<td> '.$linha['cnpj'] . '</td>';
               echo '<td> '.$linha['cidade'] . '</td>';
               echo '<td> '.$linha['estado'] . '</td>';
               echo '<td> '.$linha['telefone'] . '</td>';
               echo '<td> '.$linha['cep'] . '</td> 
               </tr>';
             }
            ?>
            
        </tfoot>
    </table>
           



    
    <script type="text/javascript"> $(document).ready(function() {
        $('#example').DataTable();
    } );</script>