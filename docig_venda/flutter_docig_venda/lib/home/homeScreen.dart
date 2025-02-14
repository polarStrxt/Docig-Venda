import 'package:flutter/material.dart';
import 'package:flutter_docig_venda/home/cadrastroScreen.dart';
import 'package:flutter_docig_venda/home/perfilCriente.dart';
import 'package:flutter_docig_venda/home/listaDeCliente.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Docig Venda")),
      body: SingleChildScrollView( // Fechamento do SingleChildScrollView
        child: Column( // A Column precisa de um child
          mainAxisAlignment: MainAxisAlignment.start,
          children: gerarListaClientes(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CadrastroScreen()),
          );
        },
        child: Icon(Icons.app_registration),
      ),
    );
  }

  List<Widget> gerarListaClientes() {
    return listaClientes.map((cliente) => ClientePerfil(cliente: cliente)).toList();
  }
}