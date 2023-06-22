import 'package:delivery_app/src/models/user.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ClientProfileInfoController extends GetxController {
  var user = User.fromJson(GetStorage().read('user') ?? {}).obs;

  void singOut(){
    GetStorage().remove('user');
    Get.offNamedUntil('/', (route) => false);// Elimina el historial de pantallas
  }

  void goToProfileUpdate(){
    Get.toNamed('/client/profile/update');
  }
}