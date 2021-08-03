import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:prossumidor_v2/app/models/chat/chat_model.dart';

class CardMensagem extends StatefulWidget {
  final Chat chat;
  const CardMensagem({
    Key key,
    this.chat,
  }) : super(key: key);

  @override
  CardMensagemState createState() => CardMensagemState();
}

class CardMensagemState extends State<CardMensagem> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int horas = widget.chat.data_envio.hour;
    int minutos = widget.chat.data_envio.minute;
    String horaFormatada = horas < 10 && minutos < 10
        ? "0$horas:0$minutos"
        : horas < 10 && minutos >= 10
            ? "0$horas:$minutos"
            : horas >= 10 && minutos < 10
                ? "$horas:0$minutos"
                : "$horas:$minutos";
    String time = horas < 12 ? 'AM' : 'PM';
    return widget.chat.situacao == 'Produtor-Cliente'
        ? Align(
            alignment: Alignment.centerLeft,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 100,
                maxWidth: size.width * 0.8,
              ),
              child: Card(
                color: Theme.of(context).colorScheme.secondary,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 30, 25),
                      child: Text(widget.chat.mensagem,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(fontSize: 16, color: Colors.white)),
                    ),
                    Positioned(
                      bottom: 4,
                      right: 4,
                      child: Text(
                        horaFormatada + time,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : Align(
            alignment: Alignment.centerRight,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 100,
                maxWidth: size.width * 0.8,
              ),
              child: Card(
                color: Theme.of(context).colorScheme.primary,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 30, 25),
                      child: Text(
                        widget.chat.mensagem,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    Positioned(
                      bottom: 4,
                      right: 4,
                      child: Text(
                        horaFormatada + time,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
