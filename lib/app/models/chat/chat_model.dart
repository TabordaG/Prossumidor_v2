import 'package:json_annotation/json_annotation.dart';

part 'chat_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Chat {
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  int id;
  @JsonKey(required: false, disallowNullValue: false)
  String mensagem;
  @JsonKey(required: false, disallowNullValue: false)
  String situacao;
  @JsonKey(required: false, disallowNullValue: false)
  String status;
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  DateTime data_envio;
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  DateTime data_leitura;
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  int id_cliente_id;
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  String nome_razao_social;
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  int id_empresa_id;
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  String razao_social;

  Chat({
    // ignore: non_constant_identifier_names
    this.id,
    this.mensagem,
    this.situacao,
    this.status,
    // ignore: non_constant_identifier_names
    this.data_envio,
    // ignore: non_constant_identifier_names
    this.data_leitura,
    // ignore: non_constant_identifier_names
    this.id_cliente_id,
    // ignore: non_constant_identifier_names
    this.nome_razao_social,
    // ignore: non_constant_identifier_names
    this.id_empresa_id,
    // ignore: non_constant_identifier_names
    this.razao_social,
  });

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);

  Map<String, dynamic> toJson() => _$ChatToJson(this);
}
