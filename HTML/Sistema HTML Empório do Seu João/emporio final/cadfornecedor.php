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
    <title>Cadastro De Fornecedores</title>
    <meta charset="utf-8">
    <form action="fornecedor.php" method="post">
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
        <form>
            <h1 class="border"> Cadastro de fornecedores </h1>
            <div class="form-row">
              <div class="form-group col-md-6">
                <label for="inputEmail4">Nome</label>
                <input type="text" class="form-control" id="inputName" placeholder="nome" name="nome" required="true">
              </div>
              <div class="form-group col-md-6">
                    <label for="inputEmail4">Email</label>
                    <input type="email" class="form-control" id="inputEmail4" placeholder="email" name="email" required="true">
              </div>
            </div>
            <div class="form-group">
              <label for="inputAddress">Endereço</label>
              <input type="text" class="form-control" id="inputAddress" name="endereco" placeholder="Rua dos Bobos, nº 0"required="true">
            </div>


            <div class="form-row">
              <div class="form-group col-md-6">
                <label for="inputEmail4">CPNJ</label>
                <input type="text" class="form-control" id="inputName" placeholder="XX.XXX.XXX/0001-XX" name="cnpj" required="true">
              </div>
              <div class="form-group col-md-6">
                    <label for="inputEmail4">TELEFONE</label>
                    <input type="text" class="form-control" id="inputEmail4" placeholder="(00) 0000-0000" name="telefone">
              </div>
            </div>



            <div class="form-row">
              <div class="form-group col-md-6">
                <label for="inputCity">Cidade</label>
                <input type="text" class="form-control" id="inputCity" name="cidade">
              </div>
              <div class="form-group col-md-4">
                <label for="inputEstado">Estado</label>
                <select id="inputEstado" name="estado" class="form-control">
                  <option selected>Escolher...</option>
<option value="Acre">Acre</option>
<option value="Alagoas">Alagoas</option>
<option value="Amapa">Amapá</option>
<option value="Amazonas">Amazonas</option>
<option value="Bahia">Bahia</option>
<option value="Ceara">Ceará</option>
<option value="Distrito Federal">Distrito Federal</option>
<option value="Espírito Santo">Espírito Santo</option>
<option value="Goias">Goiás</option>
<option value="Maranhão">Maranhão</option>
<option value="Mato Grosso">Mato Grosso</option>
<option value="Mato Grosso do Sul">Mato Grosso do Sul</option>
<option value="Minas Gerais">Minas Gerais</option>
<option value="Para">Pará</option>
<option value="Paraíba">Paraíba</option>
<option value="Parana">Paraná</option>
<option value="Pernambuco">Pernambuco</option>
<option value="Piaui">Piauí</option>
<option value="Rio de Janeiro">Rio de Janeiro</option>
<option value="Rio Grande do Sul">Rio Grande do Sul</option>
<option value="Rio Grande do Norte">Rio Grande do Norte</option>
<option value="Rondonia">Rondônia</option>
<option value="Roraima">Roraima</option>
<option value="Santa Catarina">Santa Catarina</option>
<option value="São Paulo">São Paulo</option>
<option value="Sergipe">Sergipe</option>
<option value="Tocantins">Tocantins</option>
                </select>
              </div>
              <div class="form-group col-md-2">
                <label for="inputCEP">CEP</label>
                <input type="text" class="form-control" id="inputCEP" name="cep">
              </div>
            </div>
            
            <button type="submit" class="btn btn-primary">Entrar</button>
          </form>
    </div>
</body>
</html>