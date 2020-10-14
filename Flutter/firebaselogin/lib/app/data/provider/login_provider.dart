import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaselogin/app/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import '../model/user_model.dart';

const baseUrl = 'http://gerador-nomes.herokuapp.com/nomes/10';

class LoginApiClient {

  
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  GetStorage box = GetStorage('login_firebase');

  // ignore: deprecated_member_use
  Stream<UserModel> get onAuthStateChanged => _firebaseAuth.onAuthStateChanged
      .map((FirebaseUser currentUser) => UserModel.fromSnapshot(currentUser));

// LOGIN INICIAL.
  // ignore: missing_return
  Future<UserModel> signInWithEmailAndPassword(
      String email, String senha, String name) async {
    try {
      final currentUser = (await _firebaseAuth.signInWithEmailAndPassword(
              email: email, password: senha))
          .user;

      return UserModel.fromSnapshot(currentUser);
    } catch (e) {
      print(e);
      Get.back();
      switch (e.code) {
        case "invalid-email":
          Get.defaultDialog(
              title: "Ocorreu um erro", content: Text("Email inválido."));
          break;
        case "wrong-password":
          Get.defaultDialog(
              title: "Ocorreu um erro",
              content: Text("Your password is wrong."));
          break;
        case "user-not-found":
          Get.defaultDialog(
              title: "Ocorreu um erro",
              content: Text("User with this email doesn't exist."));
          break;
        case "user-disabled":
          Get.defaultDialog(
              title: "Ocorreu um erro",
              content: Text("User with this email has been disabled."));
          break;
        case "too-many-requests":
          Get.defaultDialog(
              title: "Ocorreu um erro",
              content: Text(
                  "Muitas tentativas. Tente novamente em alguns segundos."));
          break;
        case "operation-not-allowed":
          Get.defaultDialog(
              title: "Ocorreu um erro",
              content:
                  Text("Signing in with Email and Password is not enabled."));
          break;
        default:
          Get.defaultDialog(
              title: "Ocorreu um erro",
              content:
                  Text("Ocorreu um erro inesperado ao fazer login. Erro:  $e"));
      }
      return null;
    }
  }

// CRIAR USUARIO
  Future<UserModel> createUserWithEmailAndPassword(
      String email, String senha, String name) async {
    try {
      final currentUser = (await _firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: senha))
          .user;

      var userUpdate = UserUpdateInfo();
      userUpdate.displayName = name;

      await currentUser.updateProfile(userUpdate);
      await currentUser.reload();
      return UserModel.fromSnapshot(currentUser);
      // Atualizando nome do usuario

    } catch (e) {
      print(e);
      Get.back();
      switch (e.code) {
        case "invalid-email":
          Get.defaultDialog(
              title: "Ocorreu um erro", content: Text("Email inválido."));
          break;
        case "wrong-password":
          Get.defaultDialog(
              title: "Ocorreu um erro",
              content: Text("Your password is wrong."));
          break;
        case "email-already-in-use":
          Get.defaultDialog(
              title: "Ocorreu um erro",
              content: Text("E-mail já esta em uso."));
          break;
        case "weak-password":
          Get.defaultDialog(
              title: "Ocorreu um erro", content: Text("Senha muito fraca."));
          break;
        case "operation-not-allowed":
          Get.defaultDialog(
              title: "Ocorreu um erro",
              content: Text("Operação nao realizada."));
          break;
        case "invalid-credential":
          Get.defaultDialog(
              title: "Ocorreu um erro",
              content: Text("Credenciais inválidas."));
          break;

        default:
          Get.defaultDialog(
              title: "Ocorreu um erro",
              content:
                  Text("Ocorreu um erro inesperado ao fazer login. Erro:  $e"));
      }
      return null;
    }
  }

  ///Future<UserModel> ,
// DESLOGAR
  signOut() {
    box.write("auth", null);
    //box.erase();
    return _firebaseAuth.signOut();
  }

  final http.Client httpClient;
  LoginApiClient({@required this.httpClient});
}
