import 'package:controleloja/app/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// TELA LOGIN
class LoginPage extends StatelessWidget {
  final LoginController _loginController = Get.find<LoginController>();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //appBar: AppBar(title: Text('Tela de login')),
      body: Container(
        key: _formKey,
        width: Get.width,
        height: Get.height,
        color: Colors.blue,
        child: Stack(
          children: <Widget>[
            Container(
              width: Get.width,
              height: Get.height / 4,
              child: Image.asset(
                "images/pay.png",
                width: Get.width,
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
              top: 170,
              child: Container(
                height: Get.height,
                width: Get.width,
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: LoginController(),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                    topRight: Radius.circular(1),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
