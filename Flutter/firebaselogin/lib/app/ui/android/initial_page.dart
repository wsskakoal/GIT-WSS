import 'package:firebaselogin/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Retirado app bar pra nao ficar feio.
      //appBar: AppBar(title: Text('InitialPage')),
      body: Stack(
        children: [
          SplashScreen(
            seconds: 5,
            gradientBackground: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.red[600],
                  Colors.red[400],
                ]),
            navigateAfterSeconds: Routes.LOGIN,
            // RETIRA A ANIMAÇÃO DE LOADING
            loaderColor: Colors.blue,
          ),
          Container(
            // Usar caso for uma logo pequena.
            // margin: EdgeInsets.all(140),
            decoration: BoxDecoration(
              image: DecorationImage(
                // Usar parametro fit: BoxFit.contain para ajustar
                image: AssetImage("assets/splash.jpg"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
