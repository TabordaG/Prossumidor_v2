import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/shared/auth/auth_controller.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  _HomeControllerBase() {
    scrollController = ScrollController()
      ..addListener(() {
        setOffsetHomeList(scrollController.offset);
      });
    centroDistribuicao = authController.usuario.empresa;
  }
  final AuthController authController = Modular.get<AuthController>();

  @observable
  String centroDistribuicao;

  @observable
  ScrollController scrollController;

  @observable
  double offsetHomeList = 0.0;

  @action
  setOffsetHomeList(double valor) => offsetHomeList = valor;

  @observable
  String buscarString = '';

  @action
  setBuscarString(String valor) => buscarString = valor;
}
