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
  int conversas = 0;

  @observable
  TextEditingController mensagem = TextEditingController();

  @action
  setMensagem(String value) => mensagem.text = value;

  @action
  sendMensagem() {
    // listaempresa.add(Chat(
    //   chat_id: listaConversasPorEmpresas.first.chat_id + 1,
    //   status: "Enviado",
    //   situacao: 'Cliente-Produtor',
    //   data_envio: DateTime.now(),
    //   id_cliente_id: authController.usuario.id,
    //   id_empresa_id: listaConversasPorEmpresas[0].id_empresa_id,
    //   razao_social: listaConversasPorEmpresas[0].razao_social,
    //   mensagem: mensagem.text,
    // ));
    // print('mensagem id: ' + listaempresa.last.chat_id.toString());
    // print('mensagem: ' + listaempresa.last.mensagem);
    buscaChats();
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
          print(listaConversasPorEmpresas);
        });
        listaConversasPorEmpresas = List.from(listaConversasPorEmpresas);
      });
      if (listaConversasPorEmpresas == null) {
        listaConversasPorEmpresas = List.from([]);
      }
    }
  }

  @action
  buscaChatIndividual(){
    
  }
}
