import 'package:flutter/material.dart';
import 'package:flutter_docig_venda/home/infoCliente.dart';
import 'package:flutter_docig_venda/home/listaDeCliente.dart';

class ClientePerfil extends StatelessWidget {
  final Cliente cliente; // Recebe um cliente

  const ClientePerfil({Key? key, required this.cliente}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: InkWell(
        onTap: () {
         Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => Infocliente(cliente: cliente)),
);
        },
        child: Container(
          width: screenWidth * 0.9,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
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
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    cliente.nome, // 🔹 Agora usa o cliente recebido como parâmetro
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    cliente.telefone,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                "${cliente.rua}, ${cliente.numero}, ${cliente.complemento}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
