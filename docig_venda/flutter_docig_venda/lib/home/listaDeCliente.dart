import 'package:flutter/material.dart';
import 'package:flutter_docig_venda/home/perfilCriente.dart';


class Cliente {
  String nome;
  String telefone;
  String rua;
  String numero;
  String complemento;
  String bairro;
  String cidade;
  String estado;
  String cep;
  String cnpj;

  Cliente(this.nome, this.telefone, this.rua, this.numero, this.complemento,
      this.bairro, this.cidade, this.estado, this.cep, this.cnpj );
}


Cliente cliente1 = Cliente(
  "Maria Oliveira", "(21) 99876-5432", "Rua das Flores", "250",
  "Casa 2", "Jardim América", "Rio de Janeiro", "RJ", "22041-001", "cnpj1",
);

Cliente cliente2 = Cliente(
  "Carlos Santos", "(31) 91234-5678", "Av. Brasil", "789",
  "Bloco B", "Savassi", "Belo Horizonte", "MG", "30112-970", "cnpj2",
);

Cliente cliente3 = Cliente(
  "Ana Souza", "(41) 92345-6789", "Rua XV de Novembro", "55",
  "Sala 301", "Centro", "Curitiba", "PR", "80020-310", "cnpj3",
);


List<Cliente> listaClientes = [cliente1, cliente2, cliente3];



List<Widget> gerarListaClientes() {
    return listaClientes.map((cliente) => ClientePerfil(cliente: cliente)).toList();
  }