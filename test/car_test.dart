import 'package:best_rent/models/car.dart'; // Mettez à jour le chemin d'accès
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CarRental', () {
    test('fromJson creates correct instance from JSON', () {
      final json = {
        "vehicle_id": "1",
        "vehicle_info": {
          "v_name": "Toyota Corolla",
          "group": "Economy",
          "transmission": "Automatic",
          "fuel_policy": "Full to Full",
          "image_url": "https://example.com/image.jpg",
          "seats": "5",
          "airbags": "2",
          "suitcases": {"small": 2, "large": 1},
        },
        "pricing_info": {
          "price": 150.0,
          "currency": "USD",
          "deposit": 200.0,
        },
        "supplier_info": {
          "name": "Best Rentals",
          "rating": {"average": "4.5"},
          "pickup_instructions": "Office at the airport.",
          "dropoff_instructions": "Return to the same location.",
        },
      };

      final carRental = CarRental.fromJson(json);

      expect(carRental.vehicleId, "1");
      expect(carRental.vehicleName, "Toyota Corolla");
      expect(carRental.group, "Economy");
      expect(carRental.transmission, "Automatic");
      expect(carRental.fuelPolicy, "Full to Full");
      expect(carRental.imageUrl, "https://example.com/image.jpg");
      expect(carRental.seats, 5);
      expect(carRental.airbags, 2);
      expect(carRental.suitcases, {"small": 2, "large": 1});
    });

    test('fromJsonList creates a list of CarRental from JSON list', () {
      final jsonList = [
        {
          "vehicle_id": "1",
          // Etc
        },
        {
          "vehicle_id": "2",
          // Etc
        },
      ];

      final carsList = CarRental.fromJsonList(jsonList);

      expect(carsList.length, 2);
      expect(carsList[0].vehicleId, "1");
      expect(carsList[1].vehicleId, "2");
      // Etc
    });
  });
}
