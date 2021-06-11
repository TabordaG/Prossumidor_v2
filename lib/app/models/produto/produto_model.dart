import 'package:json_annotation/json_annotation.dart';

part 'produto_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Produto {
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  int produto_id;
  @JsonKey(required: false, disallowNullValue: false)
  String nome;
  @JsonKey(required: false, disallowNullValue: false)
  String produtor;
  @JsonKey(required: false, disallowNullValue: false)
  double preco;
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
  List<int> categorias;
  @JsonKey(required: false, disallowNullValue: false)
  String distribuicao;

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
    this.categorias,
    this.distribuicao,
  });

  factory Produto.fromJson(Map<String, dynamic> json) =>
      _$ProdutoFromJson(json);

  Map<String, dynamic> toJson() => _$ProdutoToJson(this);
}
