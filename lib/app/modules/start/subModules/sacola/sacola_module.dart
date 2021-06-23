import 'repositories/sacola_repository.dart';
import 'sacola_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'sacola_page.dart';

class SacolaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $SacolaRepository,
        $SacolaController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          child: (_, args) => SacolaPage(),
          transition: TransitionType.rightToLeft,
        ),
      ];

  static Inject get to => Inject<SacolaModule>.of();
}
