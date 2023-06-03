import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,
        child: _textDontHaveAccount(),
      ),
      body: Stack(//Para pocicionarl elementos uno encima del otro
        children: [
          _backgroundCover(context),
          Column(//Para posicionar elementos uno abajo del otro
            children: [
              _imageCover(),
              _textAppName(),
            ],
          )
        ],
      )
    );
  }

  // Fondo de la aplicacion
  Widget _backgroundCover(BuildContext context){
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.4,
      color: Colors.green,
    );
  }
  // Titulo de la aplicacion
  Widget _textAppName(){
    return Text(
      'Delivery App',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black
      ),
    );
  }
  // Textos de registro y crear cuenta
  Widget _textDontHaveAccount(){
    return Row(//Ubicar elementos uno al lado del otro (Horizontal)
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '¿No tenes cuenta?',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17
          ),
        ),
        SizedBox(width: 7),
        Text(
            'Registrate aca',
          style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 19
          ),
        )
      ],
    );
  }
  // Imagen del login
  Widget _imageCover(){
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 15),
        alignment: Alignment.topCenter,
        child: Image.asset(
          'assets/img/delivery.png',
          width: 130,
          height: 130,
        ),
      ),
    );
  }
}
