// fichier: test/views/drop_off_datetime_screen_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:best_rent/views/screens/drop_off_datetime_screen.dart'; 
import 'package:best_rent/views/screens/loading_screen.dart';

void main() {
  testWidgets('DropOffDateTimeScreen has a button that navigates to LoadingScreen', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: DropOffDateTimeScreen()));

    // Vérifiez si le bouton est présent
    expect(find.byType(ElevatedButton), findsOneWidget);

    // Appuyez sur le bouton
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle(); // Attendre la fin des animations

    // Vérifiez si l'écran LoadingScreen est affiché après l'appui sur le bouton
    expect(find.byType(LoadingScreen), findsOneWidget);
  });
}
