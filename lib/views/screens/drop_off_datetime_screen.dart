
import 'package:flutter/material.dart';
import 'package:best_rent/views/screens/loading_screen.dart'; // Assurez-vous d'importer correctement LoadingScreen

class DropOffDateTimeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Drop-Off Date & Time'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Drop-Off Date & Time Screen', style: TextStyle(fontSize: 24)),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoadingScreen()));
              },
              child: Text('Proceed to Loading'),
            ),
          ],
        ),
      ),
    );
  }
}
