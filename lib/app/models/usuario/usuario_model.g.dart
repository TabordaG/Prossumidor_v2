// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Usuario _$UsuarioFromJson(Map<String, dynamic> json) {
  return Usuario(
    id: json['id'] as int,
    cpf_cnpj: json['cpf_cnpj'] as String,
    rg_inscricao_estadual: json['rg_inscricao_estadual'] as String,
    data_alteracao: json['data_alteracao'] as String,
    data_nascimento_fundacao: json['data_nascimento_fundacao'] as String,
    data_registro: json['data_registro'] as String,
    inscricao_municipal: json['inscricao_municipal'] as String,
    nome_fantasia: json['nome_fantasia'] as String,
    model_template: json['model_template'] as String,
    nome_razao_social: json['nome_razao_social'] as String,
    sobre_nome: json['sobre_nome'] as String,
    estado_civil: json['estado_civil'] as String,
    empresa_id: json['empresa_id'] as int,
    local_retirada_id: json['local_retirada_id'] as int,
    observacoes: json['observacoes'] as String,
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
    email: json['email'] as String,
    senha: json['senha'] as String,
  );
}

Map<String, dynamic> _$UsuarioToJson(Usuario instance) => <String, dynamic>{
      'empresa_id': instance.empresa_id,
      'local_retirada_id': instance.local_retirada_id,
      'id': instance.id,
      'sobre_nome': instance.sobre_nome,
      'nome_razao_social': instance.nome_razao_social,
      'nome_fantasia': instance.nome_fantasia,
      'cpf_cnpj': instance.cpf_cnpj,
      'rg_inscricao_estadual': instance.rg_inscricao_estadual,
      'model_template': instance.model_template,
      'data_registro': instance.data_registro,
      'data_alteracao': instance.data_alteracao,
      'data_nascimento_fundacao': instance.data_nascimento_fundacao,
      'inscricao_municipal': instance.inscricao_municipal,
      'estado_civil': instance.estado_civil,
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
      'senha': instance.senha,
      'observacoes': instance.observacoes,
    };
