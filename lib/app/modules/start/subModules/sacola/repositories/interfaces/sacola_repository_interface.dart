import 'package:flutter_modular/flutter_modular.dart';

abstract class ISacolaRepository implements Disposable {
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
  );
  Future listarSacola(int usuarioId);
  Future calcularFrete(int usuarioId);
  Future inserirTabelaVendas(
    String subTotal,
    String observacoes,
    double frete,
    int clienteId,
    String empresaId,
  );
  Future inserirSaidaProdutos(
    String quantidade,
    String precoVenda,
    String valorTotal,
    String empresaId,
    String produtoId,
    String vendaId,
  );
  Future alterarEstoque(
    String quantidade,
    String produtoId,
  );
  Future inserirContasReceber(
    String subtotal,
    String pagamento,
    String vendaId,
    String frete,
    String clienteId,
    String empresaId,
  );
  Future inserePagamentoEmVendas(
    String vendaId,
    String pagamentoId,
  );
  Future alterarStatusPagamento(
    String subtotal,
    String pagamento,
    String vendaId,
    String contasReceberId,
    String empresaId,
  );
  Future resetarCarrinho(String clienteId);
  Future incrementaSacola(int carrinhoId);
  Future decrementaSacola(int carrinhoId);
  Future deletarItemSacola(int carrinhoId);
}
