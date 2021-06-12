import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'sacola_controller.g.dart';

@Injectable()
class SacolaController = _SacolaControllerBase with _$SacolaController;

abstract class _SacolaControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
