import 'package:json_annotation/json_annotation.dart';
import 'package:prossumidor_v2/app/models/produto/produto_model.dart';

part 'categoria_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Categoria {
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  DateTime data_registro;
  @JsonKey(required: false, disallowNullValue: false)
  int id;
  @JsonKey(required: false, disallowNullValue: false)
  String descricao;
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  DateTime data_alteracao;
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  int empresa_id;
  @JsonKey(required: false, disallowNullValue: false)
  String obs;
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  List imagem_cat;
  @JsonKey(required: false, disallowNullValue: false, defaultValue: false)
  bool selecionado;

  Categoria({
    // ignore: non_constant_identifier_names
    this.data_registro,
    this.id,
    this.descricao,
    // ignore: non_constant_identifier_names
    this.data_alteracao,
    // ignore: non_constant_identifier_names
    this.empresa_id,
    this.obs,
    // ignore: non_constant_identifier_names
    this.imagem_cat,
    this.selecionado,
  });

  factory Categoria.fromJson(Map<String, dynamic> json) =>
      _$CategoriaFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CategoriaProduto {
  @JsonKey(required: false, disallowNullValue: false)
  Categoria categoria;
  @JsonKey(required: false, disallowNullValue: false)
  List<Produto> produtos;

  CategoriaProduto({
    this.categoria,
    this.produtos,
  });

  factory CategoriaProduto.fromJson(Map<String, dynamic> json) =>
      _$CategoriaProdutoFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriaProdutoToJson(this);
}
