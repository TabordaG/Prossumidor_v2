// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/models/chat/chat_model.dart';
import 'package:prossumidor_v2/app/shared/auth/auth_controller.dart';

import 'repositories/interfaces/chat_repository_interface.dart';

part 'chat_controller.g.dart';

@Injectable()
class ChatController = _ChatControllerBase with _$ChatController;

abstract class _ChatControllerBase with Store {
  final AuthController authController = Modular.get<AuthController>();
  final IChatRepository chatRepository = Modular.get<IChatRepository>();
  _ChatControllerBase() {
    buscaChats();
  }
  @observable
  List listaConversas = [];

  @observable
  List<Chat>? listaUltimasConversas = [];

  @observable
  List<Chat> chatConversas = [];

  @observable
  int conversas = 0;

  @observable
  TextEditingController mensagem = TextEditingController();

  @action
  buscaChats() async {
    listaConversas =
        await chatRepository.iniciaChat(authController.usuario!.id!, 0);
    await buscaChatsEmpresa();
  }

  @action
  setMensagem(String value) => mensagem.text = value;

  @action
  sendMensagem(String menssagem, int idCliente, int idEmpresa) async {
    String resultado =
        await chatRepository.enviaMensagem(menssagem, idCliente, idEmpresa);
    if (resultado == 'sucesso') buscaChatIndividual(idCliente, idEmpresa);
    mensagem.clear();
    await buscaChats();
  }

  @action
  buscaChatsEmpresa({int? id}) async {
    listaUltimasConversas = null;
    if (listaConversas != null) {
      listaUltimasConversas = [];
      listaConversas.forEach((element) async {
        List lista = await chatRepository.buscaUltimaMensagem(
            authController.usuario!.id!, element['id_empresa_id'].toString());
        lista.forEach((element) {
          Chat chat = Chat.fromJson(element);
          listaUltimasConversas!.add(chat);
        });
        listaUltimasConversas = List.from(listaUltimasConversas!);
      });

      listaUltimasConversas ??= List.from([]);
    }
  }

  @action
  buscaChatIndividual(int idCliente, int idEmpresa) async {
    chatConversas = [];
    List list = await chatRepository.buscaMensagens(idCliente, idEmpresa);
    list = list.reversed.toList();
    if (list != null) {
      list.forEach((element) {
        Chat chat = Chat.fromJson(element);
        chatConversas.add(chat);
      });
      chatConversas = List.from(chatConversas);
      chatConversas;
      await chatRepository.atualizaMensagem(idEmpresa, idCliente);
      authController.temMensagem = false;
    }
  }
}
