import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/app_controller.dart';
import 'package:prossumidor_v2/app/dados_basicos.dart';
import 'package:prossumidor_v2/app/models/produto/produto_model.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/home/home_controller.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/sacola/repositories/sacola_repository.dart';
import 'package:prossumidor_v2/app/shared/auth/auth_controller.dart';

part 'sacola_controller.g.dart';

@Injectable()
class SacolaController = _SacolaControllerBase with _$SacolaController;

abstract class _SacolaControllerBase with Store {
  final AuthController authController = Modular.get<AuthController>();
  final HomeController homeController = Modular.get<HomeController>();
  final SacolaRepository sacolaRepository = Modular.get<SacolaRepository>();
  final AppController appController = Modular.get<AppController>();

  _SacolaControllerBase() {
    endereco = TextEditingController(text: authController.usuario.endereco);
    numero = TextEditingController(text: authController.usuario.numero);
    complemento =
        TextEditingController(text: authController.usuario.complemento);
    bairro = TextEditingController(text: authController.usuario.bairro);
    cidade = TextEditingController(text: authController.usuario.cidade);
    uf = TextEditingController(text: authController.usuario.estado);
    cep = TextEditingController(text: authController.usuario.cep);
  }

  @observable
  double total = 0.0;

  @observable
  double subtotal = 0.0;

  @observable
  int entrega = 0;

  @action
  setEntrega(int valor) {
    entrega = valor;
    if (valor == 1) {
      setFrete(0.0);
      total = subtotal;
    } else {
      calcularFrete();
    }
  }

  List pagamentoText = [
    "Dinheiro",
    "Cartão Crédito",
    "Cartão Débito",
    "Pix",
    "Outros"
  ];

  @observable
  int pagamento = 0;

  @action
  setPagamento(int valor) => pagamento = valor;

  @observable
  double frete = 0.0;

  @action
  setFrete(double valor) => frete = valor;

  @action
  increment(int index) async {
    if (double.parse(listaProdutos[index].quantidade) <
        double.parse(listaProdutos[index].estoque_atual)) {
      listaProdutos[index].quantidade =
          (double.parse(listaProdutos[index].quantidade) + 1).toString();
      subtotal += double.parse(listaProdutos[index].preco_venda);
      await sacolaRepository.incrementaSacola(listaProdutos[index].carrinhoid);
    }
  }

  @action
  decrement(int index) async {
    if (double.parse(listaProdutos[index].quantidade) > 1) {
      listaProdutos[index].quantidade =
          (double.parse(listaProdutos[index].quantidade) - 1).toString();
      subtotal -= double.parse(listaProdutos[index].preco_venda);
      await sacolaRepository.decrementaSacola(listaProdutos[index].carrinhoid);
    }
  }

  @action
  deletarItem(int index) async {
    var res = await sacolaRepository
        .deletarItemSacola(listaProdutos[index].carrinhoid);
    if (res != null) {
      buscarProdutos();
    }
  }

  @observable
  GlobalKey<FormState> formkeyPage = new GlobalKey<FormState>();

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

  @action
  isPageValid() {
    if (formkeyPage.currentState.validate())
      pageValid = true;
    else
      pageValid = false;
  }

