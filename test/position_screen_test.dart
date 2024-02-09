// fichier: test/views/position_screen_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:best_rent/views/screens/pick_up_datetime_screen.dart'; // Mettez à jour le chemin d'accès
import 'package:best_rent/views/screens/position_screen.dart'; // Mettez à jour le chemin d'accès

void main() {
  testWidgets('PositionScreen has a button that navigates to PickUpDateTimeScreen', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: PositionScreen()));

    // Vérifiez si le bouton est présent
    expect(find.byType(ElevatedButton), findsOneWidget);

    // Appuyez sur le bouton
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle(); // Attendre la fin des animations

    // Vérifiez si l'écran PickUpDateTimeScreen est affiché après l'appui sur le bouton
    expect(find.byType(PickUpDateTimeScreen), findsOneWidget);
  });
}
