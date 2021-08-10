import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/models/usuario/usuario_model.dart';

import '../../../../../dados_basicos.dart';
import 'interfaces/perfil_repository_interface.dart';

part 'perfil_repository.g.dart';

@Injectable()
class PerfilRepository implements IPerfilRepository {
  Dio dio;
  PerfilRepository() {
    BaseOptions options = BaseOptions(
      receiveDataWhenStatusError: true,
      connectTimeout: 10 * 1000, // 10 seconds
      receiveTimeout: 10 * 1000, // 10 seconds
    );

    dio = Dio(options);
  }

  Response response;

  @override
  Future<Usuario> buscaUsuario(int id) async {
    String link = Basicos.codifica("${Basicos.ip}/crud/?crud=consult22.$id");

    response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );

    if (response.data != null && response.statusCode == 200) {
      try {
        Usuario user = Usuario.fromJson(response.data[0]);
        return user;
      } catch (e) {
        return null;
      }
    } else
      return null;
  }

  @override
  Future localRetirada(String email) async {
    String link = Basicos.codifica("${Basicos.ip}/crud/?crud=consult20.$email");

    response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );

    if (response.data != null && response.statusCode == 200) {
      try {
        var respondeDecoded = Basicos.decodifica(response.data);
        List list = json.decode(respondeDecoded).cast<Map<String, dynamic>>();
        return list;
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
