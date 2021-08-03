import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../dados_basicos.dart';
import 'interfaces/recuperar_senha_repository_interface.dart';

part 'recuperar_senha_repository.g.dart';

@Injectable()
class RecuperarSenhaRepository implements IRecuperarSenhaRepository {
  Dio dio;
  RecuperarSenhaRepository() {
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
  Future enviaEmail(String email, String mensagem) async {}

  @override
  Future verifaEmail(String email) async {
    String link = Basicos.codifica(
        "${Basicos.ip}/crud/?crud=consulta3.${email.toLowerCase()}");

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
        if (list.isEmpty)
          return 'livre';
        else
          return 'existe';
      } else
        return null;
    } catch (e) {
      return null;
    }
  }
}
