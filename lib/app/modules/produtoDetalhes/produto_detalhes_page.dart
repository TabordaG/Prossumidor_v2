import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/constants.dart';
import 'package:prossumidor_v2/app/dados_basicos.dart';
import 'package:prossumidor_v2/app/models/marca/marca_model.dart';
import 'package:prossumidor_v2/app/models/produto/produto_model.dart';
import 'produto_detalhes_controller.dart';

class ProdutoDetalhesPage extends StatefulWidget {
  final Produto? produto;
  // ignore: use_key_in_widget_constructors
  const ProdutoDetalhesPage({this.produto}) : super();

  @override
  _ProdutoDetalhesPageState createState() => _ProdutoDetalhesPageState();
}

class _ProdutoDetalhesPageState
    extends ModularState<ProdutoDetalhesPage, ProdutoDetalhesController> {
  @override
  void initState() {
    // int res = widget.produto!;
    controller.setProduto(widget.produto!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Theme.of(context).textTheme.bodyText1!.color,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              controller.produto!.descricao_simplificada!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 20,
                  ),
            ),
            Observer(builder: (_) {
              return InkWell(
                highlightColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  MarcaProduto marcaProduto = MarcaProduto(
                      marca: Marca(
                          descricao: controller.produto!.marca,
                          id: controller.produto!.marca_produto_id),
                      produtos: []);
                  Modular.to.pushNamed('/home/produtosCategorias', arguments: {
                    'marcaProduto': marcaProduto,
                    'isCategoria': false
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Marca: ',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    Text(
                      controller.produto!.marca!,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    // ),
                  ],
                ),
              );
            }),
          ],
        ),
        centerTitle: true,
        elevation: 4.0,
        actions: [
          Stack(
            children: [
              IconButton(
                splashRadius: 2,
                icon: Icon(
                  Icons.shopping_bag,
                  color: Theme.of(context).textTheme.bodyText1!.color,
                ),
                onPressed: () => Modular.to.pushNamed('/sacola'),
              ),
              Observer(builder: (_) {
                if (!controller.adicionado) return Container();
                return Positioned(
                  left: 11,
                  top: 14,
                  child: Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                );
              }),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            // Center(
            //   child: Padding(
            //     padding: EdgeInsets.only(
            //       top: kDefaultPadding,
            //     ),
            //     child: Observer(builder: (_) {
            //       return Text(
            //         controller.produto.descricao_simplificada,
            //         style: Theme.of(context).textTheme.bodyText1.copyWith(
            //               fontSize: 20,
            //               fontWeight: FontWeight.w700,
            //             ),
            //       );
            //     }),
            //   ),
            // ),
            // Center(
            //   child: Padding(
            //     padding: EdgeInsets.only(
            //       top: kDefaultPadding * .25,
            //     ),
            //     child: Observer(builder: (_) {
            //       return Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           Text(
            //             'Marca: ',
            //             style: Theme.of(context).textTheme.bodyText1.copyWith(
            //                   fontSize: 14,
            //                   color: Theme.of(context).colorScheme.primary,
            //                 ),
            //           ),
            //           // TextButton(
            //           //   style: TextButton.styleFrom(
            //           //       minimumSize: Size(0, 0), padding: EdgeInsets.zero),
            //           //   onPressed: () {
            //           //     MarcaProduto marcaProduto = MarcaProduto(
            //           //         marca: Marca(
            //           //             descricao: controller.produto.marca,
            //           //             id: controller.produto.marca_produto_id),
            //           //         produtos: []);
            //           //     Modular.to.pushNamed('/home/produtosCategorias',
            //           //         arguments: {
            //           //           'marcaProduto': marcaProduto,
            //           //           'isCategoria': false
            //           //         });
            //           //   },
            //           //   child:
            //           InkWell(
            //             child: Text(
            //               controller.produto.marca,
            //               style: Theme.of(context).textTheme.bodyText1.copyWith(
            //                     fontSize: 14,
            //                     color: Theme.of(context).colorScheme.primary,
            //                   ),
            //             ),
            //             onTap: () {
            //               MarcaProduto marcaProduto = MarcaProduto(
            //                   marca: Marca(
            //                       descricao: controller.produto.marca,
            //                       id: controller.produto.marca_produto_id),
            //                   produtos: []);
            //               Modular.to.pushNamed('/home/produtosCategorias',
            //                   arguments: {
            //                     'marcaProduto': marcaProduto,
            //                     'isCategoria': false
            //                   });
            //             },
            //           ),
            //           // ),
            //         ],
            //       );
            //     }),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(
                  top: kDefaultPadding, bottom: kDefaultPadding),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: SizedBox(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Observer(builder: (_) {
                      if (controller.produto!.imagem != "") {
                        return CachedNetworkImage(
                          imageUrl: "${Basicos.ip2}/media/" +
                              controller.produto!.imagem!,
                          placeholder: (context, url) => const Padding(
                            padding: EdgeInsets.all(35.0),
                            child: SizedBox(
                              width: 40,
                              child: CircularProgressIndicator(
                                strokeWidth: 1,
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          fit: BoxFit.contain,
                        );
                      }
                      return const Center(
                        child: Icon(Icons.error),
                      );
                    }),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: kDefaultPadding * .5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      "Preço: ",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 18,
                            // fontWeight: FontWeight.w700,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: kDefaultPadding),
                    child: Observer(builder: (_) {
                      return Text(
                        'R\$ ' +
                            double.parse(controller.produto!.preco_venda!)
                                .toStringAsFixed(2)
                                .replaceAll('.', ','),
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors
                                  .black87, // Theme.of(context).colorScheme.primary,
                            ),
                      );
                    }),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: kDefaultPadding * 0.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Em Estoque: ',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 14,
                          // fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                  ),
                  Observer(builder: (_) {
                    if (controller.produto!.estoque_atual == null) {
                      return const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 1,
                        ),
                      );
                    }
                    return Text(
                      double.parse(controller.produto!.estoque_atual!)
                          .toStringAsFixed(0),
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                    );
                  }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: kDefaultPadding * .5),
              child: Observer(builder: (_) {
                if (controller.produto!.marketing == null) {
                  return const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 1,
                    ),
                  );
                }
                return SizedBox(
                  width: double.infinity,
                  // height: 100,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: kDefaultPadding * 0.5),
                        child: Text(
                          "Categorias: ",
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 14,
                                  ),
                        ),
                      ),
                      Expanded(
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            if (controller.produto!.categorias != null)
                              for (var i = 0;
                                  i < controller.produto!.categorias!.length;
                                  i++)
                                Observer(builder: (_) {
                                  return Card(
                                    color: Colors.white,
                                    shape: const RoundedRectangleBorder(
                                      side: BorderSide(color: kPrimaryColor),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(
                                          kDefaultPadding * .3),
                                      child: Text(
                                        controller
                                            .produto!.categorias![i].descricao!,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                      ),
                                    ),
                                  );
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: kDefaultPadding),
              child: Text(
                'Sobre o Produto:',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 16,
                      // fontWeight: FontWeight.w700,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: kDefaultPadding * 1),
              child: Observer(builder: (_) {
                if (controller.produto!.marketing == null) {
                  return const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 1,
                    ),
                  );
                }
                return Text(
                  controller.produto!.marketing!,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 14,
                      ),
                );
              }),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: kDefaultPadding * .2),
              child: Divider(
                color: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .color!
                    .withOpacity(.2),
                thickness: .8,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Observer(builder: (_) {
                if (controller.produto!.observacoes == null) {
                  return const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 1,
                    ),
                  );
                }
                return Text(
                  controller.produto!.observacoes!,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 14,
                      ),
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: kDefaultPadding * .8,
                bottom: kDefaultPadding,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: kDefaultPadding * 5),
                    child: Text(
                      'Unidade',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  Observer(builder: (_) {
                    return Text(
                      controller.produto!.unidade_medida!,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 14,
                          ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        width: double.infinity,
        color: Theme.of(context).primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () => controller.decrement(),
                  child: Card(
                    elevation: 4,
                    color: Theme.of(context).colorScheme.secondary,
                    child: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 40,
                  child: Center(
                    child: Observer(builder: (_) {
                      return Text(
                        controller.value.toString(),
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                      );
                    }),
                  ),
                ),
                InkWell(
                  onTap: () => controller.increment(context),
                  child: Card(
                    elevation: 4,
                    color: Colors.white,
                    child: Icon(
                      Icons.add,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                // : Colors.white,
                // elevation 24,
              ),
              onPressed: () {
                controller.adicionarSacola(context);
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    // retorna um objeto do tipo Dialog
                    return AlertDialog(
                      content: Observer(builder: (_) {
                        if (controller.adicionandoSacola) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              CircularProgressIndicator(
                                strokeWidth: 1,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Adicionando...",
                                style: TextStyle(color: Colors.black54),
                              ),
                            ],
                          );
                        }
                        return Text(
                          controller.adicionarMensagem,
                          style: TextStyle(
                            color: Colors.black.withOpacity(.7),
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        );
                      }),
                    );
                  },
                );
              },
              child: Text(
                'Adicionar a Sacola',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 16,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
