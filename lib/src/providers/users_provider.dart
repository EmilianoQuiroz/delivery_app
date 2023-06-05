import 'package:delivery_app/src/environment/environment.dart';
import 'package:get/get.dart';
import 'package:delivery_app/src/models/user.dart';

class UsersProvider extends GetConnect{

  String url = Environment.API_URL + "api/users";

  Future<Response> create(User user) async {
    Response response = await post(
        '$url/create',
        user.toJson(),
        headers: {
          'Content-Type': 'aplication/json'
        }
    );// Espera hasta que el servidor retorne una respuesta

    return response;
  }
}