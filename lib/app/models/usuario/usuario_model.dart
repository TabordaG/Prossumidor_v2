import 'package:json_annotation/json_annotation.dart';

part 'usuario_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Usuario {
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  int usuario_id;
  @JsonKey(required: false, disallowNullValue: false)
  String nome;
  @JsonKey(required: false, disallowNullValue: false)
  String cpf;
  @JsonKey(required: false, disallowNullValue: false)
  String email;
  @JsonKey(required: false, disallowNullValue: false)
  String senha;
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  int empresa_id;

  Usuario({
    // ignore: non_constant_identifier_names
    this.usuario_id,
    this.nome,
    this.cpf,
    this.email,
    this.senha,
    // ignore: non_constant_identifier_names
    this.empresa_id,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) =>
      _$UsuarioFromJson(json);

  Map<String, dynamic> toJson() => _$UsuarioToJson(this);
}
