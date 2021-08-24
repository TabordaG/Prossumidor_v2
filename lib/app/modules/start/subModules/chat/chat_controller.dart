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
    // chatRepository.buscaChats(authController.usuario.id);
    // listaConversas = listaChat
    //     .where((element) => element.id_cliente == authController.usuario.id)
    //     .toList();
    buscaChats();
  }
  @observable
  List listaConversas = [];

  @observable
  List<Chat> listaConversasPorEmpresas = [];

  @observable
  List<Chat> chatConversas = [];

  @observable
  int conversas = 0;

  @observable
  TextEditingController mensagem = TextEditingController();

  @action
  setMensagem(String value) => mensagem.text = value;

  @action
  sendMensagem(String menssagem, int idCliente, int idEmpresa) async {
    String resultado =
        await chatRepository.enviaMensagem(menssagem, idCliente, idEmpresa);
    if (resultado == 'sucesso') buscaChatIndividual(idCliente, idEmpresa);
    // chatConversas.add(Chat(mensagem: menssagem, ));
    mensagem.clear();
  }

  @action
  buscaChats() async {
    listaConversas =
        await chatRepository.iniciaChat(authController.usuario.id, 0);
    await buscaChatsEmpresa();
  }

  @action
  buscaChatsEmpresa({int id}) async {
    listaConversasPorEmpresas = null;
    if (listaConversas != null) {
      listaConversasPorEmpresas = [];
      listaConversas.forEach((element) async {
        List lista = await chatRepository.buscaUltimaMensagem(
            authController.usuario.id, element['id_empresa_id'].toString());
        lista.forEach((element) {
          Chat chat = Chat.fromJson(element);
          listaConversasPorEmpresas.add(chat);
        });
        listaConversasPorEmpresas = List.from(listaConversasPorEmpresas);
      });
      if (listaConversasPorEmpresas == null) {
        listaConversasPorEmpresas = List.from([]);
      }
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
      if (chatConversas == null) {
        chatConversas = List.from([]);
      }
    }
  }
}
