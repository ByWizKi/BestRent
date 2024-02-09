class CarRental {
  // Identifiants et caractéristiques du véhicule
  final String vehicleId;
  final String vehicleName;
  final String group;
  final String transmission;
  final String fuelPolicy;
  final String imageUrl;
  final int seats;
  final int airbags;
  final Map<String, dynamic> suitcases;

  // Informations sur les prix
  final double price;
  final String currency;
  final double deposit;

  // Informations sur le fournisseur
  final String supplierName;
  final String supplierRating;

  // Instructions pour la prise en charge et le retour
  final String pickupInstructions;
  final String dropoffInstructions;
  
  CarRental({
    required this.vehicleId,
    required this.vehicleName,
    required this.group,
    required this.transmission,
    required this.fuelPolicy,
    required this.imageUrl,
    required this.seats,
    required this.airbags,
    required this.suitcases,
    required this.price,
    required this.currency,
    required this.deposit,
    required this.supplierName,
    required this.supplierRating,
    required this.pickupInstructions,
    required this.dropoffInstructions,
  });

  // Constructeur pour créer un objet CarRental à partir d'un objet JSON
  factory CarRental.fromJson(Map<String, dynamic> json) {
    final vehicleInfo = json['vehicle_info'];
    final pricingInfo = json['pricing_info'];
    final supplierInfo = json['supplier_info'];
    
    return CarRental(
      vehicleId: json['vehicle_id'],
      vehicleName: vehicleInfo['v_name'].trim(),
      group: vehicleInfo['group'],
      transmission: vehicleInfo['transmission'],
      fuelPolicy: vehicleInfo['fuel_policy'],
      imageUrl: vehicleInfo['image_url'],
      seats: int.parse(vehicleInfo['seats']),
      airbags: vehicleInfo['airbags'],
      suitcases: vehicleInfo['suitcases'],
      price: pricingInfo['price'],
      currency: pricingInfo['currency'],
      deposit: pricingInfo['deposit'],
      supplierName: supplierInfo['name'],
      supplierRating: supplierInfo['rating']['average'].toString(),
      pickupInstructions: supplierInfo['pickup_instructions'],
      dropoffInstructions: supplierInfo['dropoff_instructions'],
    );
  }

  // Méthode pour convertir une liste JSON en une liste d'objets CarRental
  static List<CarRental> fromJsonList(List<dynamic> listJson) {
    return listJson.map((json) => CarRental.fromJson(json)).toList();
  }
}

