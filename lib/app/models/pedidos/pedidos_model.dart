import 'package:json_annotation/json_annotation.dart';
import 'package:prossumidor_v2/app/models/produto/produto_model.dart';

part 'pedidos_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Pedidos {
  @JsonKey(required: false, disallowNullValue: false)
  int id;
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  int id_empresa;
  @JsonKey(required: false, disallowNullValue: false)
  String empresa;
  @JsonKey(required: false, disallowNullValue: false)
  String quantidade;
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  DateTime data_registro;
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  String tipo_entrega;
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  String observacoes_entrega;
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  String status_pedido;
  @JsonKey(required: false, disallowNullValue: false)
  String pagamento;
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  String valor_total;
  @JsonKey(required: false, disallowNullValue: false)
  List<ProdutoPedido> produtos;

  Pedidos({
    // ignore: non_constant_identifier_names
    this.id,
    this.empresa,
    this.quantidade,
    // ignore: non_constant_identifier_names
    this.data_registro,
    // ignore: non_constant_identifier_names
    this.tipo_entrega,
    // ignore: non_constant_identifier_names
    this.observacoes_entrega,
    this.pagamento,
    // ignore: non_constant_identifier_names
    this.status_pedido,
    // ignore: non_constant_identifier_names
    this.valor_total,
    this.produtos,
  });

  factory Pedidos.fromJson(Map<String, dynamic> json) =>
      _$PedidosFromJson(json);

  Map<String, dynamic> toJson() => _$PedidosToJson(this);
}
