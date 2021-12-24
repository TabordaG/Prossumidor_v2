// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marca_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Marca _$MarcaFromJson(Map<String, dynamic> json) {
  return Marca(
    id: json['id'] as int,
    descricao: json['descricao'] as String,
    selecionado: json['selecionado'] as bool ?? false,
  );
}

Map<String, dynamic> _$MarcaToJson(Marca instance) => <String, dynamic>{
      'id': instance.id,
      'descricao': instance.descricao,
      'selecionado': instance.selecionado,
    };

MarcaProduto _$MarcaProdutoFromJson(Map<String, dynamic> json) {
  return MarcaProduto(
    marca: json['marca'] == null
        ? null
        : Marca.fromJson(json['marca'] as Map<String, dynamic>),
    produtos: (json['produtos'] as List)
        ?.map((e) =>
            e == null ? null : Produto.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MarcaProdutoToJson(MarcaProduto instance) =>
    <String, dynamic>{
      'marca': instance.marca?.toJson(),
      'produtos': instance.produtos?.map((e) => e?.toJson())?.toList(),
    };
