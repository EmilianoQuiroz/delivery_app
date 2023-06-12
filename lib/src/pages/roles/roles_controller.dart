import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:delivery_app/src/models/user.dart';
import 'package:delivery_app/src/models/Rol.dart';

class RolesController extends GetxController {

  User user = User.fromJson(GetStorage().read('user') ?? {});

  void goToPageRol(Rol rol) {
    Get.offNamedUntil(rol.route ?? '', (route) => false);
  }

}