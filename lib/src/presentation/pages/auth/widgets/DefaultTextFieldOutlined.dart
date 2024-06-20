import 'package:flutter/material.dart';

class DefaultTextFieldOutlined extends StatelessWidget {
  var text = "";
  IconData icon;
  EdgeInsetsGeometry margin;

  DefaultTextFieldOutlined({
    required this.text,
    required this.icon,
    this.margin = const EdgeInsets.only(top: 50, left: 20, right: 20),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: 50,
      decoration: BoxDecoration(
          color: Color.fromRGBO(247, 244, 244, 0.098),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), bottomRight: Radius.circular(15))),
      child: TextFormField(
        decoration: InputDecoration(
          label: Text(text),
          //border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: const Color.fromARGB(255, 33, 150, 243),
            width: 2,
          )
          ),
           enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: const Color.fromARGB(255, 228, 224, 224),
            width: 1,
          )
          ),
          prefixIcon: Container(
            margin: EdgeInsets.only(top: 10),
            child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              children: [
                Icon(icon),
                Container(
                  height: 20,
                  width: 1,
                  color: const Color.fromARGB(255, 231, 228, 228),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
