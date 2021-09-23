import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/dados_basicos.dart';

import 'interfaces/registro_repository_interface.dart';

part 'registro_repository.g.dart';

@Injectable()
class RegistroRepository implements IRegistroRepository {
  Dio dio;
  RegistroRepository() {
    BaseOptions options = BaseOptions(
      receiveDataWhenStatusError: true,
      connectTimeout: 60 * 1000, // 20 seconds
      receiveTimeout: 60 * 1000, // 20 seconds
    );

    dio = Dio(options);
  }
  Response response;

  @override
  Future buscarLocaisRetirada() async {
    String link = Basicos.codifica("${Basicos.ip}/crud/?crud=consult20.");

    response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );
    // try {
    if (response.data != null && response.statusCode == 200) {
      var respondeDecoded = Basicos.decodifica(response.data);
      List list = json.decode(respondeDecoded).cast<Map<String, dynamic>>();
      return list;
    } else
      return null;
    // } catch (e) {
    //   return null;
    // }
  }

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Future enviarEmail(String email, String code) async {
    String link =
        Basicos.codifica("${Basicos.ip}/crud/?crud=consult25.$email,$code");

    response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );
    if (response.data != null && response.statusCode == 200) {
      var respondeDecoded = Basicos.decodifica(response.data);
      return respondeDecoded;
    } else
      return null;
  }

  @override
  Future verificaEmail(String email) async {
    String link = Basicos.codifica("${Basicos.ip}/crud/?crud=consulta3.$email");

    response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );
    if (response.data != null && response.statusCode == 200) {
      var respondeDecoded = Basicos.decodifica(response.data);
      List list = json.decode(respondeDecoded).cast<Map<String, dynamic>>();
      if (list.isEmpty)
        return 'livre';
      else
        return 'existe';
    } else
      return null;
  }

  @override
  Future registrar(
      String nome,
      String cpf,
      String telefone,
      String genero,
      String email,
      String senhaCripto,
      String localRetirada,
      String endereco,
      String bairro,
      String cidade,
      String cep,
      String estado,
      String numero,
      String complemento) async {
    String link = Basicos.codifica(
        "${Basicos.ip}/crud/?crud=consulta2.$nome,$cpf,$telefone,$genero,$email,$senhaCripto,$localRetirada,$endereco,$bairro,$cidade,$cep,$estado,$numero,$complemento");

    print(
        "${Basicos.ip}/crud/?crud=consulta2.$nome,$cpf,$telefone,$genero,$email,$senhaCripto,$localRetirada,$endereco,$bairro,$cidade,$cep,$estado,$numero,$complemento");
    response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );
    if (response.data != null && response.statusCode == 200) {
      var respondeDecoded = Basicos.decodifica(response.data);
      return respondeDecoded;
    } else
      return null;
  }

  @override
  Future getData(String email) async {
    String link = Basicos.codifica("${Basicos.ip}/crud/?crud=consult-1.$email");

    response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );
    if (response.data != null && response.statusCode == 200) {
      var respondeDecoded = Basicos.decodifica(response.data);
      List list = json.decode(respondeDecoded).cast<Map<String, dynamic>>();
      if (list.isNotEmpty)
        return list[0];
      else
        return null;
    } else
      return null;
  }
}
