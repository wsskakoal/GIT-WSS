import 'package:get/get.dart';
import 'package:login2/app/routes/app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(name: Routes.INITIAL, page: () => null),
    GetPage(name: Routes.LOGIN, page: () => null),
    GetPage(name: Routes.HOME, page: () => null),
  ];
}
