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
  String rg;
  @JsonKey(required: false, disallowNullValue: false)
  String telefone;
  @JsonKey(required: false, disallowNullValue: false)
  String celular;
  @JsonKey(required: false, disallowNullValue: false)
  String contato;
  @JsonKey(required: false, disallowNullValue: false)
  String email;
  @JsonKey(required: false, disallowNullValue: false)
  String status;
  @JsonKey(required: false, disallowNullValue: false)
  String endereco;
  @JsonKey(required: false, disallowNullValue: false)
  String bairro;
  @JsonKey(required: false, disallowNullValue: false)
  String cidade;
  @JsonKey(required: false, disallowNullValue: false)
  String cep;
  @JsonKey(required: false, disallowNullValue: false)
  String estado;
  @JsonKey(required: false, disallowNullValue: false)
  String sexo;
  @JsonKey(required: false, disallowNullValue: false)
  String pessoa;
  @JsonKey(required: false, disallowNullValue: false)
  String numero;
  @JsonKey(required: false, disallowNullValue: false)
  String complemento;
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  String estado_civil;
  @JsonKey(required: false, disallowNullValue: false)
  String senha;
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  int empresa_id;
  @JsonKey(required: false, disallowNullValue: false)
  String empresa;
  

  Usuario({
    // ignore: non_constant_identifier_names
    this.usuario_id,
    this.nome,
    this.cpf,
    this.rg,
    this.telefone,
    this.celular,
    this.contato,
    this.status,
    this.endereco,
    this.bairro,
    this.cidade,
    this.cep,
    this.estado,
    this.sexo,
    this.pessoa,
    this.numero,
    this.complemento,
    // ignore: non_constant_identifier_names
    this.estado_civil,
    this.email,
    this.senha,
    // ignore: non_constant_identifier_names
    this.empresa_id,
    this.empresa
  });

  factory Usuario.fromJson(Map<String, dynamic> json) =>
      _$UsuarioFromJson(json);

  Map<String, dynamic> toJson() => _$UsuarioToJson(this);
}
