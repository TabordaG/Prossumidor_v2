import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/perfil/subModules/meus_dados/repositories/interfaces/meus_dados_repository_interface.dart';
import 'package:prossumidor_v2/app/shared/auth/auth_controller.dart';

part 'meus_dados_controller.g.dart';

@Injectable()
class MeusDadosController = _MeusDadosControllerBase with _$MeusDadosController;

abstract class _MeusDadosControllerBase with Store {
  _MeusDadosControllerBase() {
    buscaUser();
  }
  final AuthController authController = Modular.get<AuthController>();
  final IMeusDadosRepository meusdadosRepository =
      Modular.get<IMeusDadosRepository>();

  @observable
  GlobalKey<FormState> formkeyPage = new GlobalKey<FormState>();

  @observable
  TextEditingController nome = TextEditingController();

  @observable
  TextEditingController cpf = TextEditingController();

  @observable
  TextEditingController celular = TextEditingController();

  @observable
  TextEditingController genero = TextEditingController();

  @observable
  int generoId;

  @observable
  TextEditingController generoOutro = TextEditingController();

  @observable
  TextEditingController dataNascimento = TextEditingController();

  @observable
  String estadoCivil;

  @observable
  List<String> listEstadoCivil = [
    'Não Selecionado',
    'solteiro',
    'casado',
    'divorciado'
  ];

  @observable
  TextEditingController localRetirada = TextEditingController();

  @observable
  bool pageValid = false;

  @action
  setGenero(int value) {
    if (value == 0) {
      genero.text = 'MASCULINO';
      generoId = value;
    }
    if (value == 1) {
      genero.text = 'FEMININO';
      generoId = value;
    }
  }

  @action
  mudaDropDown(String value) => estadoCivil = value;

  @action
  isPageValid() {
    if (formkeyPage.currentState.validate())
      pageValid = true;
    else
      pageValid = false;
  }

  @action
  buscaUser() async {
    authController.usuario =
        await meusdadosRepository.buscaUsuario(authController.usuario.id);
    getLocalRetirada();
    nome =
        TextEditingController(text: authController.usuario.nome_razao_social);
    cpf = TextEditingController(text: authController.usuario.cpf_cnpj);
    print("telefone " + authController.usuario.telefone);
    print("celular" + authController.usuario.celular);
    print("contato" + authController.usuario.contato);
    celular = TextEditingController(text: authController.usuario.celular);
    genero = TextEditingController(text: authController.usuario.sexo);
    generoId = authController.usuario.sexo == 'MASCULINO'
        ? 0
        : authController.usuario.sexo == 'FEMININO'
            ? 1
            : 2;

    //generoOutro = TextEditingController(text: authController.usuario.sexo);
    dataNascimento = TextEditingController(
        text: formataDataddmmYYYY(
            authController.usuario.data_nascimento_fundacao));
    estadoCivil = authController.usuario.estado_civil != null &&
            authController.usuario.estado_civil.isNotEmpty
        ? authController.usuario.estado_civil
        : 'Não Selecionado';
    localRetirada =
        TextEditingController(text: authController.localRetiradaAtual);
  }

  @action
  getLocalRetirada() {
    authController.localRetirada
        .sort((a, b) => a['id'].toString().compareTo(b['id'].toString()));

    authController.localRetirada.forEach((element) {
      if (element['id'].toString() ==
          authController.usuario.local_retirada_id.toString()) {
        authController.localRetiradaAtual =
            element['id'].toString() + ' - ' + element['nome'].toString();
      }
    });
  }

  @action
  Future atualizaDados() async {
    String response = await meusdadosRepository.alteraDados(
        authController.usuario.id.toString(),
        removeCaracterEspecial(nome.text),
        removeCaracterEspecial(cpf.text),
        removeCaracterEspecial(celular.text),
        genero.text.toUpperCase(),
        removeCaracterEspecial(authController.usuario.endereco),
        authController.usuario.numero,
        removeCaracterEspecial(authController.usuario.complemento),
        removeCaracterEspecial(authController.usuario.bairro),
        removeCaracterEspecial(authController.usuario.cidade),
        removeCaracterEspecial(authController.usuario.cep),
        removeCaracterEspecial(authController.usuario.estado),
        formataDataYYYYmmdd(dataNascimento.text),
        removeCaracterEspecial(estadoCivil),
        authController.usuario.local_retirada_id.toString());
    await buscaUser();
    if (response == null)
      print('erro de requisição');
    else if (response == 'sucesso') print('sucesso na requisição');
    return response;
  }

  String removeCaracterEspecial(String texto) {
    // remove aspas, virgula e *
    String nova = texto.replaceAll("(", "");
    String nova1 = nova.replaceAll(")", "");
    String nova2 = nova1.replaceAll(",", "");
    String nova3 = nova2.replaceAll("-", "");
    String nova4 = nova3.replaceAll("*", "");
    String nova5 = nova4.replaceAll("-", "");
    String novaf = nova5.replaceAll("'", "");
    return novaf;
  }

  String formataDataYYYYmmdd(String text) {
    // formata data inverte data padrao dd/mm/aaaa para  aaaa-mm-dd
    if (text != null) {
      String dia, mes, ano;
      dia = text.substring(0, 2);
      mes = text.substring(3, 5);
      ano = text.substring(6, 10);
      return ano + '-' + mes + '-' + dia;
    }
    return '';
  }

  String formataDataddmmYYYY(String text) {
    // formata data inverte data padrao aaaa-mm-dd para dd/mm/aaaa
    if (text != null) {
      String dia, mes, ano;
      //print(text);
      ano = text.substring(0, 4);
      mes = text.substring(5, 7);
      dia = text.substring(8, 10);
      return dia + '/' + mes + '/' + ano;
    }
    return '';
  }
}
