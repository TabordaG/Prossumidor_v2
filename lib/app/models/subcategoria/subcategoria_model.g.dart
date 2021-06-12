// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subcategoria_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Subcategoria _$SubcategoriaFromJson(Map<String, dynamic> json) {
  return Subcategoria(
    subcategoria_id: json['subcategoria_id'] as int,
    nome: json['nome'] as String,
    ativo: json['ativo'] as bool ?? false,
  );
}

Map<String, dynamic> _$SubcategoriaToJson(Subcategoria instance) =>
    <String, dynamic>{
      'subcategoria_id': instance.subcategoria_id,
      'nome': instance.nome,
      'ativo': instance.ativo,
    };
