import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  late final String text;
  late VoidCallback onPressed;
  Mybutton({
    required this.text,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(text),
      color: Theme.of(context).primaryColor,
    );
  }
}
