import 'package:best_rent/views/screens/splash_screen.dart'; // Importez SplashScreen correctement
import 'package:flutter/material.dart';

void main() => runApp(BestRentApp());

class BestRentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Best Rent',
      home: SplashScreen(), // Démarre avec SplashScreen
    );
  }
}
