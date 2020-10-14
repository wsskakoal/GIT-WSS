import 'package:firebaselogin/app/data/bindings/home_binding.dart';
import 'package:firebaselogin/app/data/bindings/login_binding.dart';
import 'package:firebaselogin/app/ui/android/home_page.dart';
import 'package:firebaselogin/app/ui/android/initial_page.dart';
import 'package:firebaselogin/app/ui/android/login_page.dart';
import 'package:firebaselogin/app/ui/android/register_page.dart';
import 'package:get/get.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(name: Routes.INITIAL, page: () => InitialPage()),
    GetPage(
        name: Routes.LOGIN, page: () => LoginPage(), binding: LoginBinding()),
    GetPage(name: Routes.HOME, page: () => HomePage(), binding: HomeBinding()),
    GetPage(name: Routes.REGISTER, page: () => RegisterPage()),
  ];
}
