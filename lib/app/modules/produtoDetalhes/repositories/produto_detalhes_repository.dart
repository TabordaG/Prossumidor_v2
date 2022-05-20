import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/dados_basicos.dart';
import 'package:prossumidor_v2/app/models/produto/produto_model.dart';
import 'package:prossumidor_v2/app/models/categoria/categoria_model.dart';
import 'interfaces/produto_detalhes_repository_interface.dart';

part 'produto_detalhes_repository.g.dart';

@Injectable()
class ProdutoDetalhesRepository implements IProdutoDetalhesRepository {
  late Dio dio;
  ProdutoDetalhesRepository() {
    BaseOptions options = BaseOptions(
      receiveDataWhenStatusError: true,
      connectTimeout: 60 * 1000, // 20 seconds
      receiveTimeout: 60 * 1000, // 20 seconds
    );

    dio = Dio(options);
  }

  @override
  Future buscarProduto(int id) async {
    String link = Basicos.codifica("${Basicos.ip}/crud/?crud=consul113.$id");
    Response response = await dio.get(
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
    } else {
      return null;
    }
  }

  @override
  Future inserirProdutoCarrinho(int idProduto, int quantidade, int empresaId,
      double preco, int usuarioId) async {
    String link = Basicos.codifica("${Basicos.ip}/crud/?crud=consulta6."
        "01/01/2019," // data da venda quando pedido finalizado
        "ATIVO," //status do pedido no cesta
        "$preco," //valor do item
        "0.0 ," //desconto no item
        "$quantidade," // quantidade
        "APP," //observacoes do cesta
        "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}," //data modificação do cesta
        "$usuarioId," // id cliente
        "$empresaId," //id empresa
        "$idProduto");
    Response response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );
    // try {
    if (response.data != null && response.statusCode == 200) {
      return "sucesso";
    } else {
      return null;
    }
  }

  @override
  Future procurarProdutoCarrinho(int produtoId, int clienteId) async {
    String link = Basicos.codifica(
        "${Basicos.ip}/crud/?crud=consul121.$produtoId,$clienteId");
    Response response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );
    // try {
    if (response.data != null &&
        response.statusCode == 200 &&
        response.data.length > 0) {
      return response.data[0]["id"];
    } else {
      return null;
    }
  }

  @override
  Future incrementaQuantidadeCarrinho(int quantidade, int carrinhoId) async {
    String link = Basicos.codifica(
        "${Basicos.ip}/crud/?crud=consul122.$quantidade,$carrinhoId");
    Response response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );
    // try {
    if (response.data != null && response.statusCode == 200) {
      return response.data;
    } else {
      return null;
    }
  }

  @override
  Future buscarCategoriasProduto(int id) async {
    String link = Basicos.codifica("${Basicos.ip}/crud/?crud=consul125.$id");
    Response response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );

    if (response.data != null && response.statusCode == 200) {
      var respondeDecoded = response.data
          .map<Categoria>((json) => Categoria.fromJson(json))
          .toList();
      return respondeDecoded;
    } else {
      return null;
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
