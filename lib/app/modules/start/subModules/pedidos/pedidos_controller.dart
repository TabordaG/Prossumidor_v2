import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/models/pedidos/pedidos_model.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/pedidos/repositories/interfaces/pedidos_repository_interface.dart';
import 'package:prossumidor_v2/app/shared/auth/auth_controller.dart';

part 'pedidos_controller.g.dart';

@Injectable()
class PedidosController = _PedidosControllerBase with _$PedidosController;

abstract class _PedidosControllerBase with Store {
  final AuthController authController = Modular.get<AuthController>();
  final IPedidosRepository pedidosRepository =
      Modular.get<IPedidosRepository>();
  _PedidosControllerBase() {
    chamarLista();
  }

  @observable
  List<Pedidos> pedidosList = [];

  @action
  chamarLista() async {
    List list = await pedidosRepository.listaPedidos(authController.usuario.id);
    print(list.first);
    // List lista = await formataData(list);
    //if (lista != null) pedidosList = List.from(lista);
    print(pedidosList.length);
    //print(lista.first.data_registro);
  }
}
