// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Produto _$ProdutoFromJson(Map<String, dynamic> json) {
  return Produto(
    produto_id: json['produto_id'] as int,
    nome: json['nome'] as String,
    produtor: json['produtor'] as String,
    preco: (json['preco'] as num)?.toDouble(),
    imagem: json['imagem'] as String,
    descricao: json['descricao'] as String,
    condicao: json['condicao'] as String,
    estoque: json['estoque'] as int,
    unidade: json['unidade'] as String,
    categorias: (json['categorias'] as List)?.map((e) => e as int)?.toList(),
    distribuicao: json['distribuicao'] as String,
  );
}

Map<String, dynamic> _$ProdutoToJson(Produto instance) => <String, dynamic>{
      'produto_id': instance.produto_id,
      'nome': instance.nome,
      'produtor': instance.produtor,
      'preco': instance.preco,
      'imagem': instance.imagem,
      'descricao': instance.descricao,
      'condicao': instance.condicao,
      'estoque': instance.estoque,
      'unidade': instance.unidade,
      'categorias': instance.categorias,
      'distribuicao': instance.distribuicao,
    };
