import 'package:flutter/material.dart';
import 'package:flutter_docig_venda/login/acesso.dart';
import 'package:flutter_docig_venda/login/textField.dart';



class LoginScreen extends StatelessWidget {
final TextEditingController usuarioController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                color: const Color.fromARGB(255, 0, 42, 77),
                height: 290,
                width: 290),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Entrar',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Leia(
              texto: 'Digite seu usuário',
              icone: Icons.email,
              dados: usuarioController,
            ),
            Leia(
              texto: 'Digite sua senha',
              icone: Icons.lock,
              dados: senhaController,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  String usuario = usuarioController.text;
                  String senha = senhaController.text;

                  FuncVerificacao(context , usuario, senha);
                  print('Acessar pressionado!');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 42, 77),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 170),
                ),
                child: Text(
                  'Acessar',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
