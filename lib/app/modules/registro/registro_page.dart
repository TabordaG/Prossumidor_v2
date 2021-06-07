import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'registro_controller.dart';

class RegistroPage extends StatefulWidget {
  final String title;
  const RegistroPage({Key key, this.title = "Registro"}) : super(key: key);

  @override
  _RegistroPageState createState() => _RegistroPageState();
}

class _RegistroPageState
    extends ModularState<RegistroPage, RegistroController> {
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
