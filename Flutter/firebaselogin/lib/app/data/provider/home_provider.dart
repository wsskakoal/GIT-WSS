import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';


const baseUrl = 'http://gerador-nomes.herokuapp.com/nomes/10';
GetStorage box = GetStorage('login_firebase');

FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

class HomeApiClient {

  signOut() {
    box.write("auth", null);
    //box.erase();
    return _firebaseAuth.signOut();
  }
}
