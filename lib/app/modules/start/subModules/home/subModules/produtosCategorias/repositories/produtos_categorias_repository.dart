import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/dados_basicos.dart';
import 'package:prossumidor_v2/app/models/produto/produto_model.dart';
import 'package:prossumidor_v2/app/models/subcategoria/subcategoria_model.dart';

import 'interfaces/produtos_categorias_repository_interface.dart';

part 'produtos_categorias_repository.g.dart';

@Injectable()
class ProdutosCategoriasRepository implements IProdutosCategoriasRepository {
  Dio dio;

  ProdutosCategoriasRepository() {
    BaseOptions options = BaseOptions(
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000, // 20 seconds
      receiveTimeout: 20 * 1000, // 20 seconds
    );

    dio = Dio(options);
  }
  Response response;

  @override
  Future listaProdutosPorCategoria(int id, int offset) async {
    String link =
        Basicos.codifica("${Basicos.ip}/crud/?crud=consul117.$id,$offset");

    response = await dio.get(
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
      print(respondeDecoded);
      return respondeDecoded;
    } else
      return null;
  }

  @override
  Future listaProdutosPorMarca(int id, int offset) async {
    String link =
        Basicos.codifica("${Basicos.ip}/crud/?crud=consul118.$id,$offset");

    response = await dio.get(
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
      print(respondeDecoded);
      return respondeDecoded;
    } else
      return null;
  }

  @override
  Future listaCategoriasEmComum(
    int id,
  ) async {
    String link = Basicos.codifica("${Basicos.ip}/crud/?crud=consul119.$id");

    response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );
    // try {
    if (response.data != null && response.statusCode == 200) {
      var respondeDecoded = response.data
          .map<Subcategoria>((json) => Subcategoria(
                subcategoria_id: json['id_categoria'],
                nome: json['categoria'],
                ativo: false,
              ))
          .toList(); // Basicos.decodifica(response.data);
      print(respondeDecoded);
      return respondeDecoded;
    } else
      return null;
  }

  @override
  Future<List<Produto>> listaProdutosEmComum(
    int id,
    List<int> categoriasIDs,
    int offset,
  ) async {
    String linkBase = "${Basicos.ip}/crud/?crud=consul120.$id,$offset";
    for (var item in categoriasIDs) {
      linkBase += ',$item';
    }
    print(linkBase);
    String link = Basicos.codifica(linkBase);

    response = await dio.get(
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
      print(respondeDecoded);
      return respondeDecoded;
    } else
      return null;
  }

  @override
  Future<List<Produto>> pesquisaProdutosMulticategorias(
    int id,
    List<int> categoriasIDs,
    String pesquisa,
    int offset,
  ) async {
    String linkBase =
        "${Basicos.ip}/crud/?crud=consul123.$id,$pesquisa,$offset";
    for (var item in categoriasIDs) {
      linkBase += ',$item';
    }
    print(linkBase);
    String link = Basicos.codifica(linkBase);

    response = await dio.get(
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
      print(respondeDecoded);
      return respondeDecoded;
    } else
      return null;
  }

  @override
  Future<List<Produto>> pesquisaProdutosCategoria(
    int id,
    String pesquisa,
    int offset,
  ) async {
    String linkBase =
        "${Basicos.ip}/crud/?crud=consul124.$id,$pesquisa,$offset";
    print(linkBase);
    String link = Basicos.codifica(linkBase);

    response = await dio.get(
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
      print(respondeDecoded);
      return respondeDecoded;
    } else
      return null;
  }

  @override
  Future<List<Produto>> pesquisaProdutosEmpreendimento(
    int id,
    String pesquisa,
    int offset,
  ) async {
    String linkBase =
        "${Basicos.ip}/crud/?crud=consul126.$id,$pesquisa,$offset";
    print(linkBase);
    String link = Basicos.codifica(linkBase);

    response = await dio.get(
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
      print(respondeDecoded);
      return respondeDecoded;
    } else
      return null;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
