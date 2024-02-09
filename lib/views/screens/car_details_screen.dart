// car_details_screen.dart
import 'package:best_rent/models/car.dart'; // Assurez-vous que le chemin d'accès est correct
import 'package:flutter/material.dart';

class CarDetailsScreen extends StatelessWidget {
  final CarRental carRental;

  const CarDetailsScreen({super.key, required this.carRental});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(carRental.vehicleName),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Model: ${carRental.vehicleName}"),
            ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Go back!')),
          ],
        ),
      ),
    );
  }
}
