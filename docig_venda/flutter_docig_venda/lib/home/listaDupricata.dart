class Dupricata {
  String nome;
  String vencimento;
  double valor;

  Dupricata({required this.nome, required this.vencimento, required this.valor});
}


Dupricata dpl1 = Dupricata(
  nome: "Empresa Alpha LTDA",
  vencimento: "15/03/2025",
  valor: 1500.75,
);

Dupricata dpl2 = Dupricata(
  nome: "Tech Solutions S.A.",
  vencimento: "20/04/2025",
  valor: 3200.00,
);

Dupricata dpl3 = Dupricata(
  nome: "Comércio Silva ME",
  vencimento: "10/05/2025",
  valor: 875.50,
);


List<Dupricata> listaCnpj = [dpl1, dpl2, dpl3];



