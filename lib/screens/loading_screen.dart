
import 'package:clima/screens/modify_location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

//import 'package:clima/screens/loading_screen.dart';

import 'package:clima/services/networking.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;
  //String discription;
  String apiId = '5d418330d3751158f90a334015d40f00';

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    GetLocation location = GetLocation();
    await location.getLocation();

    Networking networking = Networking(
        url:
            'https://api.openweathermap.org/data/2.5/weather?lat=23.777176&lon=90.399452&appid=$apiId&units=metric');
    var weatherData = await networking.getData();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context){
          return ModifyLocationScreen(data: weatherData,);
        }
          ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[

              FractionallySizedBox(
                heightFactor: 1,
                alignment: Alignment.topCenter,
                child: Container(
                
                  color: Colors.white,
                  child: FlareActor('images/earthson.flr',fit: BoxFit.cover,animation: "Preview2",),
                ),
              ),
              FractionallySizedBox(
                heightFactor: .50,
              
                alignment: Alignment.bottomCenter,
                child: SpinKitDoubleBounce(
                  color: Colors.blue,
                  size: 100.0,
                  duration: const Duration(milliseconds: 1000),
                ),
              ),
              
            ],
          )),
    );
  }
}
