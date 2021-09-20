import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/models/usuario/usuario_model.dart';

abstract class IMeusDadosRepository implements Disposable {
  Future alteraDados(String id, nome, cpf, telefone, sexo, endereco, numero,
      complemento, bairro, cidade, cep, estado, nascimento, civil, retirada);
  Future<Usuario> buscaUsuario(int id);
}
