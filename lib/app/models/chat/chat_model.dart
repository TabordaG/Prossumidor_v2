import 'package:json_annotation/json_annotation.dart';

part 'chat_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Chat {
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  int chat_id;
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
  int id_cliente;
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  int id_empresa;
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  String nome_empresa;

  Chat({
    // ignore: non_constant_identifier_names
    this.chat_id,
    this.mensagem,
    this.situacao,
    this.status,
    // ignore: non_constant_identifier_names
    this.data_envio,
    // ignore: non_constant_identifier_names
    this.data_leitura,
    // ignore: non_constant_identifier_names
    this.id_cliente,
    // ignore: non_constant_identifier_names
    this.id_empresa,
    // ignore: non_constant_identifier_names
    this.nome_empresa,
  });

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);

  Map<String, dynamic> toJson() => _$ChatToJson(this);
}
