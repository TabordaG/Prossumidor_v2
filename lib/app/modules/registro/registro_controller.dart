import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'registro_controller.g.dart';

@Injectable()
class RegistroController = _RegistroControllerBase with _$RegistroController;

abstract class _RegistroControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
