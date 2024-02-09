// fichier: lib/views/position_screen.dart

import 'package:best_rent/views/screens/pick_up_datetime_screen.dart'; // Assurez-vous d'importer correctement PickUpDateTimeScreen
import 'package:flutter/material.dart';

class PositionScreen extends StatelessWidget {
  const PositionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Position'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Position Screen', style: TextStyle(fontSize: 24)),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PickUpDateTimeScreen()));
              },
              child: const Text('Go to Pick Up Date & Time'),
            ),
          ],
        ),
      ),
    );
  }
}
