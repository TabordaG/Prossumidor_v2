import 'package:flutter/material.dart';

class StandardButton extends StatefulWidget {
  final Function onPressed;
  final String text;
  final Color color;

  StandardButton({Key key, this.onPressed, this.text, this.color})
      : super(key: key);

  @override
  _StandardButtonState createState() => _StandardButtonState();
}

class _StandardButtonState extends State<StandardButton> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: widget.onPressed,
      color: widget.color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Text(
        widget.text,
        style: Theme.of(context).textTheme.bodyText1.copyWith(
              fontSize: 18,
              color: Colors.white,
            ),
      ),
    );
  }
}
