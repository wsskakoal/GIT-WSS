import 'package:firebaselogin/app/data/model/user_model.dart';
import 'package:firebaselogin/app/data/provider/login_provider.dart';

class LoginRepository {
  // ignore: missing_required_param
  final LoginApiClient apiClient = LoginApiClient();

  Future<UserModel> createUserWithEmailAndPassword(
      String email, String senha, String nome) {
    return apiClient.createUserWithEmailAndPassword(email, senha, nome);
  }

  Future<UserModel> signInWithEmailAndPassword(
      String email, String senha, String nome) {
    return apiClient.signInWithEmailAndPassword(email, senha, nome);
  }

/* getAll(){
  return apiClient.getAll();
}
getId(id){
  return apiClient.getId(id);
}
delete(id){
  return apiClient.delete(id);
}
edit(obj){
  return apiClient.edit( obj );
}
add(obj){
    return apiClient.add( obj );
} */

}
