import 'package:flutter/material.dart';
import 'package:lojawss/app/dados/modelos/modelo_usuario.dart';
import 'package:lojawss/app/telas/tela_carregamento_padrao.dart';
import 'package:lojawss/app/tema/cor_primaria.dart';
import 'package:scoped_model/scoped_model.dart';

class TelaCadastroUsuario extends StatefulWidget {
  @override
  _TelaCadastroUsuarioState createState() => _TelaCadastroUsuarioState();
}

class _TelaCadastroUsuarioState extends State<TelaCadastroUsuario> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Color corPrimaria = Theme.of(context).primaryColor;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Criar Conta"),
        centerTitle: true,
      ),
      body:
          ScopedModelDescendant<ModeloUsuario>(builder: (contex, child, model) {
        if (model.isLoading) {
          return TelaCarregamentoPadrao();
        }

        return Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(16.0),
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                validator: (value) {
                  if (value.isEmpty)
                    return "Nome inválido";
                  else
                    return null;
                },
                decoration: InputDecoration(hintText: "Nome Completo"),
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                controller: _emailController,
                validator: (value) {
                  if (value.isEmpty || !value.contains("@"))
                    return "Email inválido";
                  else
                    return null;
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
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(hintText: "Endereço"),
                validator: (value) {
                  if (value.isEmpty)
                    return "Endereço inválido";
                  else
                    return null;
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              SizedBox(
                height: 44.0,
                child: RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Map<String, dynamic> _userData = {
                        "name": _nameController.text,
                        "email": _emailController.text,
                        "address": _addressController.text,
                      };
                      model.cadastro(
                          userData: _userData,
                          pass: _passController.text,
                          onSucess: _onSucess,
                          onFail: _onFail);
                    }
                  },
                  child: Text(
                    "Criar Conta",
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
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text("Usuario criado com sucesso!"),
        backgroundColor: corPrimaria,
        duration: Duration(seconds: 2),
      ),
    );
    Future.delayed(Duration(seconds: 2))
        .then((value) => Navigator.of(context).pop());
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
