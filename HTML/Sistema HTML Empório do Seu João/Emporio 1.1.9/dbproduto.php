<?php  
session_start();

$descricao = $_POST['nome'];
$idfornecedor = $_POST['idfornecedor'];
$emaximo = $_POST['emaximo'];
 

//die (var_dump($usuario));

$conecta = new mysqli("localhost","kinyxapp_app","12345","kinyxapp_wyllian");
// Caso a conexão seja reprovada, exibe na tela uma mensagem de erro
if (!$conecta) die ("<h1>Falha na coneco com o Banco de Dados!</h1>");
// Caso a conexão seja aprovada, então conecta o Banco de Dados.    
//$db = mysql_select_db($conecta, "wyllian");
//$cria = "CREATE TABLE usuarios (codigo INT AUTO_INCREMENT PRIMARY KEY, usuario VARCHAR(40), senha VARCHAR(50))";
//mysqli_query($conecta, $cria);


//$conecta->select_db("kinyxapp_wyllian");
$sql = "SELECT descricao FROM produto WHERE descricao = '$descricao'";
// Executa o comando SQL contido na variavel $sql
$query = mysqli_query ($conecta, $sql);
// Armazena na variavel $qtde a quantidade de registros encontrados no comando SQL executado e armazenado na variavel $query
$qtde = mysqli_num_rows ($query);
// Carrega os dados do registro encontrado (armazenado na variável $query) em forma de array
$dadoscastro = mysqli_fetch_array($query);
// Condição para verificar se a variável $dadosLogin está nulo
if($dadoscastro == 0){
    $sql2 = "INSERT INTO produto (descricao, idfornecedor) VALUES ('$descricao', '$idfornecedor')";
    mysqli_query($conecta, $sql2);
    echo "<script>alert('Produto $descricao cadastrado com sucesso.');window.location='cadproduto.php';</script>";
    }
    else
    {
    echo "<script>alert('Produto $descricao já existe.');window.location='cadproduto.php';</script>";
    }


mysqli_close($conecta);

?>