// fichier: lib/views/pick_up_datetime_screen.dart
import 'package:best_rent/views/screens/drop_off_datetime_screen.dart';
import 'package:flutter/material.dart';

class PickUpDateTimeScreen extends StatelessWidget {
  const PickUpDateTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Pick-Up Date & Time'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Pick-Up Date & Time Screen',
                style: TextStyle(fontSize: 24)),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DropOffDateTimeScreen()));
              },
              child: const Text('Go to Drop-Off Date & Time'),
            ),
          ],
        ),
      ),
    );
  }
}
