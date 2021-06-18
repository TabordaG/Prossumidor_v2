import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'produto_detalhes_controller.g.dart';

@Injectable()
class ProdutoDetalhesController = _ProdutoDetalhesControllerBase
    with _$ProdutoDetalhesController;

abstract class _ProdutoDetalhesControllerBase with Store {
  @observable
  int value = 1;

  @action
  void increment(int limite) {
    if (value < limite) value++;
  }

  @action
  void decrement() {
    if (value > 0) value--;
  }
}
