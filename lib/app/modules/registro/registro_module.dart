import 'repositories/registro_repository.dart';
import 'registro_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'registro_page.dart';

class RegistroModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $RegistroRepository,
        $RegistroController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => RegistroPage()),
      ];

  static Inject get to => Inject<RegistroModule>.of();
}
