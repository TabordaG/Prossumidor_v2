import 'package:prossumidor_v2/app/injects/bind.dart';
import 'package:prossumidor_v2/app/injects/pages.dart';
import 'package:prossumidor_v2/app/modules/login/repositories/interfaces/login_repository_interface.dart';
import 'package:prossumidor_v2/app/modules/login/repositories/login_repository.dart';
import 'package:prossumidor_v2/app/shared/auth/repositories/auth_repository.dart';
import 'package:prossumidor_v2/app/shared/auth/repositories/interfaces/auth_repository_interface.dart';
import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    $AppController,
    Bind<IAuthRepository>((i) => AuthRepository()),
    Bind<ILoginRepository>((i) => LoginRepository()),
    ...bindRepositories,
    ...bindControllers,
  ];

  @override
  final List<ModularRoute> routes = [
    ...appPages,
  ];
}
