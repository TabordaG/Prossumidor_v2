import 'package:dio/dio.dart';
// import 'package:dio/native_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/dados_basicos.dart';
import 'package:prossumidor_v2/app/models/categoria/categoria_model.dart';
import 'package:prossumidor_v2/app/models/produto/produto_model.dart';

import 'interfaces/home_repository_interface.dart';

part 'home_repository.g.dart';

@Injectable()
class HomeRepository implements IHomeRepository {
  Dio dio;
  HomeRepository() {
    BaseOptions options = BaseOptions(
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000, // 20 seconds
      receiveTimeout: 20 * 1000, // 20 seconds
    );

    dio = Dio(options);
  }
  Response response;

  @override
  Future listaCategorias() async {
    String link = Basicos.codifica("${Basicos.ip}/crud/?crud=consul111.");

    response = await dio.get(
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
      print(respondeDecoded);
      return respondeDecoded;
    } else
      return null;
  }

  @override
  Future listaProdutosPorCategoria(int id) async {
    String link = Basicos.codifica("${Basicos.ip}/crud/?crud=consul112.$id");

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
