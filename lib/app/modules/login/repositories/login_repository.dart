import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/models/usuario/usuario_model.dart';

import '../../../dados_basicos.dart';
import 'interfaces/login_repository_interface.dart';

part 'login_repository.g.dart';

@Injectable()
class LoginRepository implements ILoginRepository {
  Dio dio;
  LoginRepository() {
    BaseOptions options = BaseOptions(
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000, // 20 seconds
      receiveTimeout: 20 * 1000, // 20 seconds
    );

    dio = Dio(options);
  }
  Response response;

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Future buscarUsuario(String email) async {
    String link = Basicos.codifica("${Basicos.ip}/crud/?crud=consulta1.$email");

    response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );
    try {
      if (response.data != null && response.statusCode == 200) {
        var respondeDecoded = Basicos.decodifica(response.data);
        List list = json.decode(respondeDecoded).cast<Map<String, dynamic>>();
        Basicos.empresaID = list[0]['empresa_id'].toString();
        Basicos.localRetiradaID = list[0]['local_retirada_id'].toString();
        Usuario usuario = Usuario(
          usuario_id: list[0]['id'],
          email: email,
          senha: list[0]['senha'],
          empresa_id: list[0]['empresa_id'],
        );

        return usuario;
      } else
        return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future buscarUsuarioSemFiltro(String email) async {
    String link = Basicos.codifica("${Basicos.ip}/crud/?crud=consult-1.$email");

    response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );

    try {
      if (response.data != null && response.statusCode == 200) {
        var respondeDecoded = Basicos.decodifica(response.data);
        print(respondeDecoded);
        List list = json.decode(respondeDecoded).cast<Map<String, dynamic>>();
        Basicos.empresaID = list[0]['empresa_id'].toString();
        Basicos.localRetiradaID = list[0]['local_retirada_id'].toString();
        Usuario usuario = Usuario(
          usuario_id: list[0]['id'],
          email: email,
          senha: list[0]['senha'],
          empresa_id: list[0]['empresa_id'],
        );

        return usuario;
      } else
        return null;
    } catch (e) {
      return null;
    }
  }
}
