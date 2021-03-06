import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/constants.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/chat/chat_controller.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/chat/components/cardMensagem.dart';

class ChatIndividual extends StatefulWidget {
  const ChatIndividual({Key? key}) : super(key: key);

  @override
  _ChatIndividualState createState() => _ChatIndividualState();
}

class _ChatIndividualState extends State<ChatIndividual> {
  final ChatController chatController = Modular.get<ChatController>();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Observer(builder: (_) {
          return Text(
            chatController.chatConversas.isNotEmpty
                ? chatController.chatConversas[0].razao_social!
                : '',
          );
        })),
        body: Column(
          children: [
            Expanded(
              child: Observer(builder: (_) {
                if (
                    chatController.chatConversas.isNotEmpty) {
                  return const CircularProgressIndicator();
                } else {
                  return ListView.builder(
                    controller: _scrollController,
                    reverse: true,
                    itemCount: chatController.chatConversas.length,
                    itemBuilder: (context, index) {
                      return CardMensagem(
                          chat: chatController.chatConversas[index]);
                    },
                  );
                }
              }),
            ),
            Container(
                color: Theme.of(context).primaryColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding * .5,
                  vertical: kDefaultPadding * .5,
                ),
                height: 75,
                width: double.infinity,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: TextField(
                          controller: chatController.mensagem,
                          onSubmitted: (value) =>
                              chatController.setMensagem(value),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(
                              left: kDefaultPadding * .7,
                              right: kDefaultPadding * .7,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            hintText: 'Digite uma mensagem',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 16, color: Colors.white),
                          ),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: kDefaultPadding / 2,
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.send,
                          color: Theme.of(context).colorScheme.secondary,
                          size: 30,
                        ),
                        onPressed: () {
                          chatController.sendMensagem(
                              chatController.mensagem.text,
                              chatController
                                  .listaUltimasConversas![0].id_cliente_id!,
                              chatController
                                  .listaUltimasConversas![0].id_empresa_id!);
                          _scrollController.animateTo(0.0,
                              duration: const Duration(microseconds: 300),
                              curve: Curves.easeOut);
                        },
                      ),
                    ),
                  ],
                )),
          ],
        ));
  }
}
