// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Messages _$MessagesFromJson(Map<String, dynamic> json) {
  return Messages(
    messages_id: json['messages_id'] as int,
  )
    ..nome = json['nome'] as String
    ..lastMessage = json['lastMessage'] as String
    ..verify = json['verify'] as int
    ..data = json['data'] as String
    ..horas = json['horas'] as String;
}

Map<String, dynamic> _$MessagesToJson(Messages instance) => <String, dynamic>{
      'messages_id': instance.messages_id,
      'nome': instance.nome,
      'lastMessage': instance.lastMessage,
      'verify': instance.verify,
      'data': instance.data,
      'horas': instance.horas,
    };
