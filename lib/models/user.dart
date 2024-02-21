// ignore_for_file: unnecessary_getters_setters, avoid_print

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

/// Classe User pour représenter un utilisateur avec ses informations géographiques et temporelles.
class User {
  int _age = 18;
  double _longitude;
  double _latitude;
  DateTime _datePickUp = DateTime.now();
  DateTime _dateDropOff = DateTime.now().add(const Duration(days: 1));

  /// Construit un [User] avec la [longitude] et la [latitude] spécifiées.
  User({required double longitude, required double latitude})
      : _longitude = longitude,
        _latitude = latitude;

  /// Obtient l'âge de l'utilisateur.
  int get age => _age;

  /// Obtient la date de prise en charge.
  DateTime get datePickUp => _datePickUp;

  /// Obtient la date de retour.
  DateTime get dateDropOff => _dateDropOff;

  /// Obtient la longitude de l'utilisateur.
  double get longitude => _longitude;

  /// Obtient la latitude de l'utilisateur.
  double get latitude => _latitude;

  /// Définit la date de prise en charge.
  /// Lève une exception si la date est dans le passé.
  set datePickUp(DateTime value) {
    if (value.isBefore(DateTime.now())) {
      throw Exception(
          'La date de prise en charge ne peut pas être dans le passé.');
    }
    _datePickUp = value;
  }

  /// Définit la date de retour.
  /// Lève une exception si la date est avant la date de prise en charge.
  set dateDropOff(DateTime value) {
    if (value.isBefore(_datePickUp)) {
      throw Exception(
          'La date de retour doit être après la date de prise en charge.');
    }
    _dateDropOff = value;
  }

  /// Définit l'âge de l'utilisateur.
  /// Lève une exception si l'âge est négatif.
  set age(int value) {
    if (value > 0) {
      _age = value;
    } else {
      throw ArgumentError("L'âge doit être positif");
    }
  }

  /// Définit la longitude de l'utilisateur.
  set longitude(double value) => _longitude = value;

  /// Définit la latitude de l'utilisateur.
  set latitude(double value) => _latitude = value;

  /// Convertit les coordonnées géographiques en nom de ville.
  /// Retourne le nom de la ville ou lève une exception si la requête échoue.
  Future<String?> coordinatesToCity() async {
    var url = Uri.parse(
        'https://nominatim.openstreetmap.org/reverse?format=json&lat=$_latitude&lon=$_longitude');
    print(url);
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print (data['address']);
        return data['address']['city'] ?? data['address']['town'] ?? data['address']['village'] ?? 'Ville inconnue';

      } else {
        print('Erreur de réponse : ${response.statusCode}');
        return 'Échec de la récupération du nom de la ville';
      }
    } catch (e) {
      print('Exception attrapée : $e');
      return 'Erreur lors de la récupération du nom de la ville';
    }
  }

  /// Définit les coordonnées de l'utilisateur en fonction du nom de la ville.
  /// Utilise l'API Nominatim pour le géocodage inversé.
  ///
  /// [city] Le nom de la ville pour laquelle récupérer les coordonnées.
  Future<void> setCoordinatesFromCity(String city) async {
    var url = Uri.parse(
        'https://nominatim.openstreetmap.org/search?city=$city&format=json&limit=1'); 
    
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {

        var data = json.decode(response.body);
        if (data.isNotEmpty) {
          _latitude = double.parse(data[0]['lat']);
          _longitude = double.parse(data[0]['lon']);
        } else {
          print('Aucun résultat trouvé pour cette ville');
        }
      } else {
        print('Erreur de réponse : ${response.statusCode}');
      }
    } catch (e) {
      print('Exception attrapée : $e');
    }
  }

    Future<List<String>> setCoordinatesFromCityList(String city) async {
    var url = Uri.parse(
        'https://nominatim.openstreetmap.org/search?city=$city&format=json&limit=5'); 
    
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {

        var data = json.decode(response.body);
        if (data.isNotEmpty) {
          return data.map((e) => e['display_name']).toList();
        } else {
          print('Aucun résultat trouvé pour cette ville');
          return [];
        }
      } else {
        print('Erreur de réponse : ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Exception attrapée : $e');
      return [];
    } 
  }
}
