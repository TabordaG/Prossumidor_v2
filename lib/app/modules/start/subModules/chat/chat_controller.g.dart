// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ChatController = BindInject(
  (i) => ChatController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatController on _ChatControllerBase, Store {
  final _$listaConversasAtom = Atom(name: '_ChatControllerBase.listaConversas');

  @override
  List<dynamic> get listaConversas {
    _$listaConversasAtom.reportRead();
    return super.listaConversas;
  }

  @override
  set listaConversas(List<dynamic> value) {
    _$listaConversasAtom.reportWrite(value, super.listaConversas, () {
      super.listaConversas = value;
    });
  }

  final _$listaUltimasConversasAtom =
      Atom(name: '_ChatControllerBase.listaUltimasConversas');

  @override
  List<Chat> get listaUltimasConversas {
    _$listaUltimasConversasAtom.reportRead();
    return super.listaUltimasConversas;
  }

  @override
  set listaUltimasConversas(List<Chat> value) {
    _$listaUltimasConversasAtom.reportWrite(value, super.listaUltimasConversas,
        () {
      super.listaUltimasConversas = value;
    });
  }

  final _$chatConversasAtom = Atom(name: '_ChatControllerBase.chatConversas');

  @override
  List<Chat> get chatConversas {
    _$chatConversasAtom.reportRead();
    return super.chatConversas;
  }

  @override
  set chatConversas(List<Chat> value) {
    _$chatConversasAtom.reportWrite(value, super.chatConversas, () {
      super.chatConversas = value;
    });
  }

  final _$conversasAtom = Atom(name: '_ChatControllerBase.conversas');

  @override
  int get conversas {
    _$conversasAtom.reportRead();
    return super.conversas;
  }

  @override
  set conversas(int value) {
    _$conversasAtom.reportWrite(value, super.conversas, () {
      super.conversas = value;
    });
  }

  final _$mensagemAtom = Atom(name: '_ChatControllerBase.mensagem');

  @override
  TextEditingController get mensagem {
    _$mensagemAtom.reportRead();
    return super.mensagem;
  }

  @override
  set mensagem(TextEditingController value) {
    _$mensagemAtom.reportWrite(value, super.mensagem, () {
      super.mensagem = value;
    });
  }

  final _$buscaChatsAsyncAction = AsyncAction('_ChatControllerBase.buscaChats');

  @override
  Future buscaChats() {
    return _$buscaChatsAsyncAction.run(() => super.buscaChats());
  }

  final _$sendMensagemAsyncAction =
      AsyncAction('_ChatControllerBase.sendMensagem');

  @override
  Future sendMensagem(String menssagem, int idCliente, int idEmpresa) {
    return _$sendMensagemAsyncAction
        .run(() => super.sendMensagem(menssagem, idCliente, idEmpresa));
  }

  final _$buscaChatsEmpresaAsyncAction =
      AsyncAction('_ChatControllerBase.buscaChatsEmpresa');

  @override
  Future buscaChatsEmpresa({int id}) {
    return _$buscaChatsEmpresaAsyncAction
        .run(() => super.buscaChatsEmpresa(id: id));
  }

  final _$buscaChatIndividualAsyncAction =
      AsyncAction('_ChatControllerBase.buscaChatIndividual');

  @override
  Future buscaChatIndividual(int idCliente, int idEmpresa) {
    return _$buscaChatIndividualAsyncAction
        .run(() => super.buscaChatIndividual(idCliente, idEmpresa));
  }

  final _$_ChatControllerBaseActionController =
      ActionController(name: '_ChatControllerBase');

  @override
  dynamic setMensagem(String value) {
    final _$actionInfo = _$_ChatControllerBaseActionController.startAction(
        name: '_ChatControllerBase.setMensagem');
    try {
      return super.setMensagem(value);
    } finally {
      _$_ChatControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listaConversas: ${listaConversas},
listaUltimasConversas: ${listaUltimasConversas},
chatConversas: ${chatConversas},
conversas: ${conversas},
mensagem: ${mensagem}
    ''';
  }
}
