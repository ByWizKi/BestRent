import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:best_rent/views/screens/position_screen.dart';
import 'package:best_rent/views/screens/pick_up_datetime_screen.dart';

void main() {
  group('UserLocationPage Tests', () {
    testWidgets('Should display initial UI elements', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: UserLocationPage()));

      // Vérifiez si les éléments UI initiaux sont présents
      expect(find.byType(ElevatedButton), findsNWidgets(2)); // Assurez-vous d'avoir deux boutons maintenant
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('Navigation to PickupDateScreen works', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: UserLocationPage()));

      // Simulez l'appui sur le nouveau bouton
      await tester.tap(find.text('Valider'));
      await tester.pumpAndSettle(); // Attendre que toutes les animations se terminent

      // Vérifiez si le PickupDateTimeScreen est affiché
      expect(find.byType(PickUpDateTimeScreen), findsOneWidget);
    });

  });
}
