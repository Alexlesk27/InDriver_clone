import 'package:flutter/material.dart';

class DefaultBottom extends StatelessWidget {
  String text;
  double font;
  MaterialColor cor;
  FontWeight fontWeight;
  VoidCallback click;
  Color backgroundColor;
  EdgeInsetsGeometry margin;

  DefaultBottom(
      {required this.text,
      required this.font,
      required this.cor,
      required this.fontWeight,
      required this.click,
      required this.backgroundColor,
      required this.margin
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: margin,
      child: ElevatedButton(
        onPressed: click,
        style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
        child: Text(
          text,
          style: TextStyle(
            fontSize: font,
            color: cor,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
