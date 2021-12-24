import 'package:json_annotation/json_annotation.dart';

part 'produto_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Produto {
  @JsonKey(required: false, disallowNullValue: false, name: "id")
  // ignore: non_constant_identifier_names
  int id;
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  String descricao_simplificada;
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  int marca_produto_id;
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  String preco_venda;
  @JsonKey(required: false, disallowNullValue: false)
  String imagem;
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  String descricao_completa;
  @JsonKey(required: false, disallowNullValue: false)
  String descricao;
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  String estoque_atual;
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  String unidade_medida;
  @JsonKey(required: false, disallowNullValue: false)
  String marketing;
  @JsonKey(required: false, disallowNullValue: false)
  String observacoes;
  @JsonKey(required: false, disallowNullValue: false)
  String marca;
  @JsonKey(required: false, disallowNullValue: false)
  String quantidade;
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  int empresa_id;
  // @JsonKey(required: false, disallowNullValue: false)
  // List<int> categorias;
  // @JsonKey(required: false, disallowNullValue: false)
  // String distribuicao;
  @JsonKey(required: false, disallowNullValue: false)
  String status;
  @JsonKey(required: false, disallowNullValue: false)
  int carrinhoid;
  // @JsonKey(required: false, disallowNullValue: false)

  Produto({
    // ignore: non_constant_identifier_names
    this.id,
    // ignore: non_constant_identifier_names
    this.descricao_simplificada,
    // ignore: non_constant_identifier_names
    this.marca_produto_id,
    // ignore: non_constant_identifier_names
    this.preco_venda,
    this.imagem,
    this.descricao,
    // ignore: non_constant_identifier_names
    this.descricao_completa,
    // ignore: non_constant_identifier_names
    this.estoque_atual,
    // ignore: non_constant_identifier_names
    this.unidade_medida,
    this.marketing,
    this.marca,
    this.observacoes,
    this.quantidade,
    // ignore: non_constant_identifier_names
    this.empresa_id,
    // this.categorias,
    // this.distribuicao,
    this.status,
    this.carrinhoid,
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
