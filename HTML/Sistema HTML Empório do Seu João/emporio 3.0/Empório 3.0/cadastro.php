<?php  
session_start();

$nome = $_POST['nome'];
$email = $_POST['email'];
$endereco= $_POST['endereco'];
$cnpj = $_POST['cnpj'];
$cidade = $_POST['cidade'];
$estado = $_POST['estado'];
$cep = $_POST ['cep'];

//die (var_dump($usuario));

$conecta = new mysqli("localhost","kinyxapp_app","12345","kinyxapp_wyllian");
// Caso a conexão seja reprovada, exibe na tela uma mensagem de erro
if (!$conecta) die ("<h1>Falha na coneco com o Banco de Dados!</h1>");
// Caso a conexão seja aprovada, então conecta o Banco de Dados.    
//$db = mysql_select_db($conecta, "wyllian");
//$cria = "CREATE TABLE usuarios (codigo INT AUTO_INCREMENT PRIMARY KEY, usuario VARCHAR(40), senha VARCHAR(50))";
//mysqli_query($conecta, $cria);
$sql = "INSERT INTO castro (nome, email, endereco, cnpj, cidade, estado, cep) VALUES ('$nome', '$email', '$endereco', '$cnpj', '$cidade', '$estado', '$cep')";
mysqli_query($conecta, $sql);
if ($result = $conecta->query("SELECT DATABASE()")) {
    $row = $result->fetch_row();
    printf("Default database is %s.\n", $row[0]);
    $result->close();
}
//$conecta->select_db("kinyxapp_wyllian");
$sql = "SELECT nome FROM castro WHERE nome = '$nome' ";
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
      echo $linha['nome'] . '<br>'; 
        




mysqli_close($conecta);

/* ESTE AQUI É O MD5
<?php
if(isset($_POST["txtValor"])){
$string = $_POST["txtValor"];
echo md5($string);
}
?>
*/
/*
//conexão com o servidor
$conecta = new mysqli("localhost","kinyxapp_app","12345","kinyxapp_wyllian");
// Caso a conexão seja reprovada, exibe na tela uma mensagem de erro
if (!$conecta) die ("<h1>Falha na coneco com o Banco de Dados!</h1>");
// Caso a conexão seja aprovada, então conecta o Banco de Dados.    
$db = mysql_select_db($conecta, "wyllian");
$sql = "SELECT usuario , senha FROM usuarios" ;
$query = mysqli_query ($conexao, $sql);
$array = mysqli_fetch_array($query);


if($usuario == "" || $usuario == null){
    echo'Preencha o login';
}



mysqli_close($conect);
*/
?>