<?php  
session_start();

$nome = $_POST['nome'];
$email = $_POST['email'];
$endereco= $_POST['endereco'];
$cpf = $_POST['cpf'];
$cidade = $_POST['cidade'];
$estado = $_POST['estado'];
$cep = $_POST ['cep'];
$telefone = $_POST ['telefone'];


$conecta = new mysqli("localhost","kinyxapp_app","12345","kinyxapp_wyllian");
if (!$conecta) die ("<h1>Falha na coneco com o Banco de Dados!</h1>");



$sql = "SELECT nome FROM castro WHERE nome = '$nome' ";
$query = mysqli_query ($conecta, $sql);
$qtde = mysqli_num_rows ($query);
$dadoscastro = mysqli_fetch_array($query);
if($dadoscastro == 0){
    $sql2 = "INSERT INTO castro (nome, email, endereco, cpf, cidade, estado, cep, telefone) VALUES ('$nome', '$email', '$endereco', '$cpf', '$cidade', '$estado', '$cep', '$telefone')";
    mysqli_query($conecta, $sql2);
    echo "<script>alert('Cliente $nome cadastrado com sucesso.');window.location='cadcliente.php';</script>";
    }
    else
    {
    echo "<script>alert('Cliente $nome já existe.');window.location='cadcliente.php';</script>";
    }



mysqli_close($conecta);

?>