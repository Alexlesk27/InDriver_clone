import 'package:flutter/material.dart';

class DefaultTextfield extends StatelessWidget {

  var text = "";
  Function(String text) onchanged;
  IconData icon;
  EdgeInsetsGeometry margin;
  
  DefaultTextfield({
    required this.text,
    required this.icon,
    required this.onchanged,
    this.margin = const EdgeInsets.only(top: 50, left: 20, right: 20),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), bottomRight: Radius.circular(15))),
      child: TextFormField(
        onChanged: (text){
          onchanged(text);
        },
        decoration: InputDecoration(
          label: Text(text),
          border: InputBorder.none,
          prefixIcon: Container(
            margin: EdgeInsets.only(top: 10),
            child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              children: [
                Icon(icon),
                Container(
                  height: 20,
                  width: 1,
                  color: Colors.grey,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
