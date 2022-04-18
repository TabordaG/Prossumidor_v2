import 'package:prossumidor_v2/app/modules/start/subModules/pedidos/pedidosDetalhes_page.dart';

import 'repositories/pedidos_repository.dart';
import 'pedidos_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pedidos_page.dart';

class PedidosModule extends Module {
  @override
  final List<Bind> binds = [
    $PedidosRepository,
    $PedidosController,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => PedidosPage()),
    ChildRoute(
      '/detalhes',
      child: (_, args) => PedidosDetalhes(pedido: args.data["pedido"]),
      transition: TransitionType.rightToLeft,
    ),
  ];
}
