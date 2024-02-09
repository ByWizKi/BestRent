// fichier: test/views/pick_up_datetime_screen_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:best_rent/views/screens/pick_up_datetime_screen.dart'; // Mettez à jour le chemin d'accès
import 'package:best_rent/views/screens/drop_off_datetime_screen.dart'; // Mettez à jour le chemin d'accès

void main() {
  testWidgets('PickUpDateTimeScreen has a button that navigates to DropOffDateTimeScreen', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: PickUpDateTimeScreen()));

    // Vérifiez si le bouton est présent
    expect(find.byType(ElevatedButton), findsOneWidget);

    // Appuyez sur le bouton
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle(); // Attendre la fin des animations

    // Vérifiez si l'écran DropOffDateTimeScreen est affiché après l'appui sur le bouton
    expect(find.byType(DropOffDateTimeScreen), findsOneWidget);
  });
}
