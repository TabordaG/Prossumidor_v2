import 'repositories/sobre_repository.dart';
import 'sobre_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'sobre_page.dart';

class SobreModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $SobreRepository,
        $SobreController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => SobrePage()),
      ];

  static Inject get to => Inject<SobreModule>.of();
}
