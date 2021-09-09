import 'package:flutter_modular/flutter_modular.dart';

abstract class IRegistroRepository implements Disposable {
  Future buscarLocaisRetirada();
  Future enviarEmail(String email, String code);
  Future verificaEmail(String email);
  Future registrar(
    String nome,
    String cpf,
    String telefone,
    String genero,
    String email,
    String senhaCripto,
    String localRetirada,
    String endereco,
    String bairro,
    String cidade,
    String cep,
    String estado,
    String numero,
    String complemento,
  );
  Future getData(String email);
}
