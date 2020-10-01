<?php  
$usuario = $_POST['usuario'];
$senha = md5($_POST['senha']);


$conecta = new mysqli("localhost","kinyxapp_app","12345","kinyxapp_wyllian");
if (!$conecta) die ("<h1>Falha na coneco com o Banco de Dados!</h1>");




$sql = "SELECT usuario, senha FROM usuario WHERE usuario = '$usuario'";

$query = mysqli_query($conecta, $sql);
// Armazena na variavel $qtde a quantidade de registros encontrados no comando SQL executado e armazenado na variavel $query
$qtde = mysqli_num_rows($query);
// Carrega os dados do registro encontrado (armazenado na variável $query) em forma de array
$dadosLogin = mysqli_fetch_array($query);
// Condição para verificar se a variável $dadosLogin está nulo
    if($dadosLogin == NULL)
    {
        $sql = "INSERT INTO usuario (usuario, senha) VALUES ('$usuario', '$senha')";
        mysqli_query($conecta, $sql);
        echo "<script>alert('O usuario $usuario foi registrado com sucesso.');window.location='cadsuario.php';</script>";

    }
    else
    {
        echo "<script>alert('O usuario $usuario já existe.'); window.location='cadusuario.php';</script>";
    }



        




mysqli_close($conecta);


?>