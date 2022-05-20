import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/home/home_controller.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/perfil/perfil_controller.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/perfil/subModules/endereco/repositories/interfaces/endereco_repository_interface.dart';
import 'package:prossumidor_v2/app/shared/auth/auth_controller.dart';

part 'endereco_controller.g.dart';

@Injectable()
class EnderecoController = _EnderecoControllerBase with _$EnderecoController;

abstract class _EnderecoControllerBase with Store {
  _EnderecoControllerBase() {
    buscaUser();
    getLocalRetirada();
  }
  final IEnderecoRepository enderecoRepository =
      Modular.get<IEnderecoRepository>();
  final AuthController authController = Modular.get<AuthController>();
  final PerfilController perfilController = Modular.get<PerfilController>();
  final HomeController homeController = Modular.get<HomeController>();

  @observable
  GlobalKey<FormState> formkeyPage = GlobalKey<FormState>();

  @observable
  TextEditingController endereco = TextEditingController();

  @observable
  TextEditingController numero = TextEditingController();

  @observable
  TextEditingController complemento = TextEditingController();

  @observable
  TextEditingController bairro = TextEditingController();

  @observable
  TextEditingController cidade = TextEditingController();

  @observable
  TextEditingController uf = TextEditingController();

  @observable
  TextEditingController cep = TextEditingController();

  @observable
  bool pageValid = false;

  @observable
  String? dropdownvalue;

  @observable
  List<String> listLocalRetirada = [];

  @observable
  String? idRetirada;

  @action
  mudaDropDown(String value) => dropdownvalue = value;

  @action
  isPageValid() {
    if (formkeyPage.currentState!.validate()) {
      pageValid = true;
    } else {
      pageValid = false;
    }
  }

  @action
  buscaUser() async {
    authController.usuario =
        await enderecoRepository.buscaUsuario(authController.usuario!.id);
    endereco = TextEditingController(text: authController.usuario!.endereco);
    numero = TextEditingController(text: authController.usuario!.numero);
    complemento =
        TextEditingController(text: authController.usuario!.complemento);
    bairro = TextEditingController(text: authController.usuario!.bairro);
    cidade = TextEditingController(
        text: authController.usuario!.cidade![0].toUpperCase() +
            authController.usuario!.cidade!.substring(1));
    uf = TextEditingController(
        text: authController.usuario!.estado!.toUpperCase());
    cep = TextEditingController(
        text: removeCaracterEspecial(authController.usuario!.cep!)
                .substring(0, 5) +
            "-" +
            removeCaracterEspecial(authController.usuario!.cep!).substring(5));
  }

  @action
  getLocalRetirada() {
    authController.localRetirada!
        .sort((a, b) => a['id'].toString().compareTo(b['id'].toString()));

    for (var element in authController.localRetirada!) {
      listLocalRetirada
          .add(element['id'].toString() + ' - ' + element['nome'].toString());
      if (element['id'].toString() ==
          authController.usuario!.local_retirada_id.toString()) {
        idRetirada = element['id'].toString();
        authController.localRetiradaAtual =
            element['id'].toString() + ' - ' + element['nome'].toString();
        dropdownvalue =
            element['id'].toString() + ' - ' + element['nome'].toString();
      }
    }
  }

  @action
  Future atualizaDados() async {
    String response = await enderecoRepository.alteraDados(
        authController.usuario!.id.toString(),
        removeCaracterEspecial(authController.usuario!.nome_razao_social!),
        authController.usuario!.cpf_cnpj,
        authController.usuario!.telefone,
        authController.usuario!.sexo!.toUpperCase().toString(),
        removeCaracterEspecial(endereco.text),
        numero.text,
        removeCaracterEspecial(complemento.text),
        removeCaracterEspecial(bairro.text),
        removeCaracterEspecial(cidade.text),
        removeCaracterEspecial(cep.text),
        removeCaracterEspecial(uf.text),
        formataDataYYYYmmdd(authController.usuario!.data_nascimento_fundacao!),
        removeCaracterEspecial(authController.usuario!.estado_civil!),
        dropdownvalue!.substring(0, dropdownvalue!.indexOf(' - ')));
    await buscaUser();
    // authController.usuario.endereco = endereco.text;
    // authController.usuario.numero = numero.text;
    // authController.usuario.complemento = complemento.text;
    // authController.usuario.bairro = bairro.text;
    // authController.usuario.cidade = cidade.text;
    // authController.usuario.estado = uf.text;
    // authController.usuario.cep = cep.text;
    // authController.usuario.empresa = dropdownvalue;
    perfilController.centroDistribuicao =
        dropdownvalue!.substring(dropdownvalue!.indexOf('-')).substring(2);
    authController.centroDistribuicao =
        dropdownvalue!.substring(dropdownvalue!.indexOf('-')).substring(2);
    return response;
  }

  String removeCaracterEspecial(String texto) {
    // remove aspas, virgula e *
    String nova = texto
        .replaceAll("(", "")
        .replaceAll(")", "")
        .replaceAll(",", "")
        .replaceAll("\"", "")
        .replaceAll("*", "")
        .replaceAll("'", "")
        .replaceAll("-", "")
        .replaceAll(".", "");
    // String nova1 = nova.replaceAll(")", "");
    // String nova2 = nova1.replaceAll(",", "");
    // String nova3 = nova2.replaceAll("\"", "");
    // String nova4 = nova3.replaceAll("*", "");
    // String nova5 = nova4.replaceAll("'", "");
    // String novaf = nova5.replaceAll("-", "");
    // String novaf = nova5.replaceAll(".", "");
    return nova;
  }

  String formataDataYYYYmmdd(String text) {
    // formata data inverte data padrao dd/mm/aaaa para  aaaa-mm-dd
    if (text != null) {
      String dia, mes, ano;
      ano = text.substring(0, 4);
      mes = text.substring(5, 7);
      dia = text.substring(8, 10);
      return ano + '-' + mes + '-' + dia;
    }
    return '';
  }

  String formataDataddmmYYYY(String text) {
    // formata data inverte data padrao aaaa-mm-dd para dd/mm/aaaa
    if (text != null) {
      String dia, mes, ano;
      //print(text);
      dia = text.substring(0, 2);
      mes = text.substring(3, 5);
      ano = text.substring(6, 10);
      return dia + '/' + mes + '/' + ano;
    }
    return '';
  }
}
