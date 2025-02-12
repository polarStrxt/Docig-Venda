import 'package:flutter/material.dart';


void mostrarAlertaErro(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Erro de Login"),
        content: Text("Usuário ou senha incorretos. Tente novamente."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Fecha o alerta
            },
            child: Text("OK"),
          ),
        ],
      );
    },
  );
}