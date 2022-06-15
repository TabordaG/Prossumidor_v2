import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/modules/login/repositories/login_repository.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/perfil/subModules/ajuda/ajuda_controller.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/perfil/subModules/endereco/endereco_controller.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/perfil/subModules/endereco/repositories/endereco_repository.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/perfil/subModules/meus_dados/meus_dados_controller.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/perfil/subModules/meus_dados/repositories/meus_dados_repository.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/perfil/subModules/sobre/repositories/sobre_repository.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/perfil/subModules/sobre/sobre_controller.dart';
import '../modules/Login/login_controller.dart';
import '../modules/Login/repositories/interfaces/login_repository_interface.dart';
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
  Bind((i) => LoginRepository()),
  Bind.lazySingleton((i) => SacolaRepository()),
  Bind.lazySingleton((i) => PedidosRepository()),
  Bind.lazySingleton((i) => HomeRepository()),
  Bind.lazySingleton((i) => ChatRepository()),
  Bind.lazySingleton((i) => PerfilRepository()),
  Bind.lazySingleton((i) => EnderecoRepository()),
  Bind.lazySingleton((i) => MeusDadosRepository()),
  Bind.lazySingleton((i) => ProdutosCategoriasRepository()),
];

final bindControllers = [
  Bind.singleton((i) => LoginController()),
  Bind.lazySingleton((i) => SacolaController()),
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
