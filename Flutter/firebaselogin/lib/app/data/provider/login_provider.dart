import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebaselogin/app/data/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import '../model/user_model.dart';

const baseUrl = 'http://gerador-nomes.herokuapp.com/nomes/10';

class LoginApiClient {
  auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  Stream<UserModel> get onAuthStateChanged => _firebaseAuth.onAuthStateChanged
      .map((auth.User currentUser) => UserModel.fromSnapshot(currentUser));

  // ignore: missing_return
  Future<UserModel> signInWithEmailAndPassword(
      String email, String senha, String name) async {
    try {
      final currentUser = (await _firebaseAuth.signInWithEmailAndPassword(
              email: email, password: senha))
          .user;

      return UserModel.fromSnapshot(currentUser);
      // Atualizando nome do usuario

    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<UserModel> createUserWithEmailAndPassword(
      String email, String senha, String name) async {
    try {
      final currentUser = (await _firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: senha))
          .user;

      var userModel = new UserModel();
      userModel.name = name;
      userModel.email = currentUser.email;
      userModel.urlimage = currentUser.photoURL;

      return userModel;
      // Atualizando nome do usuario

    } catch (e) {
      print(e);
      return null;
    }
  }

  ///Future<UserModel> ,

  signOut() {
    return _firebaseAuth.signOut();
  }

  final http.Client httpClient;
  LoginApiClient({@required this.httpClient});

/*   getAll() async {
    try {
      var response = await httpClient.get(baseUrl);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        List<UserModel> listMyModel = jsonResponse['data'].map<UserModel>((map) {
          return UserModel.fromJson(map);
        }).toList();
        return listMyModel;
      } else
        print('erro -get');
    } catch (_) {}
  } */

  /*  getId(id) async {
    try {
      var response = await httpClient.get(baseUrl);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        // TODO: implement methods!
      } else
        print('erro -get');
    } catch (_) {}
  }

  add(obj) async {
    try {
      var response = await httpClient.post(baseUrl,
          headers: {'Content-Type': 'application/json'}, body: jsonEncode(obj));
      if (response.statusCode == 200) {
        // TODO: implement methods!
      } else
        print('erro -post');
    } catch (_) {}
  }

  edit(obj) async {
    try {
      var response = await httpClient.put(baseUrl,
          headers: {'Content-Type': 'application/json'}, body: jsonEncode(obj));
      if (response.statusCode == 200) {
        // TODO: implement methods!
      } else
        print('erro -post');
    } catch (_) {}
  }

  delete(obj) async {
    try {
      var response = await httpClient.delete(baseUrl);
      if (response.statusCode == 200) {
        // TODO: implement methods!
      } else
        print('erro -post');
    } catch (_) {}
  } */
}
