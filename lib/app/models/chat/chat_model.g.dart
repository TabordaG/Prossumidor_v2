// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chat _$ChatFromJson(Map<String, dynamic> json) {
  return Chat(
    chat_id: json['chat_id'] as int,
    mensagem: json['mensagem'] as String,
    situacao: json['situacao'] as String,
    status: json['status'] as String,
    data_envio: json['data_envio'] == null
        ? null
        : DateTime.parse(json['data_envio'] as String),
    data_leitura: json['data_leitura'] == null
        ? null
        : DateTime.parse(json['data_leitura'] as String),
    id_cliente: json['id_cliente'] as int,
    id_empresa: json['id_empresa'] as int,
    nome_empresa: json['nome_empresa'] as String,
  );
}

Map<String, dynamic> _$ChatToJson(Chat instance) => <String, dynamic>{
      'chat_id': instance.chat_id,
      'mensagem': instance.mensagem,
      'situacao': instance.situacao,
      'status': instance.status,
      'data_envio': instance.data_envio?.toIso8601String(),
      'data_leitura': instance.data_leitura?.toIso8601String(),
      'id_cliente': instance.id_cliente,
      'id_empresa': instance.id_empresa,
      'nome_empresa': instance.nome_empresa,
    };
