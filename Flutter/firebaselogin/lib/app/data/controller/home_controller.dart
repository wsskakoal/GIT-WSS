import 'package:firebaselogin/app/data/model/user_model.dart';
import 'package:firebaselogin/app/data/repository/home_repository.dart';
import 'package:firebaselogin/app/routes/app_routes.dart';
import 'package:firebaselogin/app/ui/theme/app_theme.dart';
import 'package:firebaselogin/app/ui/theme/app_theme_dark.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final UserModel user = Get.arguments;
  final HomeRepository repository = HomeRepository();

  GetStorage box = GetStorage("login_firebase");
  RxString txtThemeButton = "Tema: Escuro".obs;
  RxBool isActived = true.obs;

  @override
  void onInit() {
    txtThemeButton.value = Get.isDarkMode ? "Tema: Claro" : "Tema: Escuro";
    super.onInit();
  }

  void changedTheme() {
    if (Get.isDarkMode) {
      box.write("theme", "light");
      txtThemeButton.value = "Tema: Escuro";
      Get.changeTheme(appThemeData);
    } else {
      box.write("theme", "dark");
      txtThemeButton.value = "Tema: Claro";
      Get.changeTheme(appThemeDataDark);
    }
  }

  void logout() {
    repository.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
