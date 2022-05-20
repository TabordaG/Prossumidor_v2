// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chat _$ChatFromJson(Map<String, dynamic> json) => Chat(
      id: json['id'] as int?,
      mensagem: json['mensagem'] as String?,
      situacao: json['situacao'] as String?,
      status: json['status'] as String?,
      data_envio: json['data_envio'] == null
          ? null
          : DateTime.parse(json['data_envio'] as String),
      data_leitura: json['data_leitura'] == null
          ? null
          : DateTime.parse(json['data_leitura'] as String),
      id_cliente_id: json['id_cliente_id'] as int?,
      nome_razao_social: json['nome_razao_social'] as String?,
      id_empresa_id: json['id_empresa_id'] as int?,
      razao_social: json['razao_social'] as String?,
    );

Map<String, dynamic> _$ChatToJson(Chat instance) => <String, dynamic>{
      'id': instance.id,
      'mensagem': instance.mensagem,
      'situacao': instance.situacao,
      'status': instance.status,
      'data_envio': instance.data_envio?.toIso8601String(),
      'data_leitura': instance.data_leitura?.toIso8601String(),
      'id_cliente_id': instance.id_cliente_id,
      'nome_razao_social': instance.nome_razao_social,
      'id_empresa_id': instance.id_empresa_id,
      'razao_social': instance.razao_social,
    };
