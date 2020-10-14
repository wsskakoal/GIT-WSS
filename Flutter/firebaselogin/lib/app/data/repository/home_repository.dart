import 'package:firebaselogin/app/data/provider/home_provider.dart';

class HomeRepository {
  final HomeApiClient apiClient = HomeApiClient();

  signOut() {
    apiClient.signOut();
  }
}
