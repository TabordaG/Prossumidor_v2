import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prossumidor_v2/app/components/button.dart';
import 'package:prossumidor_v2/app/constants.dart';
import 'package:prossumidor_v2/app/modules/start/subModules/sacola/sacola_controller.dart';

class ConfirmarPedido extends StatefulWidget {
  @override
  _ConfirmarPedidoState createState() => _ConfirmarPedidoState();
}

class _ConfirmarPedidoState extends State<ConfirmarPedido> {
  SacolaController controller = Modular.get<SacolaController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.shopping_bag,
              color: Colors.white,
            ),
            SizedBox(
              width: kDefaultPadding * .25,
            ),
            Text('Sacola'),
          ],
        ),
        actions: [
          IconButton(
            splashRadius: 2,
            icon: Icon(
              Icons.info,
              color: Colors.white,
            ),
            onPressed: () {
              print('Pressed');
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Image(
              height: MediaQuery.of(context).size.height * 0.30,
              image: AssetImage("assets/images/confirmarPagamento.png"),
            ),
            Text(
              'Como pretende pagar ao retirar o seu pedido ?',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .color
                        .withOpacity(.8),
                  ),
            ),
            SizedBox(
              height: kDefaultPadding * .25,
            ),
            Row(
              children: [
                Radio(
                  value: 0,
                  activeColor: Theme.of(context).primaryColor,
                  groupValue: controller.pagamento,
                  onChanged: (value) {
                    setState(() {
                      controller.setPagamento(value);
                    });
                  },
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      controller.setPagamento(0);
                    });
                  },
                  child: Text(
                    'Dinheiro',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 1,
                  activeColor: Theme.of(context).primaryColor,
                  groupValue: controller.pagamento,
                  onChanged: (value) {
                    setState(() {
                      controller.setPagamento(value);
                    });
                  },
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      controller.setPagamento(1);
                    });
                  },
                  child: Text(
                    'Cartão Crédito',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 2,
                  activeColor: Theme.of(context).primaryColor,
                  groupValue: controller.pagamento,
                  onChanged: (value) {
                    setState(() {
                      controller.setPagamento(value);
                    });
                  },
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      controller.setPagamento(2);
                    });
                  },
                  child: Text(
                    'Cartão Débito',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 3,
                  activeColor: Theme.of(context).primaryColor,
                  groupValue: controller.pagamento,
                  onChanged: (value) {
                    setState(() {
                      controller.setPagamento(value);
                    });
                  },
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      controller.setPagamento(3);
                    });
                  },
                  child: Text(
                    'Pix',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 4,
                  activeColor: Theme.of(context).primaryColor,
                  groupValue: controller.pagamento,
                  onChanged: (value) {
                    setState(() {
                      controller.setPagamento(value);
                    });
                  },
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      controller.setPagamento(4);
                    });
                  },
                  child: Text(
                    'Outros',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: kDefaultPadding * .5,
                top: kDefaultPadding * .5,
              ),
              child: Center(
                child: ButtonTheme(
                  minWidth: double.infinity,
                  height: 45,
                  child: StandardButton(
                    onPressed: () => Modular.to.pushReplacementNamed(
                      '/start',
                    ),
                    color: Theme.of(context).primaryColor,
                    text: 'Finalizar Compra',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
