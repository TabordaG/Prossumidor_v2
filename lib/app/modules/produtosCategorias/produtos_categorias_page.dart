import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'produtos_categorias_controller.dart';

class ProdutosCategoriasPage extends StatefulWidget {
  final String title;
  const ProdutosCategoriasPage({Key key, this.title = "ProdutosCategorias"})
      : super(key: key);

  @override
  _ProdutosCategoriasPageState createState() => _ProdutosCategoriasPageState();
}

class _ProdutosCategoriasPageState
    extends ModularState<ProdutosCategoriasPage, ProdutosCategoriasController> {
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
