import 'package:clima/components/reusable_card.dart';
import 'package:clima/screens/modify_card.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:clima/screens/city_screen.dart';
import 'package:clima/screens/loading_screen.dart';
//import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
//import 'package:flutter_icons/flutter_icons.dart';
import 'package:clima/screens/time_section.dart';
//import 'package:intl/intl.dart';
import 'dart:async';

import 'package:intl/intl.dart';

class ModifyLocationScreen extends StatefulWidget {
  final data;
  ModifyLocationScreen({this.data});
  @override
  _ModifyLocationScreenState createState() => _ModifyLocationScreenState();
}

class _ModifyLocationScreenState extends State<ModifyLocationScreen> {
  String discription;
  String currentTenprature;
  String tempIcon;
  int id;
  String comments;
  String cityName;
  String massege;
  String weatherDiscription;
  String humidity;
  String windSpeed;
  String country;

  String _date;
  String _tTime;

  @override
  void initState() {
    DateTime currentDate = DateTime.now();
    //_timeString ="${DateTime.now().hour} : ${DateTime.now().minute}";
    _date = DateFormat.yMMMd().format(currentDate);
    _tTime = DateFormat.jm().format(currentDate);

    Timer.periodic(
        Duration(seconds: 1), (Timer t) => _getCurrentTime(currentDate));

    super.initState();
    updateUI(widget.data);
  }

  void updateUI(data) {
    WeatherModel model = WeatherModel();

    if (data == null) {
      discription = '0';
      currentTenprature = '0';
      tempIcon = '0';
      id = 0;
      comments = '0';
      cityName = '0';
      massege = '0';
      weatherDiscription = '0';
      humidity = '0';
      windSpeed = '0';
      country = '0';
      _date = '0';
      _tTime = '0';

      return;
    }
    windSpeed = (data['wind']['speed'] * 3.6).toStringAsFixed(1);
    humidity = data['main']['humidity'].toString();
    discription = data['weather'][0]['main'];
    currentTenprature = data['main']['temp'].toStringAsFixed(0);

    country = data['sys']['country'].toString();

    comments = model.getMessage(int.parse(currentTenprature));

    cityName = data['name'];

    id = data['weather'][0]['id'];
    tempIcon = model.getWeatherIcon(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            FractionallySizedBox(
              heightFactor: 1,
              child: Container(
                color: Colors.black,
                child: FlareActor(
                  'images/earth.flr',
                  fit: BoxFit.cover,
                  animation: "activated",
                ),
              ),
            ),
            FractionallySizedBox(
              heightFactor: .50,
              widthFactor: 1,
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(top: 60.00, left: 10.00),
                  child: TimeSection(
                      tTime: _tTime,
                      date: _date,
                      cityName: cityName,
                      country: country),
                ),
              ),
            ),
            FractionallySizedBox(
              alignment: Alignment.bottomRight,
              heightFactor: 0.50,
              widthFactor: 1,
              child: ReusableCard(
                cardChild: SingleChildScrollView(
                  child: Container(
                    padding:
                        EdgeInsets.only(left: 10.00, right: 10.00, top: 10.00),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ModifyCard(
                          currentTenprature: '$currentTenprature°C ',
                          icon: 'assets/icon_thermometer.png',
                          text: '',
                        ),
                        Card(
                          color: Color(0xFF10103B),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Image.asset(
                                'assets/$tempIcon',
                                height: 40.0,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 30.00,
                                height: 60.00,
                              ),
                              Text(
                                '$discription',
                                style: TextStyle(
                                  fontFamily: 'Spartan MB',
                                  color: Colors.white,
                                  fontSize: 30.0,
                                ),
                              ),
                              Text(''),
                            ],
                          ),
                        ),
                        ModifyCard(
                          currentTenprature: windSpeed,
                          icon: 'assets/icon_wind.png',
                          text: 'kmph',
                        ),
                        ModifyCard(
                          currentTenprature: humidity,
                          icon: 'assets/humidity.png',
                          text: '%',
                        ),
                      ],
                    ),
                  ),
                ),
                colour: Color(0xFF10103B),
              ),
            ),
            FractionallySizedBox(
              alignment: Alignment.bottomCenter,
              heightFactor: .10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoadingScreen()),
                        );
                      },
                      child: Icon(
                        Icons.refresh,
                        color: Color(0xFF50103B),
                        size: 50.0,
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return CityScreen();
                        }),
                      );
                    },
                    child: Icon(
                      Icons.location_on,
                      size: 50.0,
                      color: Color(0xFF50103B),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _getCurrentTime(currentDate) {
    setState(() {
      _date = DateFormat.yMMMd().format(currentDate);
      _tTime = DateFormat.jm().format(currentDate);
    });
  }
}
