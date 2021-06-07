import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'produto_detalhes_controller.dart';

class ProdutoDetalhesPage extends StatefulWidget {
  final String title;
  const ProdutoDetalhesPage({Key key, this.title = "ProdutoDetalhes"})
      : super(key: key);

  @override
  _ProdutoDetalhesPageState createState() => _ProdutoDetalhesPageState();
}

class _ProdutoDetalhesPageState
    extends ModularState<ProdutoDetalhesPage, ProdutoDetalhesController> {
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
