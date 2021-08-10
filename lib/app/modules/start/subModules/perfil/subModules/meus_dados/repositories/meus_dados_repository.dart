import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../../dados_basicos.dart';
import 'interfaces/meus_dados_repository_interface.dart';

part 'meus_dados_repository.g.dart';

@Injectable()
class MeusDadosRepository implements IMeusDadosRepository {
  Dio dio;
  MeusDadosRepository() {
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
  Future alteraDados(
    String id,
    nome,
    cpf,
    telefone,
    sexo,
    endereco,
    numero,
    complemento,
    bairro,
    cidade,
    cep,
    estado,
    nascimento,
    civil,
    retirada,
  ) async {
    String link = Basicos.codifica(
        "${Basicos.ip}/crud/?crud=consult23.$id, $nome, $cpf,  $telefone, $sexo, $endereco, $numero, $complemento,"
        "$bairro, $cidade, $cep, $estado, $nascimento, $civil, $retirada");
    print(link);
    response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );
    print(response.data);
    if (response.data != null && response.statusCode == 200) {
      try {
        return 'sucesso';
      } catch (e) {
        return null;
      }
    } else
      return null;
  }
}
