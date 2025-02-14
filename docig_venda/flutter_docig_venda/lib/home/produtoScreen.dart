import 'package:flutter/material.dart';
import 'package:flutter_docig_venda/home/cardProdutos.dart';
import 'package:flutter_docig_venda/home/listaDeProdutos.dart'; // 🔹 Importa a lista de produtos
import 'package:flutter_docig_venda/home/carrinho.dart';
import 'package:flutter_docig_venda/home/carrinhoScreen.dart';

class ProdutoScreen extends StatefulWidget {
  @override
  _ProdutoScreenState createState() => _ProdutoScreenState();
}

class _ProdutoScreenState extends State<ProdutoScreen> {
  TextEditingController searchController = TextEditingController();
  List<Produto> produtosFiltrados = [];
  final Carrinho carrinho = Carrinho(); // 🔹 Criando a instância do Carrinho

  @override
  void initState() {
    super.initState();
    produtosFiltrados = List.from(listaProdutos); // 🔹 Usa a lista importada
  }

  // 🔹 Função para filtrar produtos pelo nome ou código
  void filtrarProdutos(String query) {
    setState(() {
      produtosFiltrados = listaProdutos.where((produto) {
        return produto.nome.toLowerCase().contains(query.toLowerCase()) ||
               produto.codigo.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Docig Venda"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: filtrarProdutos,
              decoration: InputDecoration(
                hintText: "Pesquisar produto...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: produtosFiltrados.length,
        itemBuilder: (context, index) {
          Produto produto = produtosFiltrados[index];
          return ProdutoDetalhe(
            nome: produto.nome,
            codigo: produto.codigo,
            descricao: produto.descricao,
            valor: produto.valor,
            imagemUrl: "https://via.placeholder.com/150", // 🔹 Adicione URLs reais aqui
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CarrinhoScreen(carrinho: carrinho), // 🔹 Passando o carrinho corretamente
            ),
          );
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}
