// ignore_for_file: use_key_in_widget_constructors

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
  const HomePage({this.title = "Início"}) : super();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return const Material(
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

class _HomeListViewState extends State<HomeListView>
    with SingleTickerProviderStateMixin {
  final AuthController authController = Modular.get<AuthController>();
  final HomeController controller = Modular.get<HomeController>();
  late TabController tabControllerFiltro;

  @override
  void initState() {
    tabControllerFiltro = TabController(length: 2, vsync: this);
    super.initState();
    controller.iniciarHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // resizeToAvoidBottomPadding: false,
      body: Observer(builder: (_) {
        return Container(
          color: Colors.white,
          child: RefreshIndicator(
            displacement: 60.0,
            color: Theme.of(context).primaryColor,
            onRefresh: () => controller.iniciarHome(),
            child: ListView(
              controller: controller.scrollController,
              physics: const BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.only(
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
                                    ? 'Olá, ${authController.usuario!.nome_razao_social}'
                                    : 'Olá, ...',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
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
                                      .bodyText1!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .color!
                                            .withOpacity(.6),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                ),
                                Text(
                                  'Recoopsol',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .color!
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
                        padding: const EdgeInsets.only(right: 10.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: const Image(
                            width: 65,
                            image: AssetImage("assets/images/newLogo_1.png"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
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
                                  builder: (context) => const SearchPage(),
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
                              contentPadding: const EdgeInsets.only(
                                top: 14.0,
                              ),
                              filled: true,
                              fillColor: Theme.of(context).cardColor,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
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
                        padding:
                            const EdgeInsets.only(left: kDefaultPadding * .5),
                        child: InkWell(
                          onTap: () async {
                            if (controller.listaMarcas == null ||
                                controller.listaMarcas!.length <= 1) {
                              await controller.buscarMarcas();
                            }
                            showDialog(
                              barrierColor: Colors.black12,
                              context: context,
                              builder: (BuildContext context) {
                                return SingleChildScrollView(
                                    child: buildFiltroHomeTest(context));
                              },
                            );
                          },
                          child: Container(
                            width: 90,
                            height: 47,
                            padding: const EdgeInsets.only(left: 5),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF6F6F6),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  spreadRadius: 0,
                                  blurRadius: .2,
                                  offset: const Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Text(
                    'Não se esqueça de efetuar as compras até quarta!',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 12,
                          color: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .color!
                              .withOpacity(.8),
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
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
                              color: const Color(0xFFF6F6F6),
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  spreadRadius: 0,
                                  blurRadius: 1,
                                  offset: const Offset(0, 0),
                                ),
                              ],
                            ),
                            child: CarouselSlider(
                              options: CarouselOptions(
                                height: 115,
                                enlargeCenterPage: false,
                                viewportFraction: 1,
                                autoPlay: true,
                                autoPlayInterval: const Duration(seconds: 10),
                                // onPageChanged: (index, reason) {
                                //   commands.setIndex(index);
                                // },
                              ),
                              items: controller.banner.map((item) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: SizedBox(
                                          height: 115,
                                          width: double.infinity,
                                          child: CachedNetworkImage(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.2,
                                            imageUrl:
                                                '${Basicos.ip2}/media/$item',
                                            fit: BoxFit.cover,
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
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
                  if (controller.refreshPage) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        top: 60,
                        // left: MediaQuery.of(context).size.width * .5 - 42,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircularProgressIndicator(
                            strokeWidth: 1,
                          ),
                        ],
                      ),
                    );
                  }
                  return ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: !controller.marcaSelecionada
                        ? controller.listaCategoriaProdutos.length
                        : controller.listaMarcaProdutos.length,
                    itemBuilder: (context, indexItem) {
                      return Observer(builder: (_) {
                        return !controller.marcaSelecionada &&
                                !controller.listaCategoriaProdutos[indexItem]
                                    .categoria!.selecionado! &&
                                controller.isFiltering
                            ? Container()
                            : WidgetHome(
                                indexItem: indexItem,
                                isCategoria:
                                    !controller.marcaSelecionada ? true : false,
                                verMais: () {
                                  Navigator.of(context).pushNamed(
                                    '/produtosCategorias/',
                                    arguments: {
                                      'categoriaProduto': !controller
                                              .marcaSelecionada
                                          ? controller
                                              .listaCategoriaProdutos[indexItem]
                                          : null,
                                      'marcaProduto':
                                          controller.marcaSelecionada
                                              ? controller
                                                  .listaMarcaProdutos[indexItem]
                                              : null,
                                      'isCategoria':
                                          !controller.marcaSelecionada
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
      }),
    );
  }

  Dialog buildFiltroHomeTest(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 60.0),
      child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: TabBar(
                  controller: tabControllerFiltro,
                  tabs: const [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: Text(
                        "Categorias",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: Text(
                        "Empreendimentos",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: TabBarView(
                  controller: tabControllerFiltro,
                  children: [
                    Observer(builder: (_) {
                      if (controller.listaCategoriasFiltro.isEmpty) {
                        return const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 1,
                          ),
                        );
                      }
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.65,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 60,
                              width: double.infinity,
                              child: Observer(builder: (_) {
                                return TextFormField(
                                  controller: controller.buscarCategoria,
                                  onChanged: (value) =>
                                      controller.atualizaListaCategoria(),
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.search,
                                  textCapitalization: TextCapitalization.words,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(top: 14.0),
                                    filled: true,
                                    fillColor: Theme.of(context).cardColor,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide.none,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    hintText: 'Pesquisar',
                                  ),
                                );
                              }),
                            ),
                            Flexible(
                              fit: FlexFit.tight,
                              child: Observer(builder: (_) {
                                return controller
                                        .listaCategoriasFiltro.isNotEmpty
                                    ? SingleChildScrollView(
                                        child: Wrap(
                                        runSpacing: 5.0,
                                        spacing: 5.0,
                                        children: [
                                          controller
                                                  .buscarCategoria.text.isEmpty
                                              ? Observer(builder: (_) {
                                                  return ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      primary: controller
                                                              .listaCategoriasFiltro[
                                                                  0]
                                                              .selecionado!
                                                          ? kPrimaryColor
                                                          : Colors.white,
                                                      shape:
                                                          const RoundedRectangleBorder(
                                                        side: BorderSide(
                                                            color:
                                                                kPrimaryColor),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(5),
                                                        ),
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      controller
                                                          .selecionarCategoria(
                                                        0,
                                                        !controller
                                                            .listaCategoriasFiltro[
                                                                0]
                                                            .selecionado!,
                                                      );
                                                    },
                                                    child: Text(
                                                      controller
                                                          .listaCategoriasFiltro[
                                                              0]
                                                          .descricao!,
                                                      style: TextStyle(
                                                        color: controller
                                                                .listaCategoriasFiltro[
                                                                    0]
                                                                .selecionado!
                                                            ? Colors.white
                                                            : Colors.black,
                                                      ),
                                                    ),
                                                  );
                                                })
                                              : Container(),
                                          for (var i = 4;
                                              i <
                                                  controller
                                                      .filtroCategoria.length;
                                              i++)
                                            if (controller.filtroCategoria[i] !=
                                                null)
                                              Observer(builder: (_) {
                                                return ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: controller
                                                            .filtroCategoria[i]!
                                                            .selecionado!
                                                        ? kPrimaryColor
                                                        : Colors.white,
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          color: kPrimaryColor),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(5),
                                                      ),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    controller
                                                        .selecionarCategoria(
                                                      i,
                                                      !controller
                                                          .filtroCategoria[i]!
                                                          .selecionado!,
                                                    );
                                                  },
                                                  child: Text(
                                                    controller
                                                        .filtroCategoria[i]!
                                                        .descricao!,
                                                    style: TextStyle(
                                                      color: controller
                                                              .filtroCategoria[
                                                                  i]!
                                                              .selecionado!
                                                          ? Colors.white
                                                          : Colors.black,
                                                    ),
                                                  ),
                                                );
                                              }),
                                        ],
                                      ))
                                    : Container();
                              }),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  child: const Text(
                                    "Cancelar",
                                    style: TextStyle(
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  onPressed: () {
                                    // controller.resetarMarcasCategoria(0);
                                    Navigator.of(context).pop();
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: kDefaultPadding * .6),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: kPrimaryColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                    ),
                                    child: const Text(
                                      "Confirmar",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    onPressed: () {
                                      controller.confirmarMarcaCategoria(0);
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
                    Observer(builder: (_) {
                      if (controller.listaMarcas == null ||
                          controller.listaMarcas!.isEmpty) {
                        return const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 1,
                          ),
                        );
                      }
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.65,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 60,
                              width: double.infinity,
                              child: Observer(builder: (_) {
                                return TextFormField(
                                  controller: controller.buscarMarca,
                                  onChanged: (value) =>
                                      controller.atualizaListaMarca(),
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.search,
                                  textCapitalization: TextCapitalization.words,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(
                                      top: 14.0,
                                    ),
                                    filled: true,
                                    fillColor: Theme.of(context).cardColor,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide.none,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    hintText: 'Pesquisar',
                                  ),
                                );
                              }),
                            ),
                            Flexible(
                              fit: FlexFit.tight,
                              child: Observer(builder: (_) {
                                return controller.filtroMarca.isNotEmpty
                                    ? SingleChildScrollView(
                                        child: Wrap(
                                        runSpacing: 5.0,
                                        spacing: 5.0,
                                        children: [
                                          controller.buscarMarca.text.isEmpty
                                              ? Observer(builder: (_) {
                                                  return ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      primary: controller
                                                              .listaMarcas![0]
                                                              .selecionado!
                                                          ? kPrimaryColor
                                                          : Colors.white,
                                                      shape:
                                                          const RoundedRectangleBorder(
                                                        side: BorderSide(
                                                            color:
                                                                kPrimaryColor),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(5),
                                                        ),
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      controller
                                                          .selecionarMarca(
                                                        0,
                                                        !controller
                                                            .listaMarcas![0]
                                                            .selecionado!,
                                                      );
                                                    },
                                                    child: Text(
                                                      controller.listaMarcas![0]
                                                          .descricao!,
                                                      style: TextStyle(
                                                        color: controller
                                                                .listaMarcas![0]
                                                                .selecionado!
                                                            ? Colors.white
                                                            : Colors.black,
                                                      ),
                                                    ),
                                                  );
                                                })
                                              : Container(),
                                          for (var i = 4;
                                              i < controller.filtroMarca.length;
                                              i++)
                                            if (controller.filtroMarca[i] !=
                                                null)
                                              Observer(builder: (_) {
                                                return ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: controller
                                                            .filtroMarca[i]!
                                                            .selecionado!
                                                        ? kPrimaryColor
                                                        : Colors.white,
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          color: kPrimaryColor),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(5),
                                                      ),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    controller.selecionarMarca(
                                                      i,
                                                      !controller
                                                          .filtroMarca[i]!
                                                          .selecionado!,
                                                    );
                                                  },
                                                  child: Text(
                                                    controller.filtroMarca[i]!
                                                        .descricao!,
                                                    style: TextStyle(
                                                      color: controller
                                                              .filtroMarca[i]!
                                                              .selecionado!
                                                          ? Colors.white
                                                          : Colors.black,
                                                    ),
                                                  ),
                                                );
                                              }),
                                        ],
                                      ))
                                    : Container();
                              }),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  child: const Text(
                                    "Cancelar",
                                    style: TextStyle(
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  onPressed: () {
                                    // controller.resetarMarcasCategoria(1);
                                    Navigator.of(context).pop();
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: kDefaultPadding * .6),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      primary: kPrimaryColor,
                                    ),
                                    child: const Text(
                                      "Confirmar",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    onPressed: () {
                                      controller.confirmarMarcaCategoria(1);
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
