import 'package:flutter/material.dart';
import 'package:flutter_docig_venda/home/listaDeCliente.dart';

class Infocliente extends StatelessWidget {
  final Cliente cliente;

  const Infocliente({Key? key, required this.cliente}) : super(key: key);

  Widget customContainer(String texto, IconData icone) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Informações do Cliente")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customContainer(cliente.nome, Icons.person),
              customContainer(cliente.telefone, Icons.phone),
              
              Row(
                children: [
                  Expanded(child: customContainer(cliente.rua, Icons.location_on)),
                  SizedBox(width: 8),
                  Expanded(child: customContainer(cliente.numero, Icons.house)),
                ],
              ),
              
              customContainer(cliente.complemento, Icons.info),
              
              Row(
                children: [
                  Expanded(child: customContainer(cliente.bairro, Icons.location_city)),
                  SizedBox(width: 8),
                  Expanded(child: customContainer(cliente.cidade, Icons.location_city)),
                  SizedBox(width: 8),
                  Expanded(child: customContainer(cliente.estado, Icons.flag)),
                ],
              ),
              
              customContainer(cliente.cep, Icons.map),
            ],
          ),
        ),
      ),
    );
  }
}