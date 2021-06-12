import 'package:json_annotation/json_annotation.dart';

part 'subcategoria_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Subcategoria {
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  int subcategoria_id;
  @JsonKey(required: false, disallowNullValue: false)
  String nome;
  @JsonKey(required: false, disallowNullValue: false, defaultValue: false)
  bool ativo;

  Subcategoria({
    // ignore: non_constant_identifier_names
    this.subcategoria_id,
    this.nome,
    this.ativo,
  });

  factory Subcategoria.fromJson(Map<String, dynamic> json) =>
      _$SubcategoriaFromJson(json);

  Map<String, dynamic> toJson() => _$SubcategoriaToJson(this);
}
