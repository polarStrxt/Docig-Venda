import 'package:flutter/material.dart';
import 'package:flutter_docig_venda/home/listaDupricata.dart';

class CustomContainer extends StatelessWidget {
  final String texto;
  final IconData icone;

  const CustomContainer({Key? key, required this.texto, required this.icone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icone, color: Colors.blueGrey),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              texto,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class MeuCard extends StatelessWidget {
  final Dupricata dupricata; // 🔹 Agora recebe um objeto Cnpj

  const MeuCard({Key? key, required this.dupricata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // 🔹 Melhor organização
        children: [
          CustomContainer(texto: "Numero: ${dupricata.nome}", icone: Icons.person),
          CustomContainer(texto: "Vencimento: ${dupricata.vencimento}", icone: Icons.event),
          CustomContainer(texto: "Valor: R\$ ${dupricata.valor.toStringAsFixed(2)}", icone: Icons.attach_money),
        ],
      ),
    );
  }
}