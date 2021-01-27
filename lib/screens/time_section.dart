import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class TimeSection extends StatelessWidget {
  const TimeSection({
    Key key,
    @required String tTime,
    @required String date,
    @required this.cityName,
    @required this.country,
  }) : _tTime = tTime, _date = date, super(key: key);

  final String _tTime;
  final String _date;
  final String cityName;
  final String country;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(
              FontAwesome5.clock,
              color: Colors.white,
              size: 80,
            ),
            SizedBox(
              width: 10.00,
            ),
            Text(_tTime.toString(),
                style: TextStyle(
                  fontFamily: 'DS DIGI',
                  color: Colors.white,
                  fontSize: 80.0,
                )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(_date.toString(),
                style: TextStyle(
                  fontFamily: 'Spartan MB',
                  color: Colors.white,
                  fontSize: 25.0,
                )),
          ],
        ),
        Container(
          child:Text('$cityName - $country ',
                style: TextStyle(
                  fontFamily: 'Spartan MB',
                  color: Colors.white,
                  fontSize: 40.0,
                )) ,
        )
      ],
    );
  }
}
