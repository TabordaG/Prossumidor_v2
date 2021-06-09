import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/components/button.dart';
import 'package:prossumidor_v2/app/constants.dart';
import 'registro_controller.dart';
import 'widgets/page1.dart';

class RegistroPage extends StatefulWidget {
  final String title;
  const RegistroPage({Key key, this.title = "Dados Cadastrais"})
      : super(key: key);

  @override
  _RegistroPageState createState() => _RegistroPageState();
}

class _RegistroPageState
    extends ModularState<RegistroPage, RegistroController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var appBar = AppBar(
      brightness: Brightness.light,
      leading: IconButton(
        splashRadius: 2,
        icon: Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
        onPressed: () => Modular.to.pushReplacementNamed("/login"),
      ),
      backgroundColor: Colors.white,
      title: Text(
        widget.title,
        style: Theme.of(context).textTheme.bodyText1.copyWith(
              fontSize: 20,
            ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.help,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {},
        ),
      ],
    );
    var screenHeigh = (size.height - appBar.preferredSize.height) -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Container(
          height: screenHeigh,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                height: MediaQuery.of(context).size.height * 0.20,
                image: AssetImage("assets/images/registro01.png"),
              ),
              Expanded(
                flex: 7,
                child: Observer(
                  builder: (_) {
                    return CarouselSlider(
                      carouselController: controller.buttonCarouselController,
                      options: CarouselOptions(
                        height: double.infinity,
                        scrollPhysics: NeverScrollableScrollPhysics(),
                        initialPage: 0,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: false,
                        aspectRatio: 2.0,
                        onPageChanged: (index, reason) =>
                            controller.setIndex(index),
                      ),
                      items: [RegistrarPage1(), Text('2'), Text('3')]
                          .map((widget) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Padding(
                              padding: EdgeInsets.only(
                                top: 5.0,
                                bottom: 5.0,
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
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
                                child: Center(
                                  child: widget,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [0, 1, 2].map((i) {
                  return Observer(builder: (_) {
                    return Container(
                      width: 8.0,
                      height: 8.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: controller.current == i
                            ? Theme.of(context).primaryColor
                            : returnColorIndex(i),
                      ),
                    );
                  });
                }).toList(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Observer(builder: (_) {
                      return ButtonTheme(
                        minWidth: 120.0,
                        height: 40,
                        child: StandardButton(
                          onPressed: () {
                            if (controller.current != 0)
                              controller.setPreviousPage();
                          },
                          text: controller.current == 0 ? 'Cancelar' : 'Voltar',
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      );
                    }),
                    Observer(builder: (_) {
                      return ButtonTheme(
                        minWidth: 120.0,
                        height: 40,
                        child: StandardButton(
                          onPressed: () {
                            if (controller.current != 2)
                              controller.setNextPage();
                          },
                          text:
                              controller.current == 2 ? 'Concluir' : 'Próximo',
                          color: Theme.of(context).primaryColor,
                        ),
                      );
                    }),
                  ],
                ),
              ),
              Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color returnColorIndex(int i) {
    Color color = Theme.of(context).textSelectionColor.withOpacity(.2);
    switch (i) {
      case 0:
        return controller.page1Valid
            ? Theme.of(context).colorScheme.secondary
            : Colors.grey;
        break;
      case 1:
        return controller.page2Valid
            ? Theme.of(context).colorScheme.secondary
            : Colors.grey;
        break;
      case 2:
        return controller.page3Valid
            ? Theme.of(context).colorScheme.secondary
            : Colors.grey;
        break;
      default:
        break;
    }
    return color;
  }
}
