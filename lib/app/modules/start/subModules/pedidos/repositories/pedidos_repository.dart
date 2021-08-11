import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/models/pedidos/pedidos_model.dart';

import '../../../../../dados_basicos.dart';
import 'interfaces/pedidos_repository_interface.dart';

part 'pedidos_repository.g.dart';

@Injectable()
class PedidosRepository implements IPedidosRepository {
  Dio dio;
  PedidosRepository() {
    BaseOptions options = BaseOptions(
      receiveDataWhenStatusError: true,
      connectTimeout: 10 * 1000, // 10 seconds
      receiveTimeout: 10 * 1000, // 10 seconds
    );

    dio = Dio(options);
  }
  Response response;

  @override
  Future<List> listaPedidos(int id) async {
    String link = Basicos.codifica(
        "${Basicos.ip}/crud/?crud=consult14.$id,10,${Basicos.offset}");

    response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );
    if (response.data != null && response.statusCode == 200) {
      try {
        // List<Pedidos> list =
        return await response.data
            .map((item) => Pedidos.fromJson(item))
            .toList();
        //List<Pedidos> novaLista = [];
        /*for (var i = 0; i < list.length; i++) {
          if (list[i].observacoes_entrega.toString() == ' ')
            list[i].observacoes_entrega = '0';
          novaLista.add(list[i]);
        }*/
        // return list;
      } catch (e) {
        return null;
      }
    } else
      return null;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
