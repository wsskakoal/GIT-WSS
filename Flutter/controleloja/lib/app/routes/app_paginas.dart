import 'package:controleloja/app/paginas/home.dart';
import 'package:controleloja/app/paginas/initial.dart';
import 'package:controleloja/app/paginas/login.dart';
import 'package:get/get.dart';
part './app_rotas.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => InitialPage(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
    ),
  ];
}
