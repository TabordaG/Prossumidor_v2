import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'recuperar_senha_controller.g.dart';

@Injectable()
class RecuperarSenhaController = _RecuperarSenhaControllerBase
    with _$RecuperarSenhaController;

abstract class _RecuperarSenhaControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
