<?php  
$nome = $_POST['nome'];
$email = $_POST['email'];
$endereco= $_POST['endereco'];
$cnpj = $_POST['cnpj'];
$cidade = $_POST['cidade'];
$estado = $_POST['estado'];
$cep = $_POST ['cep'];
$telefone = $_POST ['telefone'];

$conecta = new mysqli("localhost","kinyxapp_app","12345","kinyxapp_wyllian");
if (!$conecta) die ("<h1>Falha na coneco com o Banco de Dados!</h1>");
        
        $sql = "SELECT nome FROM fornecedores WHERE nome = '$nome'";
        $query = mysqli_query ($conecta, $sql);
        $qtde = mysqli_num_rows ($query);
        $dadoscastro = mysqli_fetch_array($query);
        if($dadoscastro == 0){
            $sql2 = "INSERT INTO fornecedores (nome, email, endereco, cnpj, cidade, estado, cep, telefone) VALUES ('$nome', '$email', '$endereco', '$cnpj', '$cidade', '$estado', '$cep', '$telefone')";
            mysqli_query($conecta, $sql2);
            echo "<script>window.location='cadfornecedor.php';alert('Fornecedor $nome cadastrado com sucesso.');</script>";
            }
            else
            {
            echo "<script>window.location='cadfornecedor.php';alert('Fornecedor $nome já existe.');</script>";
            }
      
mysqli_close($conecta);
?>