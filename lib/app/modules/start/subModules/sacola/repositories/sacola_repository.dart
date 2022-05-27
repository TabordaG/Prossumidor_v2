import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/dados_basicos.dart';
import 'package:prossumidor_v2/app/models/produto/produto_model.dart';

import 'interfaces/sacola_repository_interface.dart';

part 'sacola_repository.g.dart';

@Injectable()
class SacolaRepository implements ISacolaRepository {
  late Dio dio;
  late Response response;

  SacolaRepository() {
    BaseOptions options = BaseOptions(
      receiveDataWhenStatusError: true,
      connectTimeout: 60 * 1000, // 20 seconds
      receiveTimeout: 60 * 1000, // 20 seconds
    );
    dio = Dio(options);
  }

  @override
  Future listarSacola(int usuarioId) async {
    String link =
        Basicos.codifica("${Basicos.ip}/crud/?crud=consulta7.$usuarioId");
    response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );
    // try {
    if (response.data != null && response.statusCode == 200) {
      var respondeDecoded =
          response.data.map<Produto>((json) => Produto.fromJson(json)).toList();
      return respondeDecoded;
    } else {
      return null;
    }
  }

  @override
  Future deletarItemSacola(int carrinhoId) async {
    String link =
        Basicos.codifica("${Basicos.ip}/crud/?crud=consult11.$carrinhoId");
    response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );
    // try {
    if (response.data != null && response.statusCode == 200) {
      var respondeDecoded = Basicos.decodifica(response.data);
      return respondeDecoded;
    } else {
      return null;
    }
  }

  @override
  Future incrementaSacola(int carrinhoId) async {
    String link =
        Basicos.codifica("${Basicos.ip}/crud/?crud=consult12.$carrinhoId");
    response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );
    // try {
    if (response.data != null && response.statusCode == 200) {
      var respondeDecoded = Basicos.decodifica(response.data);
      return respondeDecoded;
    } else {
      return null;
    }
  }

  @override
  Future decrementaSacola(int carrinhoId) async {
    String link =
        Basicos.codifica("${Basicos.ip}/crud/?crud=consult13.$carrinhoId");
    response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );
    // try {
    if (response.data != null && response.statusCode == 200) {
      var respondeDecoded = Basicos.decodifica(response.data);
      return respondeDecoded;
    } else {
      return null;
    }
  }

  @override
  Future alteraDados(
    String id,
    nome,
    cpf,
    telefone,
    sexo,
    endereco,
    numero,
    complemento,
    bairro,
    cidade,
    cep,
    estado,
    nascimento,
    civil,
    retirada,
  ) async {
    String link = Basicos.codifica(
        "${Basicos.ip}/crud/?crud=consult23.$id,$nome,$cpf,$telefone,$sexo,$endereco,$numero,$complemento,$bairro,$cidade,$cep,$estado,$nascimento,$civil,$retirada");
    response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );

    if (response.statusCode == 200) {
      return 'sucesso';
    } else {
      return null;
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Future calcularFrete(int usuarioId) async {
    String link =
        Basicos.codifica("${Basicos.ip}/crud/?crud=consul-29.$usuarioId");
    response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );
    // try {
    if (response.data != null && response.statusCode == 200) {
      var frete = Basicos.decodifica(response.data);
      return frete;
    } else {
      return null;
    }
  }

  @override
  Future inserirTabelaVendas(
    String subTotal,
    String observacoes,
    double frete,
    int clienteId,
    String empresaId,
  ) async {
    String link = Basicos.codifica("${Basicos.ip}/crud/?crud=consulta8."
        "APP_RECOOPSOL," //solicitante,character varying(50) NOT NULL
        //data_venda date NOT NULL,
        "${await retornaObsEmpresa(empresaId)}," //data_entrega date NOT NULL,
        //vencimento date NOT NULL,
        "EM ANDAMENTO," //status_pedido character varying(30) NOT NULL
        "$subTotal," //valor_total numeric(15,2) NOT NULL
        "0.00," //desconto numeric(15,2) NOT NULL,
        "0.00," //saldo_final numeric(15,2) NOT NULL,
        "$observacoes," //observacoes text NOT NULL,
        //data_registro timestamp with time zone NOT NULL,
        //data_alteracao timestamp with time zone NOT NULL,
        " ," //cep character varying(10) NOT NULL,
        " ," //endereco character varying(50) NOT NULL,
        " ," //numero character varying(10) NOT NULL,
        " ," //complemento character varying(30) NOT NULL,
        " ," //bairro character varying(50) NOT NULL,
        " ," //cidade character varying(50) NOT NULL,
        " ," //estado character varying(2) NOT NULL,
        "${frete.toStringAsFixed(2)} ," //observacoes_entrega text NOT NULL,
        "$clienteId," //cliente_id integer NOT NULL,
        "$empresaId");
    response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );
    // try {
    if (response.data != null && response.statusCode == 200) {
      var respondeDecoded = Basicos.decodifica(response.data);
      List list = json.decode(respondeDecoded).cast<Map<String, dynamic>>();
      if (list.isNotEmpty) return list[0]["id"];
    } else {
      return null;
    }
  }

  @override
  Future inserirSaidaProdutos(
    String quantidade,
    String precoVenda,
    String valorTotal,
    String empresaId,
    String produtoId,
    String vendaId,
  ) async {
    String link = Basicos.codifica("${Basicos.ip}/crud/?crud=consulta9."
        "$quantidade," //quantidade numeric(15,3) NOT NULL,
        //data_saida date NOT NULL
        "$precoVenda," //valor_unitario numeric(15,3) NOT NULL,
        "0.0," //percentual_desconto numeric(15,3) NOT NULL,
        "0.0," //total_desconto numeric(15,2) NOT NULL
        "$valorTotal," //valor_total numeric(15,2) NOT NULL,
        "EM SEPARACAO," //status character varying(20) NOT NULL
        "ABERTO," //balanco character varying(20) NOT NULL,
        " ," //observacoes_saida text,
        //data_registro timestamp with time zone NOT NULL,
        //data_alteracao timestamp with time zone NOT NULL,
        "$precoVenda," //saldo_final numeric(15,2) NOT NULL,
        "$empresaId," //empresa_id integer,
        "$produtoId," //produto_id integer NOT NULL,
        "$vendaId"); //venda_id integer NOT NULL,
    response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );
    // try {
    if (response.data != null && response.statusCode == 200) {
      var respondeDecoded = Basicos.decodifica(response.data);
      return respondeDecoded;
    } else {
      return null;
    }
  }

  @override
  Future alterarEstoque(
    String quantidade,
    String produtoId,
  ) async {
    String link = Basicos.codifica("${Basicos.ip}/crud/?crud=consul_18."
        "$quantidade," //id_vendas
        "$produtoId"); //venda_id integer NOT NULL,
    response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );
    // try {
    if (response.data != null && response.statusCode == 200) {
      var respondeDecoded = Basicos.decodifica(response.data);
      return respondeDecoded;
    } else {
      return null;
    }
  }

  @override
  Future inserirContasReceber(
    String subtotal,
    String pagamento,
    String vendaId,
    String frete,
    String clienteId,
    String empresaId,
  ) async {
    String link = Basicos.codifica("${Basicos.ip}/crud/?crud=consult17."
        //data_conta date NOT NULL,
        "$subtotal," //valor_conta numeric(15,2) NOT NULL,
        "A VISTA," //forma_de_pagamento character varying(8) NOT NULL,
        "$pagamento," //meio_de_pagamento character varying(15) NOT NULL,
        "0," //quantidade_parcelas integer NOT NULL,
        //primeiro_vencimento date NOT NULL,
        "0.0," //valor_entrada numeric(15,2) NOT NULL,
        "$vendaId," //documento_vinculado integer,
        "PENDENTE," //status_conta character varying(20) NOT NULL,
        "Pagamento referente ao pedido $vendaId," //descricao character varying(200) NOT NULL,
        //data_registro timestamp with time zone NOT NULL,
        //data_alteracao timestamp with time zone NOT NULL,
        "$frete," //observacoes_conta  recebe o frete
        "$clienteId," //agente_pagador_id integer cliente NOT NULL,
        "$empresaId"); //venda_id integer NOT NULL,
    response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );
    // try {
    if (response.data != null && response.statusCode == 200) {
      var respondeDecoded = Basicos.decodifica(response.data);
      List list = json.decode(respondeDecoded).cast<Map<String, dynamic>>();
      if (list.isNotEmpty) return list[0]["id"];
    } else {
      return null;
    }
  }

  @override
  Future inserePagamentoEmVendas(
    String vendaId,
    String pagamentoId,
  ) async {
    String link = Basicos.codifica("${Basicos.ip}/crud/?crud=consult18."
        "$vendaId," //id_vendas
        "$pagamentoId"); //id_contas_a_receber; //venda_id integer NOT NULL,
    response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );
    // try {
    if (response.data != null && response.statusCode == 200) {
      var respondeDecoded = Basicos.decodifica(response.data);
      return respondeDecoded;
    } else {
      return null;
    }
  }

  @override
  Future alterarStatusPagamento(
    String subtotal,
    String pagamento,
    String vendaId,
    String contasReceberId,
    String empresaId,
  ) async {
    String link = Basicos.codifica("${Basicos.ip}/crud/?crud=consult28."
        //    data_pagamento,
        //    data_vencimento,
        "$subtotal," //valor_pagamento,
        "PENDENTE," //status_pagamento,
        "$pagamento," //meio_pagamento,
        "Pagamento referente ao pedido $vendaId," //observacoes_pagamento,
        //    data_registro,
        //    data_alteracao,
        "$contasReceberId," //conta_id contas a receber,
        "$empresaId");
    response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );
    // try {
    if (response.data != null && response.statusCode == 200) {
      var respondeDecoded = Basicos.decodifica(response.data);
      return respondeDecoded;
    } else {
      return null;
    }
  }

  @override
  Future resetarCarrinho(
    String clienteId,
  ) async {
    String link = Basicos.codifica("${Basicos.ip}/crud/?crud=consult10."
        "$clienteId");
    response = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );
    // try {
    if (response.data != null && response.statusCode == 200) {
      var respondeDecoded = Basicos.decodifica(response.data);
      return respondeDecoded;
    } else {
      return null;
    }
  }

  Future retornaObsEmpresa(String empresa) async {
    String link = Basicos.codifica(
        "${Basicos.ip}/crud/?crud=consul-69.$empresa"); //id_empresa;
    Response<dynamic> res7 = await dio.get(
      Uri.encodeFull(link),
      options: Options(
        headers: {"Accept": "application/json"},
      ),
    );

    var res8 = Basicos.decodifica(res7.data);
    if (res7.data.length >= 2) {
      if (res7.statusCode == 200) {
        List list = json.decode(res8).cast<Map<String, dynamic>>();
        // print(list[0]['observacoes']);
        if (list[0]['observacoes'] == '') return '01-01-1900';
        return list[0]['observacoes'];
      }
    }
  }
}
