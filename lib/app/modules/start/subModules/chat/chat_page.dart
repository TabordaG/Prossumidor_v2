import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/constants.dart';
import 'chat_controller.dart';

class ChatPage extends StatefulWidget {
  final String title;
  const ChatPage({Key key, this.title = "Conversas"}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends ModularState<ChatPage, ChatController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.chat,
              color: Colors.white,
            ),
            SizedBox(
              width: kDefaultPadding * .25,
            ),
            Text(widget.title),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
