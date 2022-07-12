import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'sobre_controller.g.dart';

@Injectable()
class SobreController = _SobreControllerBase with _$SobreController;

abstract class _SobreControllerBase with Store {
  @observable
  bool isExpanded1 = false;

  @action
  toggleExpanded1() {
    isExpanded1 = !isExpanded1;
  }

  @observable
  bool isExpanded2 = false;

  @observable
  bool isExpanded3 = false;
}
