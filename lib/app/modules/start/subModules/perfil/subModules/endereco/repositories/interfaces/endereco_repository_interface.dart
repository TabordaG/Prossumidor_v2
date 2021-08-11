import 'package:flutter_modular/flutter_modular.dart';

abstract class IEnderecoRepository implements Disposable {
  Future alteraDados(String id,  nome, cpf, telefone, sexo, endereco, numero, complemento, bairro,
      cidade, cep, estado, nascimento, civil, retirada); //MODIFICAR ESSA CONSULTA!!!!!
}
