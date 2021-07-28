// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pedidos_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pedidos _$PedidosFromJson(Map<String, dynamic> json) {
  return Pedidos(
    pedidos_id: json['pedidos_id'] as int,
    fornecedor: json['fornecedor'] as String,
    itens: json['itens'] as int,
    data: json['data'] as String,
    tipo_entrega: json['tipo_entrega'] as String,
    frete: (json['frete'] as num)?.toDouble(),
    pagamento: json['pagamento'] as String,
    situacao: json['situacao'] as String,
    total: (json['total'] as num)?.toDouble(),
    produtos: (json['produtos'] as List)
        ?.map((e) => e == null
            ? null
            : ProdutoPedido.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PedidosToJson(Pedidos instance) => <String, dynamic>{
      'pedidos_id': instance.pedidos_id,
      'fornecedor': instance.fornecedor,
      'itens': instance.itens,
      'data': instance.data,
      'tipo_entrega': instance.tipo_entrega,
      'frete': instance.frete,
      'situacao': instance.situacao,
      'pagamento': instance.pagamento,
      'total': instance.total,
      'produtos': instance.produtos?.map((e) => e?.toJson())?.toList(),
    };
