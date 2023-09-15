import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final double size;
  final Color color;
  final bool bold;
  final String? text;
  final TextAlign? textAlign;

  AppText(this.text,
      {this.size = 14,
      this.color = Colors.black,
      this.bold = false,
      this.textAlign = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: textAlign,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal),
    );
  }
}
