// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $AppController = BindInject(
  (i) => AppController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppController on _AppControllerBase, Store {
  final _$indexBottomNavigatorAtom =
      Atom(name: '_AppControllerBase.indexBottomNavigator');

  @override
  int get indexBottomNavigator {
    _$indexBottomNavigatorAtom.reportRead();
    return super.indexBottomNavigator;
  }

  @override
  set indexBottomNavigator(int value) {
    _$indexBottomNavigatorAtom.reportWrite(value, super.indexBottomNavigator,
        () {
      super.indexBottomNavigator = value;
    });
  }

  final _$_AppControllerBaseActionController =
      ActionController(name: '_AppControllerBase');

  @override
  dynamic setIndexBottomNavigator(int valor) {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction(
        name: '_AppControllerBase.setIndexBottomNavigator');
    try {
      return super.setIndexBottomNavigator(valor);
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
indexBottomNavigator: ${indexBottomNavigator}
    ''';
  }
}
