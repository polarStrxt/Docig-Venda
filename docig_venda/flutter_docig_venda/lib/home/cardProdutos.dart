import 'package:flutter/material.dart';

class ProdutoDetalhe extends StatefulWidget {
  final String nome;
  final String codigo;
  final String descricao;
  final double valor;
  final String imagemUrl;

  const ProdutoDetalhe({
    Key? key,
    required this.nome,
    required this.codigo,
    required this.descricao,
    required this.valor,
    required this.imagemUrl,
  }) : super(key: key);

  @override
  _ProdutoDetalheState createState() => _ProdutoDetalheState();
}

class _ProdutoDetalheState extends State<ProdutoDetalhe> {
  int quantidadeSelecionada = 1; // 🔹 Estado da quantidade selecionada

  void adicionarAoCarrinho() {
    print("Produto adicionado: ${widget.nome}, Quantidade: $quantidadeSelecionada");
    // Aqui você pode adicionar a lógica para armazenar no carrinho
  }

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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Imagem do Produto
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(widget.imagemUrl), // 🔹 Exibe imagem do produto
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16), // Espaço entre imagem e informações
          
          // 🔹 Informações do Produto
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.nome, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("Código: ${widget.codigo}", style: TextStyle(fontSize: 14, color: Colors.grey)),
                Text(widget.descricao, style: TextStyle(fontSize: 14)),
                SizedBox(height: 8),
                Text("R\$ ${widget.valor.toStringAsFixed(2)}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green)),
                
                SizedBox(height: 8),

                // 🔹 Escolher Quantidade
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Quantidade:", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    DropdownButton<int>(
                      value: quantidadeSelecionada,
                      items: List.generate(10, (index) => index + 1)
                          .map((e) => DropdownMenuItem(value: e, child: Text("$e")))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          quantidadeSelecionada = value!;
                        });
                      },
                    ),
                  ],
                ),

                SizedBox(height: 8),

                // 🔹 Botão "Adicionar ao Carrinho"
                ElevatedButton(
                  onPressed: adicionarAoCarrinho,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_cart, color: Colors.white),
                      SizedBox(width: 8),
                      Text("Adicionar ao Carrinho", style: TextStyle(fontSize: 16, color: Colors.white)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
