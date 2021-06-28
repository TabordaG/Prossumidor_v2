import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'sacola_controller.g.dart';

@Injectable()
class SacolaController = _SacolaControllerBase with _$SacolaController;

abstract class _SacolaControllerBase with Store {
  @observable
  int total = 40;

  @observable
  int entrega = 0;

  @action
  setEntrega(int valor) {
    entrega = valor;
    if (valor == 1) {
      setFrete(0.0);
      total = 40;
    } else {
      setFrete(5.0);
      total = 45;
    }
  }

  @observable
  int pagamento = 0;

  @action
  setPagamento(int valor) => pagamento = valor;

  @observable
  double frete = 5.0;

  @action
  setFrete(double valor) => frete = valor;

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
