import 'package:json_annotation/json_annotation.dart';

part 'usuario_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Usuario {
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  int empresa_id;
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  int local_retirada_id;
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  int id;

  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  String sobre_nome;
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  String nome_razao_social;
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  String nome_fantasia;
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  String cpf_cnpj;
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  String rg_inscricao_estadual;
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  String model_template;
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  String data_registro;
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  String data_alteracao;
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  String data_nascimento_fundacao;
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  String inscricao_municipal;
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  String estado_civil;

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
  String senha;
  @JsonKey(required: false, disallowNullValue: false)
  String observacoes;

  Usuario(
      {this.id,
      // ignore: non_constant_identifier_names
      this.cpf_cnpj,
      // ignore: non_constant_identifier_names
      this.rg_inscricao_estadual,
      // ignore: non_constant_identifier_names
      this.data_alteracao,
      // ignore: non_constant_identifier_names
      this.data_nascimento_fundacao,
      // ignore: non_constant_identifier_names
      this.data_registro,
      // ignore: non_constant_identifier_names
      this.inscricao_municipal,
      // ignore: non_constant_identifier_names
      this.nome_fantasia,
      // ignore: non_constant_identifier_names
      this.model_template,
      // ignore: non_constant_identifier_names
      this.nome_razao_social,
      // ignore: non_constant_identifier_names
      this.sobre_nome,
      // ignore: non_constant_identifier_names
      this.estado_civil,
      // ignore: non_constant_identifier_names
      this.empresa_id,
      // ignore: non_constant_identifier_names
      this.local_retirada_id,
      this.observacoes,
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
      this.email,
      this.senha});

  factory Usuario.fromJson(Map<String, dynamic> json) =>
      _$UsuarioFromJson(json);

  Map<String, dynamic> toJson() => _$UsuarioToJson(this);
}
