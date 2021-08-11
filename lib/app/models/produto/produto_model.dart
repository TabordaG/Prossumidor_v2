import 'package:json_annotation/json_annotation.dart';

part 'produto_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Produto {
  @JsonKey(required: false, disallowNullValue: false, name: "id")
  // ignore: non_constant_identifier_names
  int produto_id;
  @JsonKey(
      required: false, disallowNullValue: false, name: "descricao_simplificada")
  String nome;
  @JsonKey(required: false, disallowNullValue: false, name: "empresa")
  String produtor;
  @JsonKey(required: false, disallowNullValue: false, name: "valor_unitario")
  String preco;
  @JsonKey(required: false, disallowNullValue: false)
  String imagem;
  @JsonKey(required: false, disallowNullValue: false)
  String descricao;
  @JsonKey(required: false, disallowNullValue: false)
  String condicao;
  @JsonKey(required: false, disallowNullValue: false)
  int estoque;
  @JsonKey(required: false, disallowNullValue: false)
  String unidade;
  @JsonKey(required: false, disallowNullValue: false)
  String quantidade;
  @JsonKey(required: false, disallowNullValue: false)
  List<int> categorias;
  @JsonKey(required: false, disallowNullValue: false)
  String distribuicao;
  @JsonKey(required: false, disallowNullValue: false)
  String status;
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  String preco_venda;

  Produto({
    // ignore: non_constant_identifier_names
    this.produto_id,
    this.nome,
    this.produtor,
    this.preco,
    this.imagem,
    this.descricao,
    this.condicao,
    this.estoque,
    this.unidade,
    this.quantidade,
    this.categorias,
    this.distribuicao,
    this.status,
    // ignore: non_constant_identifier_names
    this.preco_venda,
  });

  factory Produto.fromJson(Map<String, dynamic> json) =>
      _$ProdutoFromJson(json);

  Map<String, dynamic> toJson() => _$ProdutoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ProdutoPedido {
  @JsonKey(required: false, disallowNullValue: false)
  Produto produto;
  @JsonKey(required: false, disallowNullValue: false)
  double quantidade;

  ProdutoPedido({
    this.produto,
    this.quantidade,
  });

  factory ProdutoPedido.fromJson(Map<String, dynamic> json) =>
      _$ProdutoPedidoFromJson(json);

  Map<String, dynamic> toJson() => _$ProdutoPedidoToJson(this);
}
