import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/models/pedidos/pedidos_model.dart';
import 'package:prossumidor_v2/app/models/produto/produto_model.dart';

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

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Future<List<Pedidos>> listaPedidosNaoEntregue(int id) async {
    List<Pedidos> pedidos = [];

    String link = Basicos.codifica(
        "${Basicos.ip}/crud/?crud=consult26.${'EM ANDAMENTO'},$id,10,${Basicos.offset}");

    response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );
    if (response.data != null && response.statusCode == 200) {
      List list = response.data;

      try {
        list.forEach((item) {
          if (item['observacoes_entrega'].toString() == ' ')
            item['observacoes_entrega'] = '0';
          pedidos.add(Pedidos.fromJson(item));
        });
      } catch (e) {}
    }

    link = Basicos.codifica(
        "${Basicos.ip}/crud/?crud=consult26.${'CONCLUIDO NAO ENTREGUE'},$id,10,${Basicos.offset}");

    response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );
    if (response.data != null && response.statusCode == 200) {
      List list = response.data;

      try {
        list.forEach((item) {
          if (item['observacoes_entrega'].toString() == ' ')
            item['observacoes_entrega'] = '0';
          pedidos.add(Pedidos.fromJson(item));
        });
      } catch (e) {}
    }

    link = Basicos.codifica(
        "${Basicos.ip}/crud/?crud=consult26.${'CANCELADO'},$id,10,${Basicos.offset}");

    response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );
    if (response.data != null && response.statusCode == 200) {
      List list = response.data;

      try {
        list.forEach((item) {
          if (item['observacoes_entrega'].toString() == ' ')
            item['observacoes_entrega'] = '0';
          pedidos.add(Pedidos.fromJson(item));
        });
      } catch (e) {}
    }

    try {
      print('From Repository: ' + pedidos.length.toString());
      return pedidos;
    } catch (e) {
      print("Não enviou para o controller");
      return [];
    }
  }

  @override
  Future<List<Pedidos>> listaPedidosEntregue(int id) async {
    List<Pedidos> pedidos = [];

    String link = Basicos.codifica(
        "${Basicos.ip}/crud/?crud=consult26.${'CONCLUIDO ENTREGUE'},$id,10,${Basicos.offset}");

    response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );
    if (response.data != null && response.statusCode == 200) {
      print(response.data);
      try {
        pedidos.add(
          await response.data.map<Pedidos>((item) {
            if (item['observacoes_entrega'].toString() == ' ')
              item['observacoes_entrega'] = '0';
            return Pedidos.fromJson(item);
          }),
        );
      } catch (e) {}
    }

    return pedidos;
  }

  @override
  Future<List> listaProdutos(int id) async {
    String link = Basicos.codifica("${Basicos.ip}/crud/?crud=consult15.$id");

    response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );
    if (response.data != null && response.statusCode == 200) {
      var res = Basicos.decodifica(response.data);
      print(res);
      try {
        List list = await json.decode(res).cast<Map<String, dynamic>>();
        List produtos =
            list.map<Produto>((item) => Produto.fromJson(item)).toList();
        return produtos;
      } catch (e) {
        return [];
      }
    } else
      return [];
  }
}
