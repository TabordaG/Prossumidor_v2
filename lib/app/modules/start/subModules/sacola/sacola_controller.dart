import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'sacola_controller.g.dart';

@Injectable()
class SacolaController = _SacolaControllerBase with _$SacolaController;

abstract class _SacolaControllerBase with Store {
  @observable
  int entrega = 0;

  @action
  setEntrega(int valor) => entrega = valor;

  @observable
  bool verDetalhes = false;

  @action
  setVerDetalhes(bool valor) => verDetalhes = valor;

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
