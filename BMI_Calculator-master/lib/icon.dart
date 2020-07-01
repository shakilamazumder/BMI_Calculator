import 'package:flutter/material.dart';
class IconContent extends StatelessWidget {
  IconContent({this.icon,this.label});
final IconData icon;
final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
       mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      Icon(
        icon,
        size:20,
      ),
      SizedBox(
        height:5,
        ),
        Text(label,
        style: TextStyle(
          fontSize:7,
          color: Color(0XFF8D8E98),

        ),)
    ],);
  }
}


