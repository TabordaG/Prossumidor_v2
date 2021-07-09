// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chat _$ChatFromJson(Map<String, dynamic> json) {
  return Chat(
    chat_id: json['chat_id'],
    nome: json['nome'],
  )
    ..lastMessage = json['lastMessage'] as String
    ..verify = json['verify'] as int
    ..data = json['data'] as String
    ..horas = json['horas'] as String;
}

Map<String, dynamic> _$ChatToJson(Chat instance) => <String, dynamic>{
      'chat_id': instance.chat_id,
      'nome': instance.nome,
      'lastMessage': instance.lastMessage,
      'verify': instance.verify,
      'data': instance.data,
      'horas': instance.horas,
    };
