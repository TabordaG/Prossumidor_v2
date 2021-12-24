import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/constants.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/home/home_controller.dart';

class FiltroHome extends StatefulWidget {
  const FiltroHome({Key key}) : super(key: key);

  @override
  _FiltroHomeState createState() => _FiltroHomeState();
}

class _FiltroHomeState extends ModularState<FiltroHome, HomeController> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      insetPadding: EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 60.0),
      content: Column(
        children: [
          Observer(builder: (_) {
            if (controller.listaMarcas == null ||
                controller.listaMarcas.length == 0)
              return Center(
                child: CircularProgressIndicator(),
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
                    for (var i = 1; i < controller.listaMarcas.length; i++)
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
