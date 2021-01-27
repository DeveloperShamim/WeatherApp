import 'package:flutter/material.dart';

class ButtomButton extends StatelessWidget {
  ButtomButton({@required this.onPress, @required this.buttonText});

  final Function onPress;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        color: Color(0xFF111328),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),
        ),
        height: 80.00,
        width: double.infinity,
        margin: EdgeInsets.only(top: 10.0),
      ),
    );
  }
}
