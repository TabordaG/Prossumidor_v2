import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'produtos_categorias_controller.g.dart';

@Injectable()
class ProdutosCategoriasController = _ProdutosCategoriasControllerBase
    with _$ProdutosCategoriasController;

abstract class _ProdutosCategoriasControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
