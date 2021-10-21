import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/dados_basicos.dart';
import 'package:prossumidor_v2/app/models/produto/produto_model.dart';

import 'interfaces/produto_detalhes_repository_interface.dart';

part 'produto_detalhes_repository.g.dart';

@Injectable()
class ProdutoDetalhesRepository implements IProdutoDetalhesRepository {
  Dio dio;
  ProdutoDetalhesRepository() {
    BaseOptions options = BaseOptions(
      receiveDataWhenStatusError: true,
      connectTimeout: 60 * 1000, // 20 seconds
      receiveTimeout: 60 * 1000, // 20 seconds
    );

    dio = Dio(options);
  }
  Response response;

  Future buscarProduto(int id) async {
    String link = Basicos.codifica("${Basicos.ip}/crud/?crud=consul113.$id");
    print("${Basicos.ip}/crud/?crud=consul113.$id");
    response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );
    // try {
    if (response.data != null && response.statusCode == 200) {
      var respondeDecoded =
          response.data.map<Produto>((json) => Produto.fromJson(json)).toList();
      return respondeDecoded[0];
    } else
      return null;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
