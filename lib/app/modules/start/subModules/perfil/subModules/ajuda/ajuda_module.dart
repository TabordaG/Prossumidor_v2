import 'package:dio/dio.dart';
import 'repositories/ajuda_repository.dart';
import 'ajuda_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'ajuda_page.dart';

class AjudaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $AjudaRepository,
        $AjudaController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => AjudaPage()),
      ];

  static Inject get to => Inject<AjudaModule>.of();
}
