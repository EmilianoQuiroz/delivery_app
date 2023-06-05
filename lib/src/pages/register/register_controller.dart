import 'package:delivery_app/src/models/user.dart';
import 'package:delivery_app/src/providers/users_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController{
  // Controllers para captar los datos de los inputs en el back
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();

  void register()async{
    String email = emailController.text.trim();
    String name = nameController.text;
    String lastname = lastnameController.text;
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    print('Email ${email}');
    print('Password ${password}');

    // Funcion de validacion de formulario
    if(isValidForm(email,name, lastname, phone, password, confirmPassword)){
      User user = User(
        email: email,
        name: name,
        lastname: lastname,
        phone: phone,
        password: password
      );

      Response response = await usersProvider.create(user);

      print('RESPONSE: ${response.body}');

      Get.snackbar('Formulario valido', 'Enviando peticion http');
    }
  }

  bool isValidForm(
      String email,
      String name,
      String lastname,
      String phone,
      String password,
      String confirmPassword
      ){
    if(email.isEmpty){
      Get.snackbar('Formulario no valido', 'Debes ingresar el email');
      return false;
    }
    if(!GetUtils.isEmail(email)){
      Get.snackbar('Formulario no valido', 'Debes ingresar el email correctamente');
      return false;
    }
    if(name.isEmpty){
      Get.snackbar('Formulario no valido', 'Debes ingresar su nombre');
      return false;
    }
    if(lastname.isEmpty){
      Get.snackbar('Formulario no valido', 'Debes ingresar su apellido');
      return false;
    }
    if(phone.isEmpty){
      Get.snackbar('Formulario no valido', 'Debes ingresar su celular');
      return false;
    }
    if(password.isEmpty){
      Get.snackbar('Formulario no valido', 'Debes ingresar tu contraseña');
      return false;
    }
    if(confirmPassword.isEmpty){
      Get.snackbar('Formulario no valido', 'Debes confirmar tu contraseña');
      return false;
    }
    if (password != confirmPassword){
      Get.snackbar('Formulario no valido', 'Las contraseñás deben coincidir');
      return false;
    }
    return true;

  }
}
