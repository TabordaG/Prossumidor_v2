import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/constants.dart';
import 'package:prossumidor_v2/app/models/subcategoria/subcategoria_model.dart';

part 'produtos_categorias_controller.g.dart';

@Injectable()
class ProdutosCategoriasController = _ProdutosCategoriasControllerBase
    with _$ProdutosCategoriasController;

abstract class _ProdutosCategoriasControllerBase with Store {
  _ProdutosCategoriasControllerBase() {
    if (subcategorias.isEmpty) {
      print("Entrou");
      subcategoriaList.forEach((element) {
        subcategorias.add(element);
      });
    }
  }

  @observable
  TextEditingController buscarText = TextEditingController();

  @observable
  bool isSearching = false;

  @action
  setIsSearching() {
    isSearching = !isSearching;
    if (!isSearching) buscarText.clear();
  }

  @action
  buscarProduto() {}

  @observable
  List<Subcategoria> subcategorias = [];

  @action
  selecionarSubcategoria(int index) {
    subcategorias[index].ativo = !subcategorias[index].ativo;
    int verifica = 0;
    subcategorias.forEach((element) {
      if (element.ativo == true) {
        verifica = 1;
      }
    });
    if (verifica == 0) subcategorias[0].ativo = true;
    subcategorias = List.from(subcategorias);
  }
}
