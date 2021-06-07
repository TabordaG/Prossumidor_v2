import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'sacola_controller.dart';

class SacolaPage extends StatefulWidget {
  final String title;
  const SacolaPage({Key key, this.title = "Sacola"}) : super(key: key);

  @override
  _SacolaPageState createState() => _SacolaPageState();
}

class _SacolaPageState extends ModularState<SacolaPage, SacolaController> {
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
