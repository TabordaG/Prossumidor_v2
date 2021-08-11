import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/app_controller.dart';
import 'package:prossumidor_v2/app/components/cards.dart';
import 'package:prossumidor_v2/app/constants.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  final AppController appController = Modular.get<AppController>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              // TopHomeView(),
              Expanded(child: HomeListView()),
            ],
          ),
        ),
      ),
    );
  }
}

class TopHomeView extends StatefulWidget {
  const TopHomeView({
    Key key,
  }) : super(key: key);

  @override
  _TopHomeViewState createState() => _TopHomeViewState();
}

class _TopHomeViewState extends State<TopHomeView> {
  final HomeController controller = Modular.get<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: kDefaultPadding,
            right: kDefaultPadding,
            top: kDefaultPadding * 1.5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Olá, Gustavo',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                    ),
                    TextSpan(
                      text: '\nBem vindo a ',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .color
                                .withOpacity(.6),
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                    ),
                    TextSpan(
                      text: 'Recoopsol',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .color
                                .withOpacity(.6),
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                          ),
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image(
                  width: 45,
                  image: AssetImage("assets/images/logo.png"),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                  kDefaultPadding,
                  kDefaultPadding * 0.25,
                  kDefaultPadding * 0.25,
                  kDefaultPadding * 0.25),
              child: Text(
                "Centro de Distribuição:",
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .color
                          .withOpacity(.6),
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
              ),
            ),
            Observer(builder: (_) {
              return Text(
                "${controller.centroDistribuicao}",
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .color
                          .withOpacity(.6),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
              );
            }),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            top: kDefaultPadding * 0.25,
            bottom: kDefaultPadding * .5,
            left: kDefaultPadding,
            right: kDefaultPadding,
          ),
          child: Container(
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
            child: TextFormField(
              onChanged: (value) => controller.setBuscarString(value),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              textCapitalization: TextCapitalization.words,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Insira uma busca válida';
                } else {
                  if (value.length < 3) {
                    return "A busca precisa ter pelo menos 3 caracteres";
                  } else {
                    return null;
                  }
                }
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                  top: 14.0,
                ),
                fillColor: Theme.of(context).cardColor,
                border: InputBorder.none,
                prefixIcon: IconButton(
                  splashRadius: 2,
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                suffixIcon: IconButton(
                  splashRadius: 2,
                  onPressed: () {},
                  icon: Icon(
                    Icons.tune,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                hintText: 'Produto ou Empreendimento',
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class HomeListView extends StatelessWidget {
  const HomeListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Modular.get<HomeController>();
    return ListView(
      controller: controller.scrollController,
      physics: BouncingScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: kDefaultPadding,
            right: kDefaultPadding,
            top: kDefaultPadding * 1.5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Olá, Gustavo',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                    ),
                    TextSpan(
                      text: '\nBem vindo a ',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .color
                                .withOpacity(.6),
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                    ),
                    TextSpan(
                      text: 'Recoopsol',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .color
                                .withOpacity(.6),
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                          ),
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image(
                  width: 45,
                  image: AssetImage("assets/images/logo.png"),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                  kDefaultPadding,
                  kDefaultPadding * 0.25,
                  kDefaultPadding * 0.25,
                  kDefaultPadding * 0.25),
              child: Text(
                "Centro de Distribuição:",
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .color
                          .withOpacity(.6),
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
              ),
            ),
            Observer(builder: (_) {
              return Text(
                "${controller.centroDistribuicao}",
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .color
                          .withOpacity(.6),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
              );
            }),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            top: kDefaultPadding * 0.25,
            bottom: kDefaultPadding * .5,
            left: kDefaultPadding,
            right: kDefaultPadding,
          ),
          child: Container(
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
            child: TextFormField(
              onChanged: (value) => controller.setBuscarString(value),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              textCapitalization: TextCapitalization.words,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Insira uma busca válida';
                } else {
                  if (value.length < 3) {
                    return "A busca precisa ter pelo menos 3 caracteres";
                  } else {
                    return null;
                  }
                }
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                  top: 14.0,
                ),
                fillColor: Theme.of(context).cardColor,
                border: InputBorder.none,
                prefixIcon: IconButton(
                  splashRadius: 2,
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                suffixIcon: IconButton(
                  splashRadius: 2,
                  onPressed: () {},
                  icon: Icon(
                    Icons.tune,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                hintText: 'Produto ou Empreendimento',
              ),
            ),
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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
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
              child: Image(
                fit: BoxFit.fill,
                image: AssetImage(
                  'assets/images/banner01.jpeg',
                ),
              ),
            ),
          ),
        ),
        for (var indexCategoria = 0;
            indexCategoria < categoriaList.length;
            indexCategoria++)
          CategoriaHome(
            indexCategoria: indexCategoria,
            verMais: () {
              Navigator.of(context).pushNamed(
                '/produtosCategorias',
                arguments: {'indexCategorias': indexCategoria},
              );
            },
          ),
      ],
    );
  }
}

class CategoriaHome extends StatefulWidget {
  final int indexCategoria;
  final Function verMais;

  CategoriaHome({
    Key key,
    this.indexCategoria,
    this.verMais,
  }) : super(key: key);

  @override
  _CategoriaHomeState createState() => _CategoriaHomeState();
}

class _CategoriaHomeState extends State<CategoriaHome> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: kDefaultPadding * .75,
          ),
          child: Divider(
            thickness: 10,
            color: Theme.of(context).colorScheme.secondary.withOpacity(.2),
          ),
        ),
        ListTile(
          leading: Icon(Icons.fastfood),
          title: Text(
            categoriaList[widget.indexCategoria],
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontSize: 18,
                  color: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .color
                      .withOpacity(1),
                ),
          ),
          trailing: TextButton(
            onPressed: widget.verMais,
            child: Text(
              'Ver mais',
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: 14,
                    color: Theme.of(context).primaryColor,
                  ),
            ),
          ),
        ),
        Container(
          height: 235,
          margin: EdgeInsets.only(
            bottom: widget.indexCategoria == categoriaList.length - 1
                ? kDefaultPadding
                : 0.0,
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) => index != 4
                ? CardHome(
                    index: index,
                    verDetalhes: () => Modular.to.pushNamed(
                      '/produtoDetalhes',
                      arguments: {
                        'produto': produtoList[index],
                      },
                    ),
                  )
                : Row(
                    children: [
                      CardHome(
                        index: index,
                        verDetalhes: () => Modular.to.pushNamed(
                          '/produtoDetalhes',
                          arguments: {
                            'produto': produtoList[index],
                          },
                        ),
                      ),
                      CardVerMaisHome(
                        indexCategoria: widget.indexCategoria,
                        verMais: widget.verMais,
                      ),
                    ],
                  ),
          ),
        ),
      ],
    );
  }
}
