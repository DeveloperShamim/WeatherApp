import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';


class ModifyCard extends StatelessWidget {
  const ModifyCard({
    Key key,
    @required this.currentTenprature,
    @required this.icon,
    @required this.text,
  }) : super(key: key);

  final String currentTenprature;
  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF10103B),
      child: Row(
        
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: <Widget>[
          Image.asset(
            '$icon',
            height: 30.0,
            color: Colors.white,
          ),
          SizedBox(
            
            width: 15.00,
          ),
          Text(
            '  $currentTenprature',
            style: kTempTextStyle,
          ),
          Text(
            '$text',
            style: kSmallTextStyle,
          )
        ],
      ),
    );
  }
}
