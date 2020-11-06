import 'package:firebaselogin/app/data/controller/login_controller.dart';
import 'package:firebaselogin/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController _loginController = Get.find<LoginController>();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        key: _formKey,
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.grey[900],
        child: Stack(
          children: <Widget>[
            Container(
              width: double.maxFinite,
              child: Image.asset(
                "assets/splash.jpg",
                width: double.maxFinite,
              ),
            ),
            Positioned(
              top: 120,
              left: 32,
              child: Text(
                "Entrar",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              top: 200,
              child: Container(
                padding: EdgeInsets.fromLTRB(32, 32, 32, 0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80.0),
                    topRight: Radius.circular(80.0),
                    bottomLeft: Radius.circular(80.0),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    // PARTE DE FORMULARIO
                    TextField(
                      controller: _loginController.emailTextController,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                      autofocus: true,
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
                          _loginController.login();
                        },
                        child: Text("LOGIN"),
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
                        onPressed: null,
                        child: Text(
                          "Esqueceu sua senha?",
                          style: TextStyle(color: Colors.grey, fontSize: 19.0),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 13),
                      child: FlatButton(
                        onPressed: () {
                          Get.toNamed(Routes.REGISTER);
                        },
                        child: Text(
                          "Cadastrar",
                          style: TextStyle(color: Colors.grey, fontSize: 19.0),
                        ),
                      ),
                    ),

                    Container(
                      height: 70,
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
    );
  }
}
