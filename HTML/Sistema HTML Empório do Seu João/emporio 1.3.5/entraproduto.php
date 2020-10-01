<?php
session_start();
include('verifica_login.php');
?>
<html lang="br">
    <head>
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.js"></script>
    <link rel="stylesheet" type="text/css" href="login.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>Entrada de produtos</title>
    <meta charset="utf-8">
    </head>



<body>

<nav class="navbar navbar-dark bg-dark justify-content-center">
<div class="topodapagina">

    <a href="painel.php" class="btn btn-secondary">Voltar a Pagina Principal </a>
    <a href="entraproduto.php" class="btn btn-secondary">Entrada de Produto</a>
    <a href="saiproduto.php" class="btn btn-secondary">Saida de Produto</a>
    <a href="cadproduto.php" class="btn btn-secondary">Cadastro de Produto</a>
</div>
</nav>

    <div class="principal">
      <form action="entrapro.php" method="POST">
        <h1 class="border"> Entrada de produtos </h1>
            <div class="form-row">
              <div class="form-group col-md-6">
                <label for="inputEmail4">ID do produto</label>
                <input type="text" class="form-control" id="idproduto" name="idproduto" placeholder="idproduto" required="true">
              </div>
              <div class="form-group col-md-6">
                    <label for="inputEmail4">Quantidade</label>
                    <input type="text" class="form-control" id="quantidade" name="quantidade" placeholder="quantidade" required="true">
              </div>
              <div class="form-group col-md-6">
                <label for="inputEmail4">Valor unitario</label>
                <input type="text" class="form-control" id="vunitario" name="vunitario" placeholder="vunitario" required="true">
              </div>
              <div class="form-group col-md-6">
                <label for="inputEmail4">Data de Entrada</label>
                <input type="date" class="form-control" id="data" name="data" placeholder="data" required="true">
              </div>
            </div>
            
            <button type="submit" class="btn btn-primary">Cadastrar</button>
          </form>
    </div>
</body>
</html>