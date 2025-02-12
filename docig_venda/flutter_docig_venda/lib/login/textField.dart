import 'package:flutter/material.dart';

class Leia extends StatelessWidget {
  final String texto;
  final IconData icone; 
final TextEditingController dados;
  
  const Leia({
    required this.texto,
    required this.icone,
    required this.dados,
    
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextField(
        controller: dados,
        decoration: InputDecoration(
          labelText: texto,
          border: OutlineInputBorder(),
          prefixIcon: Icon(icone),
        ),
      ),
    );
  }
}

