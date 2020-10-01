<?php 
session_start();

$idproduto = $_POST['idproduto'];
$quantidade = $_POST['quantidade'];
$vunitario = $_POST['vunitario'];
$data = $_POST['data'];
$vunitario *= -1;
//die (var_dump($vunitario));
$conecta = new mysqli("localhost","kinyxapp_app","12345","kinyxapp_wyllian");
if (!$conecta) die ("<h1>Falha na coneco com o Banco de Dados!</h1>");
$sql2 = "SELECT id FROM produto WHERE id = '$idproduto' ";
$query2 = mysqli_query ($conecta, $sql2);
$qtde2 = mysqli_num_rows ($query2);
$dadoscastro = mysqli_fetch_array($query2);
if($dadoscastro == NULL)
echo 'ID do produto não existe';
else {
$sql = "INSERT INTO estoque (id_produto, qtde, valor_unitario, dataentrada) VALUES ('$idproduto', '$quantidade', '$vunitario', '$data')";
mysqli_query($conecta, $sql);
$sql3 = "UPDATE produto SET saldo = saldo - $quantidade;";
mysqli_query($conecta, $sql3);
echo "<script>window.location='index.html';alert('foi retirado $quantidade unidades do produto $idproduto.');</script>";
};
/*
//----------------------------------------------------------------
$sql = "UPDATE INTO estoque (id_produto, qtde, valor_unitario) VALUES ('$id_produto', '$eminimo', '$emaximo')";
mysqli_query($conecta, $sql);
if ($result = $conecta->query("SELECT DATABASE()")) {
    $row = $result->fetch_row();
    printf("Default database is %s.\n", $row[0]);
    $result->close();
}
//$conecta->select_db("kinyxapp_wyllian");
$sql = "SELECT descricao FROM produto WHERE descricao = '$descricao' ";
// Executa o comando SQL contido na variavel $sql
$query = mysqli_query ($conecta, $sql);
// Armazena na variavel $qtde a quantidade de registros encontrados no comando SQL executado e armazenado na variavel $query
$qtde = mysqli_num_rows ($query);
// Carrega os dados do registro encontrado (armazenado na variável $query) em forma de array
$dadoscastro = mysqli_fetch_array($query);
// Condição para verificar se a variável $dadosLogin está nulo
    if($dadoscastro == NULL)
        echo 'Não existe';
    else
        echo 'Existe!';
    // Irá percorrer as linhas encontradas (armazenado na variável $query) do banco de dados
    while($linha = mysqli_fetch_array($query))
      echo $linha['descricao'] . '<br>'; 
        

*/
mysqli_close($conecta);

?>