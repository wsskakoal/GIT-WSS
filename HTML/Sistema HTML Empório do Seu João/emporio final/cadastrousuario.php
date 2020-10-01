<!---->
<html lang="br">
    <head>
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.js"></script>
    <link rel="stylesheet" type="text/css" href="login.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>Cadastro de Cliente</title>
    <meta charset="utf-8">
    </head>

    <body>
        <div class="principal">
            <div class="cadastro ">
                <form name="formcadastro" action="cadusuario.php" method="POST">
                <h1 class="border border-primary rounded"> Sistema de Cadastro </h1>
                <br>
                <label for="nome">Bem vindo, Cadastre agora seu usuario e senha para ter acesso ao site.</label> 
                <br>
                <div class="d-flex align-middle justify-content-center">
                    <label class="align-baseline" for="colocarusuario">Usuario</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="usuario" name="usuario" placeholder="Seu usuario">
                        </div>
                        <label for="colocarsenha">Senha</label>
                        <div class="col-sm-5">
                            <input type="password" class="form-control" id="senha" name="senha" placeholder="Sua senha">
                        </div>
                </div>
                
                <br>
                <input type="submit" value="Realizar Cadastro" class="btn btn-primary"/>
                </form>
            </div>
        </div>
    </body>

</html>
