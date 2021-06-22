// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sobre_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $SobreController = BindInject(
  (i) => SobreController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SobreController on _SobreControllerBase, Store {
  final _$isExpanded1Atom = Atom(name: '_SobreControllerBase.isExpanded1');

  @override
  bool get isExpanded1 {
    _$isExpanded1Atom.reportRead();
    return super.isExpanded1;
  }

  @override
  set isExpanded1(bool value) {
    _$isExpanded1Atom.reportWrite(value, super.isExpanded1, () {
      super.isExpanded1 = value;
    });
  }

  final _$isExpanded2Atom = Atom(name: '_SobreControllerBase.isExpanded2');

  @override
  bool get isExpanded2 {
    _$isExpanded2Atom.reportRead();
    return super.isExpanded2;
  }

  @override
  set isExpanded2(bool value) {
    _$isExpanded2Atom.reportWrite(value, super.isExpanded2, () {
      super.isExpanded2 = value;
    });
  }

  final _$isExpanded3Atom = Atom(name: '_SobreControllerBase.isExpanded3');

  @override
  bool get isExpanded3 {
    _$isExpanded3Atom.reportRead();
    return super.isExpanded3;
  }

  @override
  set isExpanded3(bool value) {
    _$isExpanded3Atom.reportWrite(value, super.isExpanded3, () {
      super.isExpanded3 = value;
    });
  }

  final _$_SobreControllerBaseActionController =
      ActionController(name: '_SobreControllerBase');

  @override
  dynamic toggleExpanded1() {
    final _$actionInfo = _$_SobreControllerBaseActionController.startAction(
        name: '_SobreControllerBase.toggleExpanded1');
    try {
      return super.toggleExpanded1();
    } finally {
      _$_SobreControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isExpanded1: ${isExpanded1},
isExpanded2: ${isExpanded2},
isExpanded3: ${isExpanded3}
    ''';
  }
}
