import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'recuperar_senha_controller.dart';

class RecuperarSenhaPage extends StatefulWidget {
  final String title;
  const RecuperarSenhaPage({Key key, this.title = "RecuperarSenha"})
      : super(key: key);

  @override
  _RecuperarSenhaPageState createState() => _RecuperarSenhaPageState();
}

class _RecuperarSenhaPageState
    extends ModularState<RecuperarSenhaPage, RecuperarSenhaController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
