// ignore_for_file: avoid_print

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

  Future<List<String>> getInfoCity(String city) async {
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

  Future<String?> setDateTime(
      DateTime dateTimePickup, DateTime dateTimeDropOff) async {
    String? messageLog;
    try {
      if (dateTimePickup.isAfter(dateTimeDropOff)) {
        messageLog =
            'La date de prise en charge doit être inférieure à la date de retour';
      } else if (dateTimePickup
          .isBefore(DateTime.now().subtract(const Duration(minutes: 2)))) {
        messageLog =
            'L\'heure de prise en charge doit être supérieure à l\'heure d\'aujourd\'hui';
      } else if (dateTimePickup
          .isBefore(DateTime.now().subtract(const Duration(days: 1)))) {
        messageLog =
            'La date de prise en charge doit être supérieure à la date d\'aujourd\'hui';
      } else {
        user.datePickUp = dateTimePickup;
        user.dateDropOff = dateTimeDropOff;
        messageLog = "Les dates ont éte prise en charge avec succes";
      }
    } catch (e) {
      messageLog = e.toString();
    }
    return messageLog;
  }
}

// On declare le controller comme singleton
UserController userController = UserController(User(longitude: 0.0, latitude: 0.0));
