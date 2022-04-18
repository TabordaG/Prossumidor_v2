import 'repositories/sobre_repository.dart';
import 'sobre_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'sobre_page.dart';

class SobreModule extends Module {
  @override
  final List<Bind> binds = [
    $SobreRepository,
    $SobreController,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => SobrePage()),
  ];
}
