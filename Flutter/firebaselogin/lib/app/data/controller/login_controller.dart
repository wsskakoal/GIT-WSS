import 'package:firebaselogin/app/data/repository/login_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../routes/app_routes.dart';
import '../model/user_model.dart';

class LoginController extends GetxController {
  final LoginRepository repository = LoginRepository();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController nameTextController = TextEditingController();

  GetStorage box = GetStorage("login_firebase");

  @override
  void onReady() {
    isLogged();
    super.onReady();
  }

  void isLogged() {
    if (box.hasData("auth")) {
      UserModel user = UserModel(
        id: box.read("auth")["id"],
        email: box.read("auth")["email"],
        name: box.read("auth")["name"],
        urlimage: box.read("auth")["urlimage"],
      );

      Get.offAllNamed(Routes.HOME, arguments: user);
    }
  }
/*         id: box.read("auth")["id"],
        email: box.read("auth")["id"],
        name: box.read("auth")["id"],
        urlimage: box.read("auth")["id"], */

  void register() async {
    try {
      Get.dialog(
        Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );
      UserModel user = await repository.createUserWithEmailAndPassword(
          emailTextController.text,
          passwordTextController.text,
          nameTextController.text);

      if (user != null) {
        box.write("auth", user);
        Get.offAllNamed(Routes.HOME, arguments: user);
      }
    } catch (e) {
      print(e);
    }
  }

  void login() async {
    try {
      Get.dialog(
        Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );
      UserModel user = await repository.signInWithEmailAndPassword(
          emailTextController.text,
          passwordTextController.text,
          nameTextController.text);

      if (user != null) {
        box.write("auth", user);
        Get.offAllNamed(Routes.HOME, arguments: user);
      }
    } catch (e) {
      print(e);
    }
  }

  void logout() {
    repository.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
