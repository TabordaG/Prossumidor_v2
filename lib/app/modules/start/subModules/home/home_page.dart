import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/constants.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/home/componentes/search_page.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/home/componentes/widgetHome.dart';
import 'package:prossumidor_v2/app/shared/auth/auth_controller.dart';
import '../../../../dados_basicos.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({this.title = "Home"}) : super();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: SafeArea(
          child: HomeListView(),
        ),
      ),
    );
  }
}

class HomeListView extends StatefulWidget {
  const HomeListView() : super();

  @override
  _HomeListViewState createState() => _HomeListViewState();
}

class _HomeListViewState extends State<HomeListView> {
  final AuthController authController = Modular.get<AuthController>();
  final HomeController controller = Modular.get<HomeController>();

  @override
  void initState() {
    super.initState();
    controller.iniciarHome();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Container(
        color: Colors.white,
        child: RefreshIndicator(
          displacement: 60.0,
          color: Theme.of(context).primaryColor,
          onRefresh: () => controller.iniciarHome(),
          child: ListView(
            controller: controller.scrollController,
            physics: BouncingScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: kDefaultPadding,
                  right: kDefaultPadding,
                  top: kDefaultPadding * 1,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              authController.usuario != null
                                  ? 'Olá, ${authController.usuario.nome_razao_social}'
                                  : 'Olá, ...',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Bem vindo a ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .color
                                          .withOpacity(.6),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                              ),
                              Text(
                                'Recoopsol',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .color
                                          .withOpacity(.8),
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image(
                          width: 65,
                          image: AssetImage("assets/images/newLogo_1.png"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Row(
              //   children: [
              //     Padding(
              //       padding: EdgeInsets.fromLTRB(
              //         kDefaultPadding,
              //         kDefaultPadding * 0.25,
              //         kDefaultPadding * 0.1,
              //         kDefaultPadding * 0.25,
              //       ),
              //       child: Text(
              //         "Centro de Distribuição:",
              //         textAlign: TextAlign.start,
              //         style: Theme.of(context).textTheme.bodyText1.copyWith(
              //               color: Theme.of(context)
              //                   .textTheme
              //                   .bodyText1
              //                   .color
              //                   .withOpacity(.6),
              //               fontWeight: FontWeight.w600,
              //               fontSize: 12,
              //             ),
              //       ),
              //     ),
              //     Observer(builder: (_) {
              //       return Text(
              //         "${authController.centroDistribuicao}",
              //         textAlign: TextAlign.start,
              //         style: Theme.of(context).textTheme.bodyText1.copyWith(
              //               color: Theme.of(context)
              //                   .textTheme
              //                   .bodyText1
              //                   .color
              //                   .withOpacity(.6),
              //               fontWeight: FontWeight.bold,
              //               fontSize: 12,
              //             ),
              //       );
              //     }),
              //   ],
              // ),
              Padding(
                padding: EdgeInsets.only(
                  top: kDefaultPadding * 0.5,
                  bottom: kDefaultPadding * .5,
                  left: kDefaultPadding,
                  right: kDefaultPadding,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Observer(builder: (_) {
                        return TextFormField(
                          controller: controller.buscarString,
                          onFieldSubmitted: (value) {
                            // if (controller.buscarString.text.length >= 3) {
                            controller.pesquisarProduto();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SearchPage(),
                              ),
                            );
                            // } else {
                            //   final snackBar = SnackBar(
                            //     content: Text(
                            //         'A pesquisa precisa ter mais de 3 letras'),
                            //   );

                            //   Scaffold.of(context).showSnackBar(snackBar);
                            // }
                          },
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.search,
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                              top: 14.0,
                            ),
                            filled: true,
                            fillColor: Theme.of(context).cardColor,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24.0),
                              // borderSide: BorderSide(
                              //   color: Theme.of(context).cardColor,
                              // ),
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: IconButton(
                              splashRadius: 2,
                              onPressed: () {
                                // if (controller.buscarString.text.length >= 3) {
                                controller.pesquisarProduto();
                                //   Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => SearchPage()),
                                //   );
                                // } else {
                                //   final snackBar = SnackBar(
                                //     content: Text(
                                //         'A pesquisa precisa ter mais de 3 letras'),
                                //   );

                                //   Scaffold.of(context).showSnackBar(snackBar);
                                // }
                              },
                              icon: Icon(
                                Icons.search,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            hintText: 'Produto',
                          ),
                        );
                      }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: kDefaultPadding * .5),
                      child: InkWell(
                        onTap: () async {
                          if (controller.listaMarcas == null ||
                              controller.listaMarcas.length <= 1)
                            controller.buscarMarcas();
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              // return FiltroHome();
                              return buildFiltroHome(context);
                            },
                          );
                        },
                        child: Container(
                          width: 90,
                          height: 47,
                          padding: EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: Color(0xFFF6F6F6),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                spreadRadius: 0,
                                blurRadius: .2,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 2.0),
                                  child: Text(
                                    "Filtro", //controller.marcaSelecionada,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right,
                                  color: kPrimaryColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Text(
                  'Não se esqueça de efetuar as compras até quarta!',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontSize: 12,
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .color
                            .withOpacity(.8),
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: kDefaultPadding * .75,
                  left: kDefaultPadding,
                  right: kDefaultPadding,
                ),
                child: Observer(builder: (_) {
                  return controller.banner == []
                      ? Container()
                      : Container(
                          height: 115,
                          decoration: BoxDecoration(
                            color: Color(0xFFF6F6F6),
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                spreadRadius: 0,
                                blurRadius: 1,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                          child: CarouselSlider(
                            options: CarouselOptions(
                              height: 110,
                              enlargeCenterPage: false,
                              viewportFraction: 1,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 10),
                              // onPageChanged: (index, reason) {
                              //   commands.setIndex(index);
                              // },
                            ),
                            items: controller.banner.map((item) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Container(
                                        height: 110,
                                        width: double.infinity,
                                        child: CachedNetworkImage(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          imageUrl:
                                              '${Basicos.ip2}/media/$item',
                                          fit: BoxFit.cover,
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        )),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                        );
                }),
              ),
              Observer(builder: (_) {
                if (controller.refreshPage)
                  return Padding(
                    padding: EdgeInsets.only(
                      top: 60,
                      // left: MediaQuery.of(context).size.width * .5 - 42,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          strokeWidth: 1,
                        ),
                      ],
                    ),
                  );
                return ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.marcaSelecionada == "Todas Categorias"
                      ? controller.listaCategoriaProdutos.length
                      : controller.listaMarcaProdutos.length,
                  itemBuilder: (context, indexItem) {
                    return Observer(builder: (_) {
                      return WidgetHome(
                        indexItem: indexItem,
                        isCategoria:
                            controller.marcaSelecionada == "Todas Categorias"
                                ? true
                                : false,
                        verMais: () {
                          Navigator.of(context).pushNamed(
                            '/produtosCategorias',
                            arguments: {
                              'categoriaProduto': controller.marcaSelecionada ==
                                      "Todas Categorias"
                                  ? controller.listaCategoriaProdutos[indexItem]
                                  : null,
                              'marcaProduto': controller.marcaSelecionada !=
                                      "Todas Categorias"
                                  ? controller.listaMarcaProdutos[indexItem]
                                  : null,
                              'isCategoria': controller.marcaSelecionada ==
                                      "Todas Categorias"
                                  ? true
                                  : false,
                            },
                          );
                        },
                      );
                    });
                  },
                );
              }),
            ],
          ),
        ),
      );
    });
  }

  AlertDialog buildFiltroHome(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      insetPadding: EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 60.0),
      content: Column(
        children: [
          Observer(builder: (_) {
            if (controller.listaMarcas == null ||
                controller.listaMarcas.length == 0)
              return Center(
                child: CircularProgressIndicator(
                  strokeWidth: 1,
                ),
              );
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 10.0,
                    bottom: 5.0,
                  ),
                  child: Text(
                    "Por Categoria",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                Observer(builder: (_) {
                  return RaisedButton(
                    color: controller.listaMarcas[0].selecionado
                        ? kPrimaryColor
                        : Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: kPrimaryColor),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        controller.selecionarMarca(
                          0,
                          !controller.listaMarcas[0].selecionado,
                        );
                      });
                    },
                    child: Text(
                      controller.listaMarcas[0].descricao,
                      style: TextStyle(
                        color: controller.listaMarcas[0].selecionado
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  );
                }),
                Padding(
                  padding: EdgeInsets.only(
                    top: 15.0,
                    bottom: 5.0,
                  ),
                  child: Text(
                    "Por Empreendimento",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                Wrap(
                  runSpacing: 5.0,
                  spacing: 5.0,
                  children: [
                    for (var i = 4; i < controller.listaMarcas.length; i++)
                      Observer(builder: (_) {
                        return RaisedButton(
                          color: controller.listaMarcas[i].selecionado
                              ? kPrimaryColor
                              : Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: kPrimaryColor),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              controller.selecionarMarca(
                                i,
                                !controller.listaMarcas[i].selecionado,
                              );
                            });
                          },
                          child: Text(
                            controller.listaMarcas[i].descricao,
                            style: TextStyle(
                              color: controller.listaMarcas[i].selecionado
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        );
                      }),
                  ],
                ),
              ],
            );
            //   ],
            // );
          }),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(
            "Resetar",
            style: TextStyle(
              color: kPrimaryColor,
            ),
          ),
          onPressed: () {
            controller.resetarMarcas();
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text(
            "Confirmar",
            style: TextStyle(
              color: kPrimaryColor,
            ),
          ),
          onPressed: () {
            controller.confirmarMarca();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
