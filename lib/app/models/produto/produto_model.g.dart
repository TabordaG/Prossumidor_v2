// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Produto _$ProdutoFromJson(Map<String, dynamic> json) {
  return Produto(
    produto_id: json['id'] as int,
    nome: json['descricao_simplificada'] as String,
    produtor: json['empresa'] as String,
    preco: json['valor_unitario'] as String,
    imagem: json['imagem'] as String,
    descricao: json['descricao'] as String,
    condicao: json['condicao'] as String,
    estoque: json['estoque'] as int,
    unidade: json['unidade'] as String,
    quantidade: json['quantidade'] as String,
    categorias: (json['categorias'] as List)?.map((e) => e as int)?.toList(),
    distribuicao: json['distribuicao'] as String,
    status: json['status'] as String,
    preco_venda: json['preco_venda'] as String,
  );
}

Map<String, dynamic> _$ProdutoToJson(Produto instance) => <String, dynamic>{
      'id': instance.produto_id,
      'descricao_simplificada': instance.nome,
      'empresa': instance.produtor,
      'valor_unitario': instance.preco,
      'imagem': instance.imagem,
      'descricao': instance.descricao,
      'condicao': instance.condicao,
      'estoque': instance.estoque,
      'unidade': instance.unidade,
      'quantidade': instance.quantidade,
      'categorias': instance.categorias,
      'distribuicao': instance.distribuicao,
      'status': instance.status,
      'preco_venda': instance.preco_venda,
    };

ProdutoPedido _$ProdutoPedidoFromJson(Map<String, dynamic> json) {
  return ProdutoPedido(
    produto: json['produto'] == null
        ? null
        : Produto.fromJson(json['produto'] as Map<String, dynamic>),
    quantidade: (json['quantidade'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ProdutoPedidoToJson(ProdutoPedido instance) =>
    <String, dynamic>{
      'produto': instance.produto?.toJson(),
      'quantidade': instance.quantidade,
    };
