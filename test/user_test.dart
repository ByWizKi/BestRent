import 'package:flutter_test/flutter_test.dart';
import 'package:best_rent/models/user.dart'; 

void main() {
  group('User Accessors and Mutators', () {
    late User user;

    setUp(() {
      user = User(
        age: 30,
        longitude: 40.7128,
        latitude: -74.0060,
        city: 'New York',
      );
    });

    test('should allow reading and modifying the age', () {
      expect(user.age, 30);
      user.age = 25;
      expect(user.age, 25);
    });

    test('should allow reading and modifying the longitude and latitude', () {
      expect(user.longitude, 40.7128);
      expect(user.latitude, -74.0060);
      user.longitude = 34.0522; // Example: Los Angeles longitude
      user.latitude = -118.2437; // Example: Los Angeles latitude
      expect(user.longitude, 34.0522);
      expect(user.latitude, -118.2437);
    });

    test('should allow reading and modifying the city', () {
      expect(user.city, 'New York');
      user.city = 'Los Angeles';
      expect(user.city, 'Los Angeles');
    });

    test('should allow reading and modifying the pickUpDate and dropOffDate', () {
      final newPickUpDate = DateTime.now().add(Duration(days: 5));
      final newDropOffDate = DateTime.now().add(Duration(days: 10));
      expect(user.pickUpDate.day, DateTime.now().day);
      expect(user.dropOffDate.day, DateTime.now().add(Duration(days: 1)).day);
      user.pickUpDate = newPickUpDate;
      user.dropOffDate = newDropOffDate;
      expect(user.pickUpDate, newPickUpDate);
      expect(user.dropOffDate, newDropOffDate);
    });
  });
}
