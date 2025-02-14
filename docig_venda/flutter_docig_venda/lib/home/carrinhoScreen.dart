import 'package:flutter/material.dart';
import 'package:flutter_docig_venda/home/carrinho.dart';
import 'package:flutter_docig_venda/home/listaDeProdutos.dart';

class CarrinhoScreen extends StatefulWidget {
  final Carrinho carrinho; // 🔹 Recebe um carrinho individual

  const CarrinhoScreen({Key? key, required this.carrinho}) : super(key: key);

  @override
  _CarrinhoScreenState createState() => _CarrinhoScreenState();
}

class _CarrinhoScreenState extends State<CarrinhoScreen> {
  TextEditingController descontoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Carrinho de Compras")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget.carrinho.itens.length,
                itemBuilder: (context, index) {
                  Produto produto = widget.carrinho.itens.keys.elementAt(index);
                  int quantidade = widget.carrinho.itens[produto]!;

                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(produto.nome, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            Text("Código: ${produto.codigo}", style: TextStyle(color: Colors.grey)),
                            Text("Preço: R\$ ${produto.valor.toStringAsFixed(2)}"),
                            Text("Quantidade: $quantidade"),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  widget.carrinho.removerProduto(produto);
                                });
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  widget.carrinho.adicionarProduto(produto);
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            
            // 🔹 Campo de Desconto
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                controller: descontoController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Desconto (%)",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            
            // 🔹 Botão para aplicar desconto
            ElevatedButton(
              onPressed: () {
                setState(() {
                  double desconto = double.tryParse(descontoController.text) ?? 0;
                  widget.carrinho.aplicarDesconto(desconto);
                });
              },
              child: Text("Aplicar Desconto"),
            ),

            // 🔹 Exibição dos Totais
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Total sem desconto: R\$ ${widget.carrinho.totalSemDesconto.toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text("Desconto aplicado: ${widget.carrinho.desconto.toStringAsFixed(2)}%",
                    style: TextStyle(fontSize: 16, color: Colors.green)),
                Text("Total com desconto: R\$ ${widget.carrinho.totalComDesconto.toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)),
              ],
            ),

            SizedBox(height: 20),

            // 🔹 Botão Finalizar Compra
            ElevatedButton(
              onPressed: () {
                print("Compra finalizada!");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: Text("Finalizar Compra", style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
