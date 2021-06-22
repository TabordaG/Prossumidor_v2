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
    rg: json['rg'] as String,
    telefone: json['telefone'] as String,
    celular: json['celular'] as String,
    contato: json['contato'] as String,
    status: json['status'] as String,
    endereco: json['endereco'] as String,
    bairro: json['bairro'] as String,
    cidade: json['cidade'] as String,
    cep: json['cep'] as String,
    estado: json['estado'] as String,
    sexo: json['sexo'] as String,
    pessoa: json['pessoa'] as String,
    numero: json['numero'] as String,
    complemento: json['complemento'] as String,
    estado_civil: json['estado_civil'] as String,
    email: json['email'] as String,
    senha: json['senha'] as String,
    empresa_id: json['empresa_id'] as int,
  );
}

Map<String, dynamic> _$UsuarioToJson(Usuario instance) => <String, dynamic>{
      'usuario_id': instance.usuario_id,
      'nome': instance.nome,
      'cpf': instance.cpf,
      'rg': instance.rg,
      'telefone': instance.telefone,
      'celular': instance.celular,
      'contato': instance.contato,
      'email': instance.email,
      'status': instance.status,
      'endereco': instance.endereco,
      'bairro': instance.bairro,
      'cidade': instance.cidade,
      'cep': instance.cep,
      'estado': instance.estado,
      'sexo': instance.sexo,
      'pessoa': instance.pessoa,
      'numero': instance.numero,
      'complemento': instance.complemento,
      'estado_civil': instance.estado_civil,
      'senha': instance.senha,
      'empresa_id': instance.empresa_id,
    };
