// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pedidos_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pedidos _$PedidosFromJson(Map<String, dynamic> json) => Pedidos(
      id: json['id'] as int?,
      empresa: json['empresa'] as String?,
      quantidade: json['quantidade'] as String?,
      data_registro: json['data_registro'] == null
          ? null
          : DateTime.parse(json['data_registro'] as String),
      tipo_entrega: json['tipo_entrega'] as String?,
      observacoes_entrega: json['observacoes_entrega'] as String?,
      pagamento: json['pagamento'] as String?,
      status_pedido: json['status_pedido'] as String?,
      valor_total: json['valor_total'] as String?,
      produtos: (json['produtos'] as List<dynamic>?)
          ?.map((e) => ProdutoPedido.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..id_empresa = json['id_empresa'] as int?;

Map<String, dynamic> _$PedidosToJson(Pedidos instance) => <String, dynamic>{
      'id': instance.id,
      'id_empresa': instance.id_empresa,
      'empresa': instance.empresa,
      'quantidade': instance.quantidade,
      'data_registro': instance.data_registro?.toIso8601String(),
      'tipo_entrega': instance.tipo_entrega,
      'observacoes_entrega': instance.observacoes_entrega,
      'status_pedido': instance.status_pedido,
      'pagamento': instance.pagamento,
      'valor_total': instance.valor_total,
      'produtos': instance.produtos?.map((e) => e.toJson()).toList(),
    };
