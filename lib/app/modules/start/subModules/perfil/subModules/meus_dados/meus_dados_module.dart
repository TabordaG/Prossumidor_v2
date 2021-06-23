import 'repositories/meus_dados_repository.dart';
import 'meus_dados_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'meus_dados_page.dart';

class MeusDadosModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $MeusDadosRepository,
        $MeusDadosController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => MeusDadosPage()),
      ];

  static Inject get to => Inject<MeusDadosModule>.of();
}
