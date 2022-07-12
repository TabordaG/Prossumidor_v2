import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'app_controller.g.dart';

@Injectable()
class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store implements Disposable {
  final pageViewController = PageController(initialPage: 2);

  _AppControllerBase() {
    pageViewController.addListener(() {
      setIndexBottomNavigator(pageViewController.page?.round() ?? 2);
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
  }

  @observable
  int indexBottomNavigator = 2;

  @action
  setIndexBottomNavigator(int valor) => indexBottomNavigator = valor;
}
