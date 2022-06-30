import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/modules/produtoDetalhes/produto_detalhes_controller.dart';
import 'package:prossumidor_v2/app/modules/produtoDetalhes/repositories/produto_detalhes_repository.dart';
import 'package:prossumidor_v2/app/modules/recuperarSenha/recuperar_senha_controller.dart';
import 'package:prossumidor_v2/app/modules/recuperarSenha/repositories/recuperar_senha_repository.dart';
import 'package:prossumidor_v2/app/modules/registro/registro_controller.dart';
import 'package:prossumidor_v2/app/modules/registro/repositories/registro_repository.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/perfil/subModules/ajuda/ajuda_controller.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/perfil/subModules/endereco/endereco_controller.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/perfil/subModules/endereco/repositories/endereco_repository.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/perfil/subModules/meus_dados/meus_dados_controller.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/perfil/subModules/meus_dados/repositories/meus_dados_repository.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/perfil/subModules/sobre/sobre_controller.dart';
import '../modules/start/start_controller.dart';
import '../modules/start/subModules/chat/chat_controller.dart';
import '../modules/start/subModules/chat/repositories/chat_repository.dart';
import '../modules/start/subModules/home/home_controller.dart';
import '../modules/start/subModules/home/repositories/home_repository.dart';
import '../modules/start/subModules/home/subModules/produtosCategorias/produtos_categorias_controller.dart';
import '../modules/start/subModules/home/subModules/produtosCategorias/repositories/produtos_categorias_repository.dart';
import '../modules/start/subModules/pedidos/pedidos_controller.dart';
import '../modules/start/subModules/pedidos/repositories/pedidos_repository.dart';
import '../modules/start/subModules/perfil/perfil_controller.dart';
import '../modules/start/subModules/perfil/repositories/perfil_repository.dart';
import '../modules/start/subModules/sacola/repositories/sacola_repository.dart';
import '../modules/start/subModules/sacola/sacola_controller.dart';
import '../shared/auth/auth_controller.dart';

final List<Bind> bindRepositories = [
  Bind.lazySingleton((i) => SacolaRepository()),
  Bind.lazySingleton((i) => RecuperarSenhaRepository()),
  Bind.lazySingleton((i) => RegistroRepository()),
  Bind.lazySingleton((i) => PedidosRepository()),
  Bind.lazySingleton((i) => HomeRepository()),
  Bind.lazySingleton((i) => ChatRepository()),
  Bind.lazySingleton((i) => PerfilRepository()),
  Bind.lazySingleton((i) => EnderecoRepository()),
  Bind.lazySingleton((i) => MeusDadosRepository()),
  Bind.lazySingleton((i) => ProdutosCategoriasRepository()),
  Bind.lazySingleton((i) => ProdutoDetalhesRepository()),
];

final bindControllers = [
  Bind.lazySingleton((i) => SacolaController()),
  Bind.lazySingleton((i) => RegistroController()),
  Bind.lazySingleton((i) => RecuperarSenhaController()),
  Bind.lazySingleton((i) => ProdutoDetalhesController()),
  Bind.lazySingleton((i) => PedidosController()),
  Bind.lazySingleton((i) => HomeController()),
  Bind.lazySingleton((i) => ChatController()),
  Bind.lazySingleton((i) => PerfilController()),
  Bind.lazySingleton((i) => ProdutosCategoriasController()),
  Bind.lazySingleton((i) => AuthController()),
  Bind.lazySingleton((i) => StartController()),
  Bind.lazySingleton((i) => EnderecoController()),
  Bind.lazySingleton((i) => MeusDadosController()),
  Bind.lazySingleton((i) => SobreController()),
  Bind.lazySingleton((i) => AjudaController()),
];
