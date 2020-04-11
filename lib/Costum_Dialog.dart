import 'package:flutter/material.dart';

class Costum_Dialog extends StatelessWidget {
  final title;
  final content;
  final VoidCallback callback;
  final action_Text;

  Costum_Dialog(this.title, this.content, this.callback,
  [this.action_Text = "Reset"]);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: new Text(title),
      content: new Text(content),
      actions: <Widget>[
        new FlatButton(
          onPressed: callback,
          color: Colors.white,
          child: new Text(action_Text)
        )
      ],
      
    );
  }
}