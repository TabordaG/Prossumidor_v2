// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categoria_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Categoria _$CategoriaFromJson(Map<String, dynamic> json) {
  return Categoria(
    data_registro: json['data_registro'] == null
        ? null
        : DateTime.parse(json['data_registro'] as String),
    id: json['id'] as int,
    descricao: json['descricao'] as String,
    data_alteracao: json['data_alteracao'] == null
        ? null
        : DateTime.parse(json['data_alteracao'] as String),
    empresa_id: json['empresa_id'] as int,
    obs: json['obs'] as String,
    imagem_cat: json['imagem_cat'] as List,
  );
}

Map<String, dynamic> _$CategoriaToJson(Categoria instance) => <String, dynamic>{
      'data_registro': instance.data_registro?.toIso8601String(),
      'id': instance.id,
      'descricao': instance.descricao,
      'data_alteracao': instance.data_alteracao?.toIso8601String(),
      'empresa_id': instance.empresa_id,
      'obs': instance.obs,
      'imagem_cat': instance.imagem_cat,
    };

CategoriaProduto _$CategoriaProdutoFromJson(Map<String, dynamic> json) {
  return CategoriaProduto(
    categoria: json['categoria'] == null
        ? null
        : Categoria.fromJson(json['categoria'] as Map<String, dynamic>),
    produtos: (json['produtos'] as List)
        ?.map((e) =>
            e == null ? null : Produto.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CategoriaProdutoToJson(CategoriaProduto instance) =>
    <String, dynamic>{
      'categoria': instance.categoria?.toJson(),
      'produtos': instance.produtos?.map((e) => e?.toJson())?.toList(),
    };
