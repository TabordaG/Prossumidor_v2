// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/components/cards.dart';
import 'package:prossumidor_v2/app/models/produto/produto_model.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/home/home_controller.dart';

class SearchPage extends StatefulWidget {
  const SearchPage() : super();
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  HomeController controller = Modular.get<HomeController>();

  late ScrollController scrollController;

  scrollListener() async {
    if (scrollController.position.atEdge &&
        scrollController.position.pixels > 0) {
      List<Produto> res = await controller.pesquisarMaisProdutos();
      if (res.isEmpty) {
        const snackBar = SnackBar(
          content: Text('Não foi encontrado mais produtos'),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            controller.resetBuscarString();
            Navigator.of(context).pop();
          },
        ),
        title: const Text("Buscar Produto"),
      ),
      body: Column(
        children: [
          Card(
            elevation: 2,
            color: Colors.white,
            child: Form(
              child: Observer(builder: (_) {
                return TextFormField(
                  controller: controller.buscarString,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.search,
                  textCapitalization: TextCapitalization.words,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Insira uma busca válida';
                    } else {
                      if (value.length < 3) {
                        return "A busca precisa ter pelo menos 3 caracteres";
                      } else {
                        return null;
                      }
                    }
                  },
                  onFieldSubmitted: (value) {
                    // if (controller.buscarString.text.length >= 3) {
                    controller.pesquisarProduto();
                    // } else {
                    //   final snackBar = SnackBar(
                    //     content:
                    //         Text('A busca precisa ter pelo menos 3 caracteres'),
                    //   );

                    //   Scaffold.of(context).showSnackBar(snackBar);
                    // }
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                      top: 14.0,
                    ),
                    fillColor: Theme.of(context).cardColor,
                    border: InputBorder.none,
                    prefixIcon: IconButton(
                      splashRadius: 2,
                      onPressed: () {
                        // if (controller.buscarString.text.length >= 3) {
                        controller.pesquisarProduto();
                        // } else {
                        //   final snackBar = SnackBar(
                        //     content: Text(
                        //         'A busca precisa ter pelo menos 3 caracteres'),
                        //   );

                        //   Scaffold.of(context).showSnackBar(snackBar);
                        // }
                      },
                      icon: Icon(
                        Icons.search,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => controller.resetBuscarString(),
                    ),
                    hintText: 'Produto',
                  ),
                );
              }),
            ),
          ),
          Expanded(
            child: Observer(builder: (_) {
              if (controller.buscandoProdutos) {
                return const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 1,
                  ),
                );
              }
              if (!controller.buscandoProdutos &&
                  controller.produtosDaBusca.isEmpty) {
                return const Center(
                  child: Text(
                    "Produto não encotrado\nAltere a pesquisa e tente novamente.",
                    textAlign: TextAlign.center,
                  ),
                );
              }
              return Scrollbar(
                controller: scrollController,
                thickness: 5,
                radius: const Radius.circular(5),
                child: GridView.count(
                  controller: scrollController,
                  physics: const BouncingScrollPhysics(),
                  primary: false,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: List.generate(
                    controller.produtosDaBusca.length,
                    (index) => CardHome(
                      index: index,
                      produto: controller.produtosDaBusca[index],
                      verDetalhes: () => Modular.to.pushNamed(
                        '/produtoDetalhes',
                        arguments: {
                          'produto': controller.produtosDaBusca[index],
                        },
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
          Observer(builder: (_) {
            return Center(
              child: controller.buscandoMaisProdutos
                  ? const CircularProgressIndicator(
                      strokeWidth: 1,
                    )
                  : Container(),
              // : TextButton(
              //     onPressed: () async {
              //       List<Produto> res =
              //           await controller.pesquisarMaisProdutos();
              //       if (res.isEmpty) {
              //         final snackBar = SnackBar(
              //           content: Text('Não foi encontrado mais produtos'),
              //         );

              //         Scaffold.of(context).showSnackBar(snackBar);
              //       }
              //     },
              //     child: Text("Ver Mais"),
              //   ),
            );
          }),
        ],
      ),
    );
  }
}
