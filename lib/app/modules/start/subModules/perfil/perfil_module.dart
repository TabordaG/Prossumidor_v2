import 'package:prossumidor_v2/app/modules/start/subModules/perfil/subModules/ajuda/ajuda_module.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/perfil/subModules/endereco/endereco_module.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/perfil/subModules/meus_dados/meus_dados_module.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/perfil/subModules/sobre/sobre_module.dart';

import 'repositories/perfil_repository.dart';
import 'perfil_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'perfil_page.dart';

class PerfilModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $PerfilRepository,
        $PerfilController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => PerfilPage()),
        ModularRouter("/endereco", module: EnderecoModule()),
        ModularRouter("/meus_dados", module: MeusDadosModule()),
        ModularRouter("/sobre", module: SobreModule()),
        ModularRouter("/ajuda", module: AjudaModule()),
      ];

  static Inject get to => Inject<PerfilModule>.of();
}
