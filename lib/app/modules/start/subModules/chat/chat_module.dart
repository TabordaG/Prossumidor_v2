import 'package:prossumidor_v2/app/modules/start/subModules/chat/chat_individual_page.dart';

import 'repositories/chat_repository.dart';
import 'chat_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'chat_page.dart';

class ChatModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $ChatRepository,
        $ChatController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => ChatPage()),
        ModularRouter('/chatIndividual', child: (_, args) => ChatIndividual()),
      ];

  static Inject get to => Inject<ChatModule>.of();
}
