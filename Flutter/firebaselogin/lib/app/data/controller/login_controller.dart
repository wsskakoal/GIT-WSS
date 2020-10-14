import 'package:firebaselogin/app/data/repository/login_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../model/user_model.dart';
import '../model/user_model.dart';

class LoginController extends GetxController {
  final LoginRepository repository = LoginRepository();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController nameTextController = TextEditingController();

  void register() async {
    UserModel user = await repository.createUserWithEmailAndPassword(
        emailTextController.text,
        passwordTextController.text,
        nameTextController.text);

    if (user != null) {
      Get.offAllNamed(Routes.HOME, arguments: user);
    }

    void login() async {
      UserModel user = await repository.signInWithEmailAndPassword(
          emailTextController.text,
          passwordTextController.text,
          nameTextController.text);

      if (user != null) {
        Get.offAllNamed(Routes.HOME, arguments: user);
      }
    }
  }
}
