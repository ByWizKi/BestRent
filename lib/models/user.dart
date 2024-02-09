// ignore_for_file: unnecessary_getters_setters

class User {
  int _age;
  double _longitude;
  double _latitude;
  String _city;
  DateTime _pickUpDate;
  DateTime _dropOffDate;

  User({
    int age = 0,
    required double longitude,
    required double latitude,
    required String city,
  })  : _age = age,
        _longitude = longitude,
        _latitude = latitude,
        _city = city,
        _pickUpDate = DateTime.now(),
        _dropOffDate = DateTime.now().add(Duration(days: 1));

  // Getters
  int get age => _age;
  double get longitude => _longitude;
  double get latitude => _latitude;
  String get city => _city;
  DateTime get pickUpDate => _pickUpDate;
  DateTime get dropOffDate => _dropOffDate;

  // Setters
  set age(int value) => _age = value;
  set longitude(double value) => _longitude = value;
  set latitude(double value) => _latitude = value;
  set city(String value) => _city = value;
  set pickUpDate(DateTime value) => _pickUpDate = value;
  set dropOffDate(DateTime value) => _dropOffDate = value;
}