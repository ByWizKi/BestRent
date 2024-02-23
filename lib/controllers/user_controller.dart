import 'package:best_rent/models/user.dart';
import 'package:geolocator/geolocator.dart';

class UserController {
  User user;

  UserController(this.user);

  Future<void> updateCoordinatesFromDevice() async {
    Position position = await _determinePosition();
    user.longitude = position.longitude;
    user.latitude = position.latitude;
  }

  Future<void> updateCoordinatesFromCity(String city) async {
    await user.setCoordinatesFromCity(city);
  }

  Future <List<String>> getInfoCity(String city) async {
    return await user.getInfoCity(city); 
  }
  
  /* Fonction non fini utiliser a voir pour la v2
  Future<List<String>> updateCoordinatesFromCityList(String city) async {
    return await user.setCoordinatesFromCityList(city);
  }
  */

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Les services de localisation sont désactivés.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Les permissions de localisation sont refusées');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Les permissions de localisation sont définitivement refusées, nous ne pouvons pas demander les permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }
}
