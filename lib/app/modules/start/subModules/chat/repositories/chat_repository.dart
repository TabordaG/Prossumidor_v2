import 'dart:convert';

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
  Future buscaMensagens(int id) async {
    String link = Basicos.codifica("${Basicos.ip}/crud/?crud=consult81.$id");

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

        String chat = list[0]['count'].toString();
        if (chat.toString() == '0') return 0;
        return 1;
      } catch (e) {
        return null;
      }
    } else
      return null;
  }
}
