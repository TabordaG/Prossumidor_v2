import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/shared/auth/auth_controller.dart';

part 'perfil_controller.g.dart';

@Injectable()
class PerfilController = _PerfilControllerBase with _$PerfilController;

abstract class _PerfilControllerBase with Store {
  _PerfilControllerBase() {
    centroDistribuicao = authController.usuario.empresa;
  }
  final AuthController authController = Modular.get<AuthController>();

  @observable
  String centroDistribuicao;

  @observable
  ScrollController scrollController;
}
