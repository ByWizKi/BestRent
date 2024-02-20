import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:best_rent/controllers/user_controller.dart';
import 'package:best_rent/models/user.dart';

class MockUser extends Mock implements User {
  @override
  Future<void> setCoordinatesFromCity(String city) => super.noSuchMethod(
        Invocation.method(#setCoordinatesFromCity, [city]),
        returnValue: Future<void>.value(),
        returnValueForMissingStub: Future<void>.value(),
      );
}

void main() {
  group('UserController Tests', () {
    test('Update coordinates from city updates user data', () async {
      var mockUser = MockUser();
      var userController = UserController(mockUser);

      // Appel de la méthode
      await userController.updateCoordinatesFromCity('Paris');

      // Vérifiez si la méthode a été appelée
      verify(mockUser.setCoordinatesFromCity('Paris')).called(1);
    });

    // Ajoutez d'autres tests...
  });
}
