import 'package:best_rent/models/car.dart';
import 'package:best_rent/views/screens/car_details_screen.dart';
import 'package:best_rent/views/screens/edit_request_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // Simuler une liste de voitures pour l'exemple
  final List<CarRental> cars = [
    CarRental(
      vehicleId: '1',
      vehicleName: 'Toyota Corolla',
      group: 'Compact',
      transmission: 'Automatic',
      fuelPolicy: 'Full to Full',
      imageUrl: 'https://example.com/toyota_corolla.jpg',
      seats: 5,
      airbags: 2,
      suitcases: {'small': 2, 'large': 1},
      price: 150.0,
      currency: 'USD',
      deposit: 200.0,
      supplierName: 'Best Rentals',
      supplierRating: '4.5',
      pickupInstructions: 'Office at the airport.',
      dropoffInstructions: 'Return to the same location.',
    ),
    CarRental(
      vehicleId: '2',
      vehicleName: 'Ford Focus',
      group: 'Economy',
      transmission: 'Manual',
      fuelPolicy: 'Full to Full',
      imageUrl: 'https://example.com/ford_focus.jpg',
      seats: 5,
      airbags: 2,
      suitcases: {'small': 1, 'large': 2},
      price: 120.0,
      currency: 'USD',
      deposit: 150.0,
      supplierName: 'City Car Rentals',
      supplierRating: '4.2',
      pickupInstructions: 'Meet & Greet at the terminal.',
      dropoffInstructions: 'Return to the same location.',
    ),
    // Ajoutez d'autres objets CarRental selon vos besoins
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        automaticallyImplyLeading: false, // Désactiver le bouton de retour
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(cars.length, (index) {
            final car = cars[index];
            return Card(
              child: ListTile(
                title: Text('Vehicle: ${car.vehicleName}'),
                subtitle: Text('Description: ${car.price}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CarDetailsScreen(carRental: car),
                    ),
                  );
                },
              ),
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const EditScreen()),
          );
        },
        tooltip: 'Edit Items',
        child: const Icon(Icons.edit),
      ),
    );
  }
}
