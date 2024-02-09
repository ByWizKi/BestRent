// fichier: test/views/home_screen_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:best_rent/views/screens/home_screen.dart'; // Mettez à jour le chemin d'accès

void main() {
  testWidgets('HomeScreen displays cards and an edit button', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomeScreen()));

    // Vérifiez si les cartes sont présentes
    expect(find.byType(Card), findsNWidgets(10));

    // Vérifiez si le bouton Edit est présent
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.text('Edit'), findsOneWidget);
  });
}
