import 'package:flutter/material.dart';
import 'package:flutter_docig_venda/login/textField.dart';

class CadrastroScreen extends StatelessWidget {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController ruaController = TextEditingController();
  final TextEditingController numeroController = TextEditingController();
  final TextEditingController complementoController = TextEditingController();
  final TextEditingController bairroController = TextEditingController();
  final TextEditingController cidadeController = TextEditingController();
  final TextEditingController estadoController = TextEditingController();
  final TextEditingController cepController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cadastro de Cliente")),
      body: SingleChildScrollView( // Adicionado para evitar overflow
        child: Padding(
          padding: const EdgeInsets.all(16.0), 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Leia(texto: 'Nome', icone: Icons.abc, dados: nomeController),
              Leia(texto: 'Telefone (DDD) 9999-9999', icone: Icons.numbers, dados: telefoneController),
              
              Row(
                children: [
                  Expanded(child: Leia(texto: 'Rua', icone: Icons.location_on, dados: ruaController)),
                  SizedBox(width: 8), // Espaço entre os campos
                  Expanded(child: Leia(texto: 'Número', icone: Icons.house, dados: numeroController)),
                ],
              ),

              Leia(texto: 'Complemento', icone: Icons.info, dados: complementoController),
              
              Row(
                children: [
                  Expanded(child: Leia(texto: 'Bairro', icone: Icons.location_city, dados: bairroController)),
                  SizedBox(width: 8),
                  Expanded(child: Leia(texto: 'Cidade', icone: Icons.location_city, dados: cidadeController)),
                  SizedBox(width: 8),
                  Expanded(child: Leia(texto: 'Estado', icone: Icons.flag, dados: estadoController)),
                ],
              ),

              Leia(texto: 'CEP', icone: Icons.map, dados: cepController),
            ],
          ),
        ),
      ),
    );
  }
}
