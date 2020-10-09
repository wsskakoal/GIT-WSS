import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        children: <Widget>[
          Hero(
              tag: "Hero",
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 48.0,
                child: Image.asset("Icone.ico"),
              ))
        ],
      ),

      /* Padding(
        padding: EdgeInsets.all(50.0),
        child: Center(
          child: Column(
            // stretch USADO PARA ALINHAR AO TAMANHO DA TELA
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                autofocus: true,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: new TextStyle(color: Colors.white, fontSize: 20.0),
                decoration: InputDecoration(
                    labelText: "Login",
                    labelStyle: TextStyle(color: Colors.white)),
              ),
              Divider(),
              Divider(),
              TextFormField(
                autofocus: true,
                textAlign: TextAlign.center,
                obscureText: true,
                keyboardType: TextInputType.text,
                style: new TextStyle(color: Colors.white, fontSize: 20.0),
                decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              Divider(),
              ButtonTheme(
                buttonColor: Colors.white,
                height: 55,
                child: RaisedButton(
                  onPressed: () => {},
                  child: Text(
                    "ENTRAR",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  splashColor: Colors.red,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ), */
    );
  }
}
