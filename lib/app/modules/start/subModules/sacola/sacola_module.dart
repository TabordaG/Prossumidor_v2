import 'package:prossumidor_v2/app/modules/start/subModules/sacola/confirmarEndereco_page.dart';

import 'repositories/sacola_repository.dart';
import 'sacola_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'sacola_page.dart';

class SacolaModule extends Module {
  @override
  final List<Bind> binds = [
    $SacolaRepository,
    $SacolaController,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => const SacolaPage(),
      transition: TransitionType.rightToLeft,
    ),
    ChildRoute(
      '/confirmarEndereco',
      child: (_, args) => const ConfirmarEndereco(),
      transition: TransitionType.rightToLeft,
    ),
  ];
}
