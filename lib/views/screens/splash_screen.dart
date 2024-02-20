// fichier: lib/screens/splash_screen.dart
import 'package:best_rent/views/screens/position_screen.dart'; 
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), () {});

    // Naviguer vers PositionScreen et supprimer toutes les routes précédentes
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => UserLocationPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Best Rent',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            CircularProgressIndicator(), // Indicateur de chargement
          ],
        ),
      ),
    );
  }
}
