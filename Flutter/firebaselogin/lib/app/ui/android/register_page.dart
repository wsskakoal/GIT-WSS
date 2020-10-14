import 'package:firebaselogin/app/data/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final LoginController _loginController = LoginController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.grey[900],
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.only(top: 30),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 10),
                child: Text(
                  "Cadastro",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Container(
                  padding: EdgeInsets.fromLTRB(32, 32, 32, 0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(80.0),
                      topRight: Radius.circular(80.0),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      // PARTE DE FORMULARIO
                      Padding(
                        padding: EdgeInsets.only(bottom: 25),
                        child: TextFormField(
                          controller: _loginController.nameTextController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Campo obrigatório";
                            }
                            return null;
                          },
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                          autofocus: true,
                          decoration: InputDecoration(
                            hintText: "Nome",
                          ),
                        ),
                      ),

                      TextFormField(
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                        controller: _loginController.emailTextController,
                        // ignore: missing_return
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Campo obrigatório";
                          } else if (!GetUtils.isEmail(value)) {
                            return "Email invalído";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "E-mail",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 50),
                        child: TextFormField(
                          controller: _loginController.passwordTextController,
                          // ignore: missing_return
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Campo obrigatório";
                            } else if (value.length < 6) {
                              return "Senha deve conter no mínimo 6 caracteres.";
                            }
                          },
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Senha",
                          ),
                        ),
                      ),

                      // BOTAO PRINCIPAL
                      /* Container(
                      width: double.maxFinite,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.all(
                          Radius.circular(32),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ), */

                      Container(
                        width: double.maxFinite,
                        height: 55,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        child: RaisedButton(
                          color: Colors.grey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: Colors.deepPurple)),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              _loginController.register();
                            }
                          },
                          child: Text("CADASTRAR"),
                          textColor: Colors.white,
                          splashColor: Colors.deepPurple,
                        ),
                      ),

                      // botao normal
                      /* ButtonTheme(
                      buttonColor: Colors.deepPurple,
                      height: 45,
                      minWidth: double.maxFinite,
                      child: RaisedButton(
                        onPressed: () {},
                        child: Text("TEXTO"),
                        splashColor: Colors.grey,
                      ),
                    ), */

                      Padding(
                        padding: EdgeInsets.only(top: 13),
                        child: FlatButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(
                            "Voltar ao login",
                            style:
                                TextStyle(color: Colors.grey, fontSize: 19.0),
                          ),
                        ),
                      ),

                      Container(
                        height: 10,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 13, right: 10),
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Icon(
                                Icons.flash_on,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 13, left: 10),
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Icon(
                                Icons.flash_on,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
