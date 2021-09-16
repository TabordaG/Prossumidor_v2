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
  Future enviaEmail(String email, String mensagem) async {
    String link =
        Basicos.codifica("${Basicos.ip}/crud/?crud=consult24.$email,$mensagem");

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
        // List list = json.decode(respondeDecoded).cast<Map<String, dynamic>>();
        if (response.statusCode == 200)
          return 'sucesso';
        else
          return 'falha';
      } else
        return null;
    } catch (e) {
      return null;
    }
  }

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

  @override
  Future alterarSenha(String email, String novaSenha) async {
    String link = Basicos.codifica(
        "${Basicos.ip}/crud/?crud=consul110.${Basicos.codificapwss(novaSenha)},$email");

    response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );
    // try {
    if (response.data != null && response.statusCode == 200) {
      var respondeDecoded = Basicos.decodifica(response.data);
      return respondeDecoded;
    } else
      return null;
    // } catch (e) {
    //   return null;
    // }
  }
}
