import 'package:json_annotation/json_annotation.dart';
import 'package:prossumidor_v2/app/models/produto/produto_model.dart';

part 'marca_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Marca {
  @JsonKey(required: false, disallowNullValue: false)
  int id;
  @JsonKey(required: false, disallowNullValue: false)
  String descricao;
  @JsonKey(required: false, disallowNullValue: false, defaultValue: false)
  bool selecionado;

  Marca({
    this.id,
    this.descricao,
    this.selecionado,
  });

  factory Marca.fromJson(Map<String, dynamic> json) => _$MarcaFromJson(json);

  Map<String, dynamic> toJson() => _$MarcaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MarcaProduto {
  @JsonKey(required: false, disallowNullValue: false)
  Marca marca;
  @JsonKey(required: false, disallowNullValue: false)
  List<Produto> produtos;

  MarcaProduto({
    this.marca,
    this.produtos,
  });

  factory MarcaProduto.fromJson(Map<String, dynamic> json) =>
      _$MarcaProdutoFromJson(json);

  Map<String, dynamic> toJson() => _$MarcaProdutoToJson(this);
}
