// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Produto _$ProdutoFromJson(Map<String, dynamic> json) {
  return Produto(
    id: json['id'] as int,
    descricao_simplificada: json['descricao_simplificada'] as String,
    marca_produto_id: json['marca_produto_id'] as int,
    preco_venda: json['preco_venda'] as String,
    imagem: json['imagem'] as String,
    descricao: json['descricao'] as String,
    descricao_completa: json['descricao_completa'] as String,
    estoque_atual: json['estoque_atual'] as String,
    unidade_medida: json['unidade_medida'] as String,
    marketing: json['marketing'] as String,
    marca: json['marca'] as String,
    observacoes: json['observacoes'] as String,
    quantidade: json['quantidade'] as String,
    empresa_id: json['empresa_id'] as int,
    status: json['status'] as String,
    carrinhoid: json['carrinhoid'] as int,
  );
}

Map<String, dynamic> _$ProdutoToJson(Produto instance) => <String, dynamic>{
      'id': instance.id,
      'descricao_simplificada': instance.descricao_simplificada,
      'marca_produto_id': instance.marca_produto_id,
      'preco_venda': instance.preco_venda,
      'imagem': instance.imagem,
      'descricao_completa': instance.descricao_completa,
      'descricao': instance.descricao,
      'estoque_atual': instance.estoque_atual,
      'unidade_medida': instance.unidade_medida,
      'marketing': instance.marketing,
      'observacoes': instance.observacoes,
      'marca': instance.marca,
      'quantidade': instance.quantidade,
      'empresa_id': instance.empresa_id,
      'status': instance.status,
      'carrinhoid': instance.carrinhoid,
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
