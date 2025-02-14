import 'package:flutter_docig_venda/home/listaDeProdutos.dart';

class Carrinho {
  final Map<Produto, int> _itens = {}; // 🔹 Mapa com Produto e Quantidade
  double desconto = 0.0; // 🔹 Desconto percentual aplicado ao carrinho

  // 🔹 Adiciona um produto ao carrinho
  void adicionarProduto(Produto produto) {
    if (_itens.containsKey(produto)) {
      _itens[produto] = _itens[produto]! + 1; // Aumenta a quantidade
    } else {
      _itens[produto] = 1; // Adiciona novo produto
    }
  }

  // 🔹 Remove um produto do carrinho
  void removerProduto(Produto produto) {
    if (_itens.containsKey(produto)) {
      if (_itens[produto]! > 1) {
        _itens[produto] = _itens[produto]! - 1; // Diminui a quantidade
      } else {
        _itens.remove(produto); // Remove do carrinho se for 0
      }
    }
  }

  // 🔹 Aplica desconto percentual ao total
  void aplicarDesconto(double percentual) {
    desconto = percentual;
  }

  // 🔹 Retorna o total SEM desconto
  double get totalSemDesconto {
    return _itens.entries.fold(0, (total, item) {
      return total + (item.key.valor * item.value);
    });
  }

  // 🔹 Retorna o total COM desconto
  double get totalComDesconto {
    return totalSemDesconto * (1 - desconto / 100);
  }

  // 🔹 Retorna a lista de produtos no carrinho
  Map<Produto, int> get itens => _itens;
}
