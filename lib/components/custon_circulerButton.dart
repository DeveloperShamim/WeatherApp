
import 'package:flutter/material.dart';
class CustomCircularButton extends StatelessWidget {
  CustomCircularButton({@required this.icon, @required this.onPressed});

  final Function onPressed;

  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      elevation: 4.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      onPressed: onPressed,
      fillColor: Colors.white,
      shape: CircleBorder(),
    );
  }
}