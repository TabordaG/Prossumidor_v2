import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/constants.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/chat/components/cardChat.dart';
import 'package:prossumidor_v2/app/shared/auth/auth_controller.dart';
import 'chat_controller.dart';

class ChatPage extends StatefulWidget {
  final String title;
  const ChatPage({Key? key, this.title = "Conversas"}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends ModularState<ChatPage, ChatController> {
  final ChatController chatController = Modular.get<ChatController>();
  final AuthController authController = Modular.get<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white60,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.chat,
                color: Colors.white,
              ),
              const SizedBox(
                width: kDefaultPadding * .25,
              ),
              Text(widget.title),
            ],
          ),
        ),
        body: Observer(
          builder: (_) {
            return chatController.listaConversas == null
                ? const Center(
                    child: Text('nulo'),
                  )
                : ListView.builder(
                    itemCount: chatController.listaConversas.length,
                    itemBuilder: (context, index) {
                      return Observer(builder: (_) {
                        return chatController.listaUltimasConversas == null ||
                                chatController.listaUltimasConversas!.isEmpty
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : Column(
                                children: [
                                  CardChat(
                                    chat: chatController
                                        .listaUltimasConversas![index],
                                    onTap: () async {
                                      await chatController.buscaChatIndividual(
                                          chatController
                                              .listaUltimasConversas![index]
                                              .id_cliente_id!,
                                          chatController
                                              .listaUltimasConversas![index]
                                              .id_empresa_id!);
                                      Modular.to
                                          .pushNamed('chat/chatIndividual');
                                    },
                                  ),
                                ],
                              );
                      });
                    },
                  );
          },
        ));
  }
}
