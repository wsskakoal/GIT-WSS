<html lang="br">
    <head>
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.js"></script>
    <link rel="stylesheet" type="text/css" href="login.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>Registro de produtos</title>
    <meta charset="utf-8">
    </head>
  <?php
$conecta = new mysqli("localhost","kinyxapp_app","12345","kinyxapp_wyllian");
if (!$conecta) die ("<h1>Falha na coneco com o Banco de Dados!</h1>");
$sql = "SELECT nome  FROM produtos";
$query = mysqli_query($conecta, $sql);
$qtde = mysqli_num_rows($query);
?>
<body>
    <div class="principal">
        <form>
            <h1 class="border"> Registro de produtos </h1>
            <div class="form-row">
              <div class="form-group col-md-6">
                <label for="inputEmail4">Nome do produto</label>
                <select class="custom-select" id="produto">
                    <option selected>Escolha o produto...</option>
                    <option value="1">um</option>
                    <option value="2">Dois</option>
                    <option value="3">Três</option>
<?php
 while($linha = mysqli_fetch_array($query))
 {
   echo '<option value=""> '.$linha['nome'] . '</option>';
 }
?>
                  </select>
              </div>
              <div class="form-group col-md-6">
                    <label for="inputEmail4">Marca</label>
                    <input type="email" class="form-control" id="marca" placeholder="Marca">
              </div>
            </div>
            <div class="input-group">
                <div class="input-group-prepend">
                  <span class="input-group-text">Descrição</span>
                </div>
                <textarea class="form-control" aria-label="Com textarea"></textarea>
              </div>
            <div class="form-group">
              <label for="inputAddress2">CPNJ / CPF</label>
              <input type="text" class="form-control" id="inputAddress2" placeholder="999.999.999-90">
            </div>

            <button type="submit" class="btn btn-primary">Cadastrar</button>
          </form>
    </div>
</body>
</html>