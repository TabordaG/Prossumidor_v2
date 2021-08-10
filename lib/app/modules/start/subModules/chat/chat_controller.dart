import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/constants.dart';
import 'package:prossumidor_v2/app/models/chat/chat_model.dart';
import 'package:prossumidor_v2/app/shared/auth/auth_controller.dart';

import 'repositories/interfaces/chat_repository_interface.dart';

part 'chat_controller.g.dart';

@Injectable()
class ChatController = _ChatControllerBase with _$ChatController;

abstract class _ChatControllerBase with Store {
  final AuthController authController = Modular.get<AuthController>();
  final IChatRepository pedidosRepository = Modular.get<IChatRepository>();
  _ChatControllerBase() {
    pedidosRepository.buscaMensagens(authController.usuario.id);
    listaConversas = listaChat
        .where((element) =>
            element.id_cliente == authController.usuario.id)
        .toList();
  }
  @observable
  List<Chat> listaConversas;

  @observable
  List<Chat> listaConversasPorEmpresas;

  @observable
  int conversas = 0;

  @observable
  TextEditingController mensagem = TextEditingController();

  @action
  setMensagem(String value) => mensagem.text = value;

  @action
  sendMensagem() {
    listaempresa.add(Chat(
      chat_id: listaConversasPorEmpresas.first.chat_id + 1,
      status: "Enviado",
      situacao: 'Cliente-Produtor',
      data_envio: DateTime.now(),
      id_cliente: authController.usuario.id,
      id_empresa: listaConversasPorEmpresas[0].id_empresa,
      nome_empresa: listaConversasPorEmpresas[0].nome_empresa,
      mensagem: mensagem.text,
    ));
    print('mensagem id: ' + listaempresa.last.chat_id.toString());
    print('mensagem: ' + listaempresa.last.mensagem);
    buscaMensagens(listaConversasPorEmpresas.first.id_empresa);
    mensagem.clear();
  }

  @action
  totalConversas() {
    conversas = 0;
    for (int i = 0; i < listaConversas.length; i++) {
      int idEmpresa = 0;
      if (listaConversas[i].id_empresa != idEmpresa) {
        conversas = conversas + 1;
      }
    }
    return conversas;
  }

  @action
  buscaMensagens(int idEmpresa) {
    listaConversasPorEmpresas = [];
    List<Chat> lista = [];
    lista = listaempresa
        .where((element) =>
            element.id_cliente == authController.usuario.id &&
            element.id_empresa == idEmpresa)
        .toList();
    lista.sort((a, b) => b.chat_id.compareTo(a.chat_id));
    listaConversasPorEmpresas = lista;
    return listaConversasPorEmpresas;
  }
}
