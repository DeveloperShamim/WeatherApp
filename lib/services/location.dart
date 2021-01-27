import 'package:geolocator/geolocator.dart';

class GetLocation {
   double latitude ;
   double longitude ;
  Position position;

  Future<void> getLocation() async {
    try {
      position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    } catch (e) {
      print(e);
    }

    latitude = position.latitude;
    
    longitude = position.longitude;
    
  }
}
