import 'package:best_rent/models/user.dart'; // Remplacez par le chemin correct vers votre classe User.
import 'package:test/test.dart';

void main() {
  group('User tests', () {
    late User user;
    setUp(() {
      // Initialiser l'utilisateur avant chaque test
      user = User(longitude: 0.0, latitude: 0.0);
    });

    test('Initial age should be 18', () {
      expect(user.age, 18);
    });

    test('Setting age to a positive value', () {
      user.age = 25;
      expect(user.age, 25);
    });

    test('Setting age to a negative value should throw an error', () {
      expect(() => user.age = -5, throwsA(isA<ArgumentError>()));
    });

    test('Setting datePickUp to a future date', () {
      var futureDate = DateTime.now().add(const Duration(days: 2));
      user.datePickUp = futureDate;
      expect(user.datePickUp, futureDate);
    });

    test('Setting datePickUp to a past date should throw an error', () {
      var pastDate = DateTime.now().subtract(const Duration(days: 1));
      expect(() => user.datePickUp = pastDate, throwsException);
    });

    test('coordinatesToCity returns a valid city name', () async {
      // Assurez-vous d'avoir les bonnes coordonnées pour le test
      user.longitude = -0.1278; // Longitude de Londres
      user.latitude = 51.5074; // Latitude de Londres

      var cityName = await user.coordinatesToCity();
      expect(cityName, isNotNull);

      // Imprimer le nom de la ville si le test réussit
      // ignore: avoid_print
      print('La ville trouvée est : $cityName');
    });
  });

  test('Mise à jour des coordonnées pour une ville valide', () async {
    User user = User(longitude: 0.0, latitude: 0.0);
    await user.setCoordinatesFromCity('Paris');

    print('Latitude: ${user.latitude}, Longitude: ${user.longitude}');

    // Vérifiez que les coordonnées ont été mises à jour.
    // Ces valeurs sont des exemples et doivent être ajustées en fonction des résultats réels attendus.
    expect(user.latitude, isNot(0.0));
    expect(user.longitude, isNot(0.0));
  });
}
