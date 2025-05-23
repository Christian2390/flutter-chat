import 'package:chat/widgets/botonIngrese.dart';
import 'package:flutter/material.dart';

import 'package:chat/widgets/labels.dart';
import 'package:chat/widgets/logo.dart';
import 'package:chat/widgets/custom_input.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 162, 218, 187),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Logo(titulo: 'REGISTRO'),
                _Form(),
                Labels(
                  ruta: 'login',
                  titulo: '¿YA TIENES CUENTA?',
                  subTitulo: 'INGRESA AHORA!',
                ),
                Text(
                  'Terminos y Condiciones de Uso',
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<_Form> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
          CustomInput(
            icon: Icons.person_add,
            placeholder: 'Usuario',
            keyboardType: TextInputType.text,
            textController: nameCtrl,
          ),
          CustomInput(
            icon: Icons.mail_outline,
            placeholder: 'Correo',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Contraseña',
            textController: passCtrl,
            isPassword: true,
          ),

          BotonIngrese(
            text: 'Registrarse',
            onPressed: () {
              print(emailCtrl);
              print(passCtrl);
            },
          ),
        ],
      ),
    );
  }
}