  @action
  atualizaDados() async {
    authController.usuario.endereco = endereco.text;
    authController.usuario.numero = numero.text;
    authController.usuario.complemento = complemento.text;
    authController.usuario.bairro = bairro.text;
    authController.usuario.cidade = cidade.text;
    authController.usuario.estado = uf.text;
    authController.usuario.cep = cep.text;
    //authController.usuario.empresa = dropdownvalue;

    endereco = TextEditingController(text: authController.usuario.endereco);
    numero = TextEditingController(text: authController.usuario.numero);
    bairro = TextEditingController(text: authController.usuario.bairro);
    complemento =
        TextEditingController(text: authController.usuario.complemento);

    int retiradaId = authController.localRetirada[0]['id'];
    String response = await sacolaRepository.alteraDados(
      authController.usuario.id.toString(),
      removeCaracterEspecial(authController.usuario.nome_razao_social),
      authController.usuario.cpf_cnpj,
      authController.usuario.telefone,
      authController.usuario.sexo.toUpperCase().toString(),
      removeCaracterEspecial(endereco.text),
      numero.text,
      removeCaracterEspecial(complemento.text),
      removeCaracterEspecial(bairro.text),
      removeCaracterEspecial(cidade.text),
      removeCaracterEspecial(cep.text),
      removeCaracterEspecial(uf.text),
      formataDataYYYYmmdd(authController.usuario.data_nascimento_fundacao),
      removeCaracterEspecial(authController.usuario.estado_civil),
      retiradaId,
    );

    if (response != null) calcularFrete();
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

  @observable
  List<Produto> listaProdutos = [];

  @observable
  bool carregandoProdutos = false;

  @action
  buscarProdutos() async {
    carregandoProdutos = true;
    List<Produto> produtos =
        await sacolaRepository.listarSacola(authController.usuario.id);
    if (produtos != null) listaProdutos = List.from(produtos);
    subtotal = 0.0;
    for (var item in listaProdutos) {
      subtotal +=
          double.parse(item.preco_venda) * double.parse(item.quantidade);
    }
    carregandoProdutos = false;

    calcularFrete();
  }

  @action
  calcularFrete() async {
    var res = await sacolaRepository.calcularFrete(authController.usuario.id);
    if (res != null) {
      if (listaProdutos.isEmpty) {
        frete = 0.0;
      } else {
        frete = double.parse(res);
      }
    } else {
      frete = 0.0;
    }
    total = subtotal + frete;
  }

  @observable
  bool pedidoFinalizado = false;

  @observable
  String adicionarMensagem = "";

  @action
  inserePedido() async {
    pedidoFinalizado = false;
    String obs = '';
    if (frete == 0.0)
      obs = 'Retirar no Local';
    else
      obs = 'Entrega em Domicílio';

    // for (int w = 0; w < num_pedidos; w++) {
    //insere pedido tabela de vendas
    var res1 = await sacolaRepository.inserirTabelaVendas(
      subtotal.toString(),
      obs,
      frete,
      authController.usuario.id,
      authController.usuario.empresa_id.toString(),
    );

    if (res1 != null) {
      print(res1);
      listaProdutos.forEach((item) async {
        var res2 = await sacolaRepository.inserirSaidaProdutos(
          item.quantidade.toString(),
          item.preco_venda.toString(),
          (double.parse(item.quantidade) * double.parse(item.preco_venda))
              .toString(),
          authController.usuario.empresa_id.toString(),
          item.id.toString(),
          res1.toString(),
        );

        if (res2 != null) {
          var res3 = await sacolaRepository.alterarEstoque(
            item.quantidade.toString(),
            item.id.toString(),
          );
          if (res3 != null) print(res3);
        }
      });

      var res4 = await sacolaRepository.inserirContasReceber(
        subtotal.toString(),
        pagamentoText[pagamento],
        res1.toString(),
        frete.toString(),
        authController.usuario.id.toString(),
        authController.usuario.empresa_id.toString(),
      );
      if (res4 != null) {
        print(res4);
        var res5 = await sacolaRepository.inserePagamentoEmVendas(
            res1.toString(), res4.toString());
        if (res5 != null) print(res5);

        var res6 = await sacolaRepository.alterarStatusPagamento(
            subtotal.toString(),
            pagamentoText[pagamento],
            res1.toString(),
            res4.toString(),
            authController.usuario.empresa_id.toString());
        if (res6 != null) print(res6);
      }

      var res7 = await sacolaRepository
          .resetarCarrinho(authController.usuario.id.toString());
      if (res7 != null) print(res7);

      adicionarMensagem = "Pedido realizado com sucesso";
    } else {
      adicionarMensagem =
          "Erro ao registrar, verifique seus pedidos e tente novamente";
    }

    await Future.delayed(Duration(seconds: 1), () {
      pedidoFinalizado = true;
    });
  }
}
