import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../dados_basicos.dart';
import 'interfaces/chat_repository_interface.dart';

part 'chat_repository.g.dart';

@Injectable()
class ChatRepository implements IChatRepository {
  Dio dio;
  ChatRepository() {
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
  Future buscaMensagens(int idCliente, int idEmpresa) async {
    String link = Basicos.codifica(
        "${Basicos.ip}/crud/?crud=consult75.$idCliente,$idEmpresa,50,0");

    response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );
    if (response.data != null && response.statusCode == 200) {
      // try {
      // var respondeDecoded = Basicos.decodifica(response.data);
      // List list = json.decode(response.data).cast<Map<String, dynamic>>();
      List list = response.data;
      return list;
      // } catch (e) {
      //     return null;
      //   }
    } else
      return null;
  }

  @override
  Future iniciaChat(int id, int offset) async {
    String link = Basicos.codifica("${Basicos.ip}"
        "/crud/?crud=consult78.$id,100,$offset");

    response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );
    if (response.data != null && response.statusCode == 200) {
      try {
        // var respondeDecoded = Basicos.decodifica(response.data);
        List list = response.data;
        return list;
      } catch (e) {
        return null;
      }
    } else
      return null;
  }

  @override
  Future buscaUltimaMensagem(int id, String string) async {
    String link = Basicos.codifica("${Basicos.ip}"
        "/crud/?crud=consult79.$id,$string");

    response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );
    if (response.data != null && response.statusCode == 200) {
      try {
        List list = response.data;
        return list;
      } catch (e) {
        return null;
      }
    } else
      return null;
  }

  @override
  Future enviaMensagem(String menssagem, int idCliente, int idEmpresa) async {
    String exp = menssagem.replaceAll(',', ' '); // remove virgula
    String exp2 = exp.replaceAll('"', ' '); //remove aspas duplas

    String link = Basicos.codifica("${Basicos.ip}"
        "/crud/?crud=consult74.$exp2, Cliente-Produtor, Enviado, $idCliente, $idEmpresa,");

    response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );
    if (response.data != null && response.statusCode == 200) {
      try {
        print('sucesso');
        return 'sucesso';
      } catch (e) {
        return null;
      }
    } else
      return null;
  }

  @override
  Future atualizaMensagem(int idEmpresa, int idCliente) async {
    String link = Basicos.codifica("${Basicos.ip}/crud/?crud=consult83."
        "$idEmpresa," //"${widget.ID_Produtor.substring(widget.ID_Produtor.lastIndexOf('(', widget.ID_Produtor.length) + 1, widget.ID_Produtor.length - 1)}," //    produtor_id integer NOT NULL,
        "Lido,"
        //    data_envio timestamp with time zone NOT NULL,
        "${DateTime.now()}," //data_leitura timestamp with time zone NOT NULL,
        "$idCliente," //    cliente_id integer NOT NULL,
        "Produtor-Cliente,");

    response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );
    if (response.data != null && response.statusCode == 200) {
      try {
        print('sucesso');
        return 'sucesso';
      } catch (e) {
        return null;
      }
    } else
      return null;
  }
}
