import 'package:json_annotation/json_annotation.dart';
import 'package:prossumidor_v2/app/models/produto/produto_model.dart';

part 'pedidos_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Pedidos {
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  int pedidos_id;
  @JsonKey(required: false, disallowNullValue: false)
  String fornecedor;
  @JsonKey(required: false, disallowNullValue: false)
  int itens;
  @JsonKey(required: false, disallowNullValue: false)
  String data;
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  String tipo_entrega;
  @JsonKey(required: false, disallowNullValue: false)
  double frete;
  @JsonKey(required: false, disallowNullValue: false)
  String situacao;
  @JsonKey(required: false, disallowNullValue: false)
  String pagamento;
  @JsonKey(required: false, disallowNullValue: false)
  double total;
  @JsonKey(required: false, disallowNullValue: false)
  List<ProdutoPedido> produtos;

  Pedidos({
    // ignore: non_constant_identifier_names
    this.pedidos_id,
    this.fornecedor,
    this.itens,
    this.data,
    // ignore: non_constant_identifier_names
    this.tipo_entrega,
    this.frete,
    this.pagamento,
    this.situacao,
    this.total,
    this.produtos,
  });

  factory Pedidos.fromJson(Map<String, dynamic> json) =>
      _$PedidosFromJson(json);

  Map<String, dynamic> toJson() => _$PedidosToJson(this);
}
