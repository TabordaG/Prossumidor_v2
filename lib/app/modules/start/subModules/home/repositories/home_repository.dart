// ignore_for_file: empty_catches

import 'dart:convert';

import 'package:dio/dio.dart';
// import 'package:dio/native_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/dados_basicos.dart';
import 'package:prossumidor_v2/app/models/categoria/categoria_model.dart';
import 'package:prossumidor_v2/app/models/marca/marca_model.dart';
import 'package:prossumidor_v2/app/models/produto/produto_model.dart';

import 'interfaces/home_repository_interface.dart';

part 'home_repository.g.dart';

@Injectable()
class HomeRepository implements IHomeRepository {
  late Dio dio;
  HomeRepository() {
    BaseOptions options = BaseOptions(
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000, // 20 seconds
      receiveTimeout: 20 * 1000, // 20 seconds
    );

    dio = Dio(options);
  }

  @override
  Future listaCategorias(int? empresaId) async {
    String link =
        Basicos.codifica("${Basicos.ip}/crud/?crud=consul111.$empresaId");

    Response response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );
    // try {
    if (response.data != null && response.statusCode == 200) {
      var respondeDecoded = response.data
          .map<Categoria>((json) => Categoria.fromJson(json))
          .toList();
      // .cast<List<Categoria>>(); // cast<Map<String, dynamic>>();
      // List list = json.decode(response.data).cast<Map<String, dynamic>>();
      return respondeDecoded;
    } else {
      return null;
    }
  }

  @override
  Future listaProdutosPorCategoria(int? id, int? empresaId) async {
    String link = Basicos.codifica("${Basicos.ip}/crud/?crud=consul112.$id");

    Response response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );
    // try {
    if (response.data != null && response.statusCode == 200) {
      var respondeDecoded = response.data
          .map<Produto>((json) => Produto.fromJson(json))
          .toList(); // Basicos.decodifica(response.data);
      return respondeDecoded;
    } else {
      return null;
    }
  }

  @override
  Future listaProdutosPorMarca(int? id) async {
    String link = Basicos.codifica("${Basicos.ip}/crud/?crud=consul115.$id");

    Response response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );
    // try {
    if (response.data != null && response.statusCode == 200) {
      var respondeDecoded = response.data
          .map<Produto>((json) => Produto.fromJson(json))
          .toList(); // Basicos.decodifica(response.data);
      return respondeDecoded;
    } else {
      return null;
    }
  }

  @override
  Future listaMarcas(int? id) async {
    String link = Basicos.codifica("${Basicos.ip}/crud/?crud=consul114.$id");

    Response response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );
    // try {
    if (response.data != null && response.statusCode == 200) {
      var respondeDecoded =
          response.data.map<Marca>((json) => Marca.fromJson(json)).toList();
      // .cast<List<Categoria>>(); // cast<Map<String, dynamic>>();
      // List list = json.decode(response.data).cast<Map<String, dynamic>>();
      return respondeDecoded;
    } else {
      return null;
    }
  }

  @override
  Future pesquisarProduto(String? texto, int? offset) async {
    String link =
        Basicos.codifica("${Basicos.ip}/crud/?crud=consul116.$texto,$offset");

    Response response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );
    // try {
    if (response.data != null && response.statusCode == 200) {
      var respondeDecoded = response.data
          .map<Produto>((json) => Produto.fromJson(json))
          .toList(); // Basicos.decodifica(response.data);
      return respondeDecoded;
    } else {
      return null;
    }
  }

  @override
  Future buscaBanner() async {
    List bannerList = [];
    for (var i = 4; i < 14; i++) {
      String link = Basicos.codifica("${Basicos.ip}/crud/?crud=consul-30.$i");

      Response response = await dio.get(
        Uri.encodeFull(link),
        options: Options(
          headers: {"Accept": "application/json"},
        ),
      );
      // try {
      if (response.data != null && response.statusCode == 200) {
        try {
          var list = json
              .decode(Basicos.decodifica(response.data))
              .cast<Map<String, dynamic>>();
          if (list[0]["msg_notifica"] != null) {
            String image = list[0]["msg_notifica"].toString();
            bannerList.add(image);
          }
        } catch (e) {}
      }
    }
    return bannerList;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
