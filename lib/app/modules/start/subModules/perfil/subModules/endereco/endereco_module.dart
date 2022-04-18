import 'repositories/endereco_repository.dart';
import 'endereco_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'endereco_page.dart';

class EnderecoModule extends Module {
  @override
  final List<Bind> binds = [
    $EnderecoRepository,
    $EnderecoController,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => EnderecoPage()),
  ];
}
