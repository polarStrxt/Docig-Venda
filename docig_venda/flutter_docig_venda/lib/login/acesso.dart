import 'package:flutter/material.dart';
import 'package:flutter_docig_venda/home/homeScreen.dart';
import 'package:flutter_docig_venda/login/alert.dart';

List<String> loginList = ['tone:123', 'erick:erick124', 'victor:senha','adm:adm'];

void FuncVerificacao(BuildContext context, String user, String pass){

  String credenciais = '$user:$pass';

 if (loginList.contains(credenciais)) {
    print('Bem-vindo.');

    Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => HomeScreen()),
);
    
  } else {
    print('Usuário ou senha inválida.');

    mostrarAlertaErro(context);

  }
}
