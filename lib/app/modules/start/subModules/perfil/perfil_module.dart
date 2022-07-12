import 'package:prossumidor_v2/app/modules/start/subModules/perfil/subModules/ajuda/ajuda_module.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/perfil/subModules/endereco/endereco_module.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/perfil/subModules/meus_dados/meus_dados_module.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/perfil/subModules/sobre/sobre_module.dart';

import 'repositories/perfil_repository.dart';
import 'perfil_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'perfil_page.dart';

class PerfilModule extends Module {
  @override
  final List<Bind> binds = [
    $PerfilRepository,
    $PerfilController,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const PerfilPage()),
    ModuleRoute(
      "/endereco/",
      module: EnderecoModule(),
      transition: TransitionType.rightToLeft,
    ),
    ModuleRoute(
      "/meus_dados/",
      module: MeusDadosModule(),
      transition: TransitionType.rightToLeft,
    ),
    ModuleRoute(
      "/sobre/",
      module: SobreModule(),
      transition: TransitionType.rightToLeft,
    ),
    ModuleRoute(
      "/ajuda/",
      module: AjudaModule(),
      transition: TransitionType.rightToLeft,
    ),
  ];
}
