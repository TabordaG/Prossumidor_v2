import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/constants.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/chat/chat_controller.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/chat/components/cardMensagem.dart';

class ChatIndividual extends StatefulWidget {
  const ChatIndividual({Key key}) : super(key: key);

  @override
  _ChatIndividualState createState() => _ChatIndividualState();
}

class _ChatIndividualState extends State<ChatIndividual> {
  final ChatController chatController = Modular.get<ChatController>();
  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          chatController.listaConversasPorEmpresas[0].nome_empresa,
        )),
        body: Column(
          children: [
            Expanded(
              child: Observer(builder: (_) {
                return ListView.builder(
                  controller: _scrollController,
                  reverse: true,
                  itemCount: chatController.listaConversasPorEmpresas.length,
                  itemBuilder: (context, index) {
                    return CardMensagem(
                        chat: chatController.listaConversasPorEmpresas[index]);
                  },
                );
              }),
            ),
            Container(
                color: Theme.of(context).primaryColor,
                padding: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                  vertical: kDefaultPadding * 0.5,
                ),
                height: 75,
                width: double.infinity,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(25)),
                        child: TextField(
                          controller: chatController.mensagem,
                          onSubmitted: (value) =>
                              chatController.setMensagem(value),
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.only(left: kDefaultPadding),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25)),
                            hintText: 'Digite uma mensagem',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(fontSize: 16, color: Colors.white),
                          ),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: kDefaultPadding),
                      child: IconButton(
                        icon: Icon(
                          Icons.send,
                          color: Theme.of(context).colorScheme.secondary,
                          size: 30,
                        ),
                        onPressed: () {
                          setState(() {
                            chatController.sendMensagem();
                            _scrollController.animateTo(0.0,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeOutBack);
                          });
                        },
                      ),
                    ),
                  ],
                )),
          ],
        ));
  }
}
