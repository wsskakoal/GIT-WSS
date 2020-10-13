import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class UserModel {
  String id;
  String name;
  String email;
  String urlimage;

  UserModel({this.id, this.name, this.email, this.urlimage});

  UserModel.fromSnapshot(auth.User currentUser) {
    this.id = currentUser.uid;
    this.name = currentUser.displayName;
    this.email = currentUser.email;
    this.urlimage = currentUser.photoURL;
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "urlimage": urlimage,
    };
  }
}
