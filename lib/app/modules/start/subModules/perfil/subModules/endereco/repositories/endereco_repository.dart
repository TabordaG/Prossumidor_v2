import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/models/usuario/usuario_model.dart';
import '../../../../../../../dados_basicos.dart';
import 'interfaces/endereco_repository_interface.dart';

part 'endereco_repository.g.dart';

@Injectable()
class EnderecoRepository implements IEnderecoRepository {
  late Dio dio;
  EnderecoRepository() {
    BaseOptions options = BaseOptions(
      receiveDataWhenStatusError: true,
      connectTimeout: 10 * 1000, // 10 seconds
      receiveTimeout: 10 * 1000, // 10 seconds
    );

    dio = Dio(options);
  }

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Future<Usuario?> buscaUsuario(int? id) async {
    String link = Basicos.codifica("${Basicos.ip}/crud/?crud=consult22.$id");

    Response response = await dio.get(
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
    } else {
      return null;
    }
  }

  @override
  Future alteraDados(
    String? id,
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
        "${Basicos.ip}/crud/?crud=consult23.$id,$nome,$cpf,$telefone,$sexo,$endereco,$numero,$complemento,$bairro,$cidade,$cep,$estado,$nascimento,$civil,$retirada");
    Response response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );

    if (response.statusCode == 200) {
      return 'sucesso';
    } else {
      return null;
    }
  }
}
