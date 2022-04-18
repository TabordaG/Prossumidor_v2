import 'package:prossumidor_v2/app/modules/start/subModules/chat/chat_individual_page.dart';

import 'repositories/chat_repository.dart';
import 'chat_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'chat_page.dart';

class ChatModule extends Module {
  @override
  final List<Bind> binds = [
    $ChatRepository,
    $ChatController,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => ChatPage()),
    ChildRoute('/chatIndividual', child: (_, args) => ChatIndividual()),
  ];
}
