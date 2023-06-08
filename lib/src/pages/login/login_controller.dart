import 'package:delivery_app/src/models/response_api.dart';
import 'package:delivery_app/src/providers/users_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();

  void goToRegisterPage() {
    Get.toNamed('/register');
  }

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    print('Email ${email}');
    print('Password ${password}');

    if (isValidForm(email, password)) {

      ResponseApi responseApi = await usersProvider.login(email, password);
      // Imprimimos la response por consola
      print('Response Api: ${responseApi.toJson()}');
      if(responseApi.success == true){
        //Si el usuario se loguea exitosamente, entonces, lo guardamos en el Storage
        GetStorage().write('user', responseApi.data);
        //Y luego mandamos al usuario a la pantalla de inicio
        goToHomePage();
      }
      else{
        Get.snackbar('Login Fallido', responseApi.message ?? '');
      }
    }
  }

  void goToHomePage() {
    Get.toNamed('/home');
  }

  bool isValidForm(String email, String password) {
    if (email.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes ingresar el email');
      return false;
    }

    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Formulario no valido', 'El email no es valido');
      return false;
    }

    if (password.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes ingresar el password');
      return false;
    }

    return true;
  }
}
