import 'package:flutter/material.dart';
import 'package:flutter_docig_venda/home/cardDupricata.dart';
import 'package:flutter_docig_venda/home/listaDupricata.dart';

class DuplicataScreen extends StatelessWidget {
  final Dupricata dupricata; // 🔹 Agora recebe um objeto Cnpj

  const DuplicataScreen({Key? key, required this.dupricata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Duplicatas")),
      body: SingleChildScrollView( // Permite rolar a tela
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            MeuCard(dupricata: dupricata),
            MeuCard(dupricata: listaCnpj[1]),
            MeuCard(dupricata: listaCnpj[2]),
          ],
        ),
      ),
    );
  }
}
