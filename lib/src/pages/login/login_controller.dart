import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{

  // Controllers para captar los datos de los inputs en el back
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void goToRegisterPage(){
    Get.toNamed('/register');
  }

  void login(){
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    print('Email ${email}');
    print('Password ${password}');

    // Funcion de validacion de formulario
    if(isValidForm(email, password)){
      Get.snackbar('Formulario valido', 'Enviando peticion http');
    }
  }

  bool isValidForm(String email, String password){
    if(email.isEmpty){
      Get.snackbar('Formulario no valido', 'Debes ingresar el email');
      return false;
    }
    if(!GetUtils.isEmail(email)){
      Get.snackbar('Formulario no valido', 'Debes ingresar el email correctamente');
      return false;
    }
    if(password.isEmpty){
      Get.snackbar('Formulario no valido', 'debes ingresar tu contraseña');
      return false;
    }

    return true;

  }
}