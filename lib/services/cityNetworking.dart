import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'dart:convert';

class CityNetworking {
  final url;


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

  CityNetworking({@required this.url});

  Future getData() async {
    Response response = await get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);

    } else {
      print('Faild');
    }
  }


    void updateUI(data) {
    
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

      return;
    }
    windSpeed = (data['wind']['speed'] * 3.6).toStringAsFixed(1);
    humidity = data['main']['humidity'].toString();
    discription = data['weather'][0]['main'];
    currentTenprature = data['main']['temp'].toStringAsFixed(0);

    country = data['sys']['country'].toString();
  }
}
