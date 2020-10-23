import 'package:flutter/material.dart';
import 'package:lojawss/app/dados/modelos/modelo_usuario.dart';
import 'package:lojawss/app/telas/paginas/tela_cadastro_usuario.dart';
import 'package:lojawss/app/telas/paginas/tela_carregamento_padrao.dart';
import 'package:lojawss/app/tema/cor_primaria.dart';
import 'package:scoped_model/scoped_model.dart';

class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Color corPrimaria = Theme.of(context).primaryColor;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Entrar"),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => TelaCadastroUsuario()));
            },
            child: Text(
              "Criar conta",
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
            textColor: Colors.white,
          ),
        ],
      ),
      body: ScopedModelDescendant<ModeloUsuario>(
          builder: (context, child, model) {
        if (model.isLoading) {
          return TelaCarregamentoPadrao();
        }
        return Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(16.0),
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                validator: (value) {
                  if (value.isEmpty || !value.contains("@"))
                    return "Email inválido";
                  else {
                    return null;
                  }
                },
                decoration: InputDecoration(hintText: "E-mail"),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _passController,
                decoration: InputDecoration(hintText: "Senha"),
                validator: (value) {
                  if (value.isEmpty || value.length < 6)
                    return "Email inválido";
                  else
                    return null;
                },
                obscureText: true,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: FlatButton(
                  onPressed: () {
                    if (_emailController.text.isEmpty) {
                      _scaffoldKey.currentState.showSnackBar(
                        SnackBar(
                          content: Text("Insira seu email para recuperação."),
                          backgroundColor: corPrimaria,
                          duration: Duration(seconds: 2),
                        ),
                      );
                    } else {
                      model.recuperarSenha(_emailController.text);
                      _scaffoldKey.currentState.showSnackBar(
                        SnackBar(
                          content: Text("Confira o seu email."),
                          backgroundColor: corPrimaria,
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Esqueci minha senha",
                    textAlign: TextAlign.right,
                  ),
                  padding: EdgeInsets.zero,
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              SizedBox(
                height: 44.0,
                child: RaisedButton(
                  onPressed: () {
                    model.entrar(
                        email: _emailController.text,
                        pass: _passController.text,
                        onFail: _onFail,
                        onSucess: _onSucess);
                    if (_formKey.currentState.validate()) {}
                  },
                  child: Text(
                    "Entrar",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  textColor: Colors.white,
                  color: corPrimaria,
                ),
              )
            ],
          ),
        );
      }),
    );
  }

  void _onSucess() {
    Navigator.of(context).pop();
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text("Falha ao criar usuário!"),
        backgroundColor: corPrimaria,
        duration: Duration(seconds: 2),
      ),
    );
  }
}
