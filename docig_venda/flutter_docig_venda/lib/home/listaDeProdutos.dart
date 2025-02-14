class Produto {
  String nome;
  String codigo;
  String descricao;
  double valor;

  Produto(this.nome, this.codigo, this.descricao, this.valor);
}

// 🔹 Lista Global de Produtos
List<Produto> listaProdutos = [
  Produto("Brigadeiro Gourmet", "BRG001", "Brigadeiro de chocolate belga com granulado de qualidade", 3.50),
  Produto("Bolo de Chocolate", "BLC002", "Bolo fofinho com cobertura de chocolate meio amargo", 45.90),
  Produto("Beijinho", "BJ003", "Docinho de coco com leite condensado e açúcar refinado", 2.99),
  Produto("Pudim de Leite", "PUD004", "Pudim clássico com calda de caramelo", 35.00),
  Produto("Trufa de Morango", "TRF005", "Chocolate recheado com ganache de morango", 6.50),
  Produto("Cupcake Red Velvet", "CPK006", "Cupcake aveludado com cobertura de cream cheese", 8.00),
  Produto("Brownie de Nozes", "BRW007", "Brownie cremoso com pedaços de nozes", 12.00),
  Produto("Alfajor Argentino", "ALF008", "Alfajor recheado com doce de leite e cobertura de chocolate", 9.90),
  Produto("Macaron de Framboesa", "MCR009", "Doce francês crocante por fora e cremoso por dentro", 5.50),
  Produto("Torta de Limão", "TRL010", "Massa crocante com recheio de limão e merengue", 49.90),
];
