import 'package:best_rent/views/screens/splash_screen.dart'; // Importez SplashScreen correctement
import 'package:flutter/material.dart';

void main() => runApp(const BestRentApp());

class BestRentApp extends StatelessWidget {
  const BestRentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Best Rent',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // Démarre avec SplashScreen
      
    );
  }
}
