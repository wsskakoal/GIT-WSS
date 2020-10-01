<?php
session_start();
include('verifica_login.php');
?>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
  integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="login.css" />
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  <title>Empório do seu Jõao</title>
</head>
<body>
<script>
/* Open the sidenav */
/* Set the width of the side navigation to 250px */
function openNav() {
  document.getElementById("mySidenav").style.width = "100%";
}

/* Set the width of the side navigation to 0 */
function closeNav() {
  document.getElementById("mySidenav").style.width = "0%";
} 
</script>
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="cadcliente.php" class="dropdown-item"> Cadastro de cliente</a>
  <a href="cadproduto.php" class="dropdown-item">Cadastro de Produto</a>
  <a href="entraproduto.php" class="dropdown-item">Entrada de Produto</a>
  <a href="saiproduto.php" class="dropdown-item">Saída de produto</a>
  <a href="cadfornecedor.php" class="dropdown-item">Cadastro de fornecedor</a>
  <a href="cadastrousuario.php" class="dropdown-item">Cadastrar Adminstrador</a>
</div>

<!-- Use any element to open the sidenav -->


<div class="center">
<nav class="navbar navbar-dark bg-dark flex-fill justify-content-center">
<a class="navbar-link disabled ">
<img src="emporio.png" alt="logotipo" class="rounded-circle" width=20% height=15%>
</a>

<!--<a class="navbar-brand " href="painel.php">EMPÓRIO DO SEU JOÃO</a>   -->
</nav>
</div>

<nav class="navbar navbar-dark bg-dark">
<nav class="navbar navbar-dark bg-dark ">
<div class="dropdown">
<button class="btn btn-secondary" onclick="openNav()" type="button" >
      <span class="navbar-toggler-icon"></span>
</button>         
<button onclick="openNav()" class="btn btn-secondary" type="button" id="dropdownMenu2" >
       
          <span onclick="openNav()">Realizar Cadastros</span>
          </button>
        </div>
</nav>
  <!-- Navbar content -->
  <nav class="navbar navbar-expand-lg bg-dark">


    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="pesquisaclientes.php">Clientes</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="pesquisafornecedores.php">Fornecedores</a>
        </li>


        <li class="nav-item">
          <a class="nav-link" href="pesquisaprodutos.php">Pesquisa de Produtos</a>
        </li>
       
      </ul>
    </div>
  </nav>

  <nav class="navbar navbar-dark bg-dark ">
<div>
  <span class="navbar-text">Olá, Bem vindo <?php echo $_SESSION['usuario']; ?></span>
  <a href="logout.php">Logout</a>
</div>

</nav>

</nav>
  
  <img src="bg2.jpg" alt="some text" width=100% height=70%>
  
</body>
</html>








