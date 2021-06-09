// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Usuario _$UsuarioFromJson(Map<String, dynamic> json) {
  return Usuario(
    usuario_id: json['usuario_id'] as int,
    nome: json['nome'] as String,
    cpf: json['cpf'] as String,
    email: json['email'] as String,
    senha: json['senha'] as String,
    empresa_id: json['empresa_id'] as int,
  );
}

Map<String, dynamic> _$UsuarioToJson(Usuario instance) => <String, dynamic>{
      'usuario_id': instance.usuario_id,
      'nome': instance.nome,
      'cpf': instance.cpf,
      'email': instance.email,
      'senha': instance.senha,
      'empresa_id': instance.empresa_id,
    };
