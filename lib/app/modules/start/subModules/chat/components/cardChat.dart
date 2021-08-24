import 'package:flutter/material.dart';
import 'package:prossumidor_v2/app/models/chat/chat_model.dart';

class CardChat extends StatefulWidget {
  final Chat chat;
  final Function onTap;
  const CardChat({Key key, this.chat, this.onTap}) : super(key: key);

  @override
  _CardChatState createState() => _CardChatState();
}

class _CardChatState extends State<CardChat> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
            color: Colors.black54,
            width: 0.2,
          )),
        ),
        child: ListTile(
          leading: CircleAvatar(
            child: Text(widget.chat.razao_social.characters.first),
          ),
          title: Text(widget.chat.razao_social),
          subtitle: Row(
            children: [
              Icon(
                widget.chat.status == ' Enviado'
                    ? Icons.done
                    : widget.chat.status == 'Recebido'
                        ? Icons.done_all
                        : widget.chat.status == 'Lido'
                            ? Icons.done_all
                            : Icons.close,
                color: widget.chat.status == 'Lido' ? Colors.blue : Colors.grey,
                size: 12,
              ),
              SizedBox(
                width: 8,
              ),
              Flexible(
                child: Text(
                  widget.chat.status == 'Apagado'
                      ? "Esta mensagem foi apagada."
                      : widget.chat.mensagem,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(widget.chat.data_envio.hour < 10 &&
                          widget.chat.data_envio.minute < 10
                      ? "0${widget.chat.data_envio.hour}"
                          ":"
                          "0${widget.chat.data_envio.minute}"
                      : widget.chat.data_envio.hour < 10 &&
                              widget.chat.data_envio.minute >= 10
                          ? "0${widget.chat.data_envio.hour}"
                                  ":" +
                              "${widget.chat.data_envio.minute}"
                          : widget.chat.data_envio.hour >= 10 &&
                                  widget.chat.data_envio.minute < 10
                              ? "${widget.chat.data_envio.hour}"
                                  ":"
                                  "0${widget.chat.data_envio.minute}"
                              : "${widget.chat.data_envio.hour}"
                                  ":"
                                  "${widget.chat.data_envio.minute}"),
                  Text(widget.chat.data_envio.hour < 12 ? 'AM' : 'PM')
                ],
              ),
              Text(widget.chat.data_envio.day < 10 &&
                      widget.chat.data_envio.month < 10
                  ? "0${widget.chat.data_envio.day}" +
                      "/" +
                      "0${widget.chat.data_envio.month}"
                          "/" +
                      "${widget.chat.data_envio.year}"
                  : widget.chat.data_envio.day >= 10 &&
                          widget.chat.data_envio.month < 10
                      ? "${widget.chat.data_envio.day}" +
                          "/" +
                          "0${widget.chat.data_envio.month}"
                              "/" +
                          "${widget.chat.data_envio.year}"
                      : widget.chat.data_envio.day < 10 &&
                              widget.chat.data_envio.month >= 10
                          ? "0${widget.chat.data_envio.day}" +
                              "/" +
                              "${widget.chat.data_envio.month}"
                                  "/" +
                              "${widget.chat.data_envio.year}"
                          : "${widget.chat.data_envio.day}" +
                              "/" +
                              "${widget.chat.data_envio.month}"
                                  "/" +
                              "${widget.chat.data_envio.year}")
            ],
          ),
        ),
      ),
    );
  }
}
