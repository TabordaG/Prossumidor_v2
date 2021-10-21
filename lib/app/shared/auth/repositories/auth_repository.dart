import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/models/usuario/usuario_model.dart';

import '../../../dados_basicos.dart';
import 'interfaces/auth_repository_interface.dart';

part 'auth_repository.g.dart';

@Injectable()
class AuthRepository implements IAuthRepository {
  Dio dio;
  AuthRepository() {
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
  Future buscarVersao() async {
    String consultaVersao = Basicos.codifica(
        "${Basicos.ip}/crud/?crud=consult85.*"); //verifica versão

    response = await dio.get(
      Uri.encodeFull(consultaVersao),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );

    try {
      if (response.data != null && response.statusCode == 200)
        return response.data[0]['id_versao'].toString();
      else
        return 'Erro de conexão';
    } catch (e) {
      return 'Erro de conexão';
    }
  }

  @override
  Future buscarUsuario(String email) async {
    String link = Basicos.codifica("${Basicos.ip}/crud/?crud=consulta1.$email");

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
        Basicos.empresaID = list[0]['empresa_id'].toString();
        Basicos.localRetiradaID = list[0]['local_retirada_id'].toString();
        Usuario usuario = Usuario(
          id: list[0]['id'],
          email: email,
          senha: list[0]['senha'],
          empresa_id: list[0]['empresa_id'],
        );

        return usuario;
      } catch (e) {
        return null;
      }
    } else
      return null;
  }

  @override
  Future<Usuario> buscaUsuarioCompleto(int id) async {
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
}
