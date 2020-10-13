import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: "Usuário",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 50),
                      child: TextField(
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
                        onPressed: () {},
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
